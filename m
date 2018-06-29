From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 2/3] vt: introduce unicode mode for /dev/vcs
Date: Fri, 29 Jun 2018 10:15:26 +0200
Message-ID: <CAMuHMdUmC+uiKTEMotB83A86E1wEYrNF2qPf3kDACaW27D_NbA@mail.gmail.com>
References: <20180627035642.8561-1-nicolas.pitre@linaro.org> <20180627035642.8561-3-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627035642.8561-3-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dave@mielke.cc, Samuel Thibault <samuel.thibault@ens-lyon.org>, Adam Borowski <kilobyte@angband.pl>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

Hi Nicolas,

On Wed, Jun 27, 2018 at 7:03 AM Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> Now that the core vt code knows how to preserve unicode values for each
> displayed character, it is then possible to let user space access it via
> /dev/vcs*.
>
> Unicode characters are presented as 32 bit values in native endianity
> via the /dev/vcsu* devices, mimicking the simple /dev/vcs* devices.
> Unicode with attributes (similarly to /dev/vcsa*) is not supported at
> the moment.
>
> Data is available only as long as the console is in UTF-8 mode. ENODATA
> is returned otherwise.
>
> This was tested with the latest development version (to become
> version 5.7) of BRLTTY. Amongst other things, this allows ⠋⠕⠗ ⠞⠓⠊⠎
> ⠃⠗⠁⠊⠇⠇⠑⠀⠞⠑⠭⠞⠀to appear directly on braille displays regardless of the
> console font being used.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Thanks for your patch (which is now in tty-next).

> --- a/drivers/tty/vt/vc_screen.c
> +++ b/drivers/tty/vt/vc_screen.c

> @@ -51,6 +57,26 @@
>
>  #define CON_BUF_SIZE (CONFIG_BASE_SMALL ? 256 : PAGE_SIZE)
>
> +/*
> + * Our minor space:
> + *
> + *   0 ... 63  glyph mode without attributes
> + *  64 ... 127 unicode mode without attributes
> + * 128 ... 191 glyph mode with attributes
> + * 192 ... 255 unused (reserved for unicode with attributes)
> + *
> + * This relies on MAX_NR_CONSOLES being  <= 63, meaning 63 actual consoles
> + * with minors 0, 64, 128 and 192 being proxies for the foreground console.
> + */
> +#if MAX_NR_CONSOLES > 63
> +#warning "/dev/vcs* devices may not accommodate more than 63 consoles"
> +#endif

MAX_NR_CONSOLES is part of UAPI, so it cannot change.
It doesn't hurt to have an explicit check here, though.

However, looking into that I noticed include/uapi/linux/vt.h says:

    #define MAX_NR_CONSOLES 63      /* serial lines start at 64 */

But that seems to apply to /dev/tty* (major 4), not /dev/vcs* (major 7),
so you're safe.

> +
> +#define console(inode)         (iminor(inode) & 63)
> +#define use_unicode(inode)     (iminor(inode) & 64)
> +#define use_attributes(inode)  (iminor(inode) & 128)

I guess you need to update Documentation/admin-guide/devices.txt, and
add /dev/vcsu*?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
