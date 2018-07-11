From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 1/3] vt: preserve unicode values corresponding to
 screen characters
Date: Tue, 10 Jul 2018 17:52:01 -0700
Message-ID: <CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com>
References: <20180627035642.8561-1-nicolas.pitre@linaro.org> <20180627035642.8561-2-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rQNkK2euIJPwF7BL7Vlmy5MsHJgcq4rywadMFS7vafU=;
        b=E+Dr+98I65HtMIFNGeZG6N4sHVplBSADU38AVk1mTPvVHlzlggtT2afubRI6+q3l+g
         txVJjgN86/Mog1BGg91CLbJ8FUcponUOLC0kj5JyqPrN+vDoxQpBvFyIYWz6hkaMK3RP
         rC4BXQRqjktBLMiCtMxhk49gBF7s8gHrwB39zeYQgjDrbreJErXXAH3oWYqOJuNvwyDF
         2+i1phKQSZBkrU7qi1ZT+2Xv3i9IS+iKzmFqm85JEs8FUcrpeC3sUX7lucEVKfzhMLii
         +QPmPksODEHvsOiZN5nxNEIYJBXHeDVWFdvzGrE1WMURmpcouQzN2RT0JqmPuxtpvvOP
         W9yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rQNkK2euIJPwF7BL7Vlmy5MsHJgcq4rywadMFS7vafU=;
        b=TdFwdBC5n+DU0eSXMnw3DQSFh6h1otiUFQj3EPVqsOQsWFsJY5bE9F7cK5VcOfHswE
         /OWpeGL1vz0cZDQt7aYo6nXNpzAROfeehgV9r5PF5o5+tHr1TOf974XLrTBoT31+jAxS
         CB1lRwNZMzhwEqqJKhplTUGTGQzwTIyuM0CVM=
In-Reply-To: <20180627035642.8561-2-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Adam Borowski <kilobyte@angband.pl>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, LKML <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

On Tue, Jun 26, 2018 at 8:56 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> The vt code translates UTF-8 strings into glyph index values and stores
> those glyph values directly in the screen buffer. Because there can only
> be at most 512 glyphs, it is impossible to represent most unicode
> characters, in which case a default glyph (often '?') is displayed
> instead. The original unicode value is then lost.
>
> This patch implements the basic screen buffer handling to preserve unicode
> values alongside corresponding display glyphs.  It is not activated by
> default, meaning that people not relying on that functionality won't get
> the implied overhead.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> Tested-by: Dave Mielke <Dave@mielke.cc>
> Acked-by: Adam Borowski <kilobyte@angband.pl>
> ---
>  drivers/tty/vt/vt.c            | 220 +++++++++++++++++++++++++++++++--
>  include/linux/console_struct.h |   2 +
>  2 files changed, 211 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 1eb1a376a0..7b636638b3 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> [...]
> +static void vc_uniscr_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
> +                            enum con_scroll dir, unsigned int nr)
> +{
> +       struct uni_screen *uniscr = get_vc_uniscr(vc);
> +
> +       if (uniscr) {
> +               unsigned int s, d, rescue, clear;
> +               char32_t *save[nr];

Can you adjust this to avoid the VLA here? I've almost gotten all VLAs
removed from the kernel[1], and this is introducing a new one. :)

Thanks!

-Kees

[1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com

> +
> +               s = clear = t;
> +               d = t + nr;
> +               rescue = b - nr;
> +               if (dir == SM_UP) {
> +                       swap(s, d);
> +                       swap(clear, rescue);
> +               }
> +               memcpy(save, uniscr->lines + rescue, nr * sizeof(*save));
> +               memmove(uniscr->lines + d, uniscr->lines + s,
> +                       (b - t - nr) * sizeof(*uniscr->lines));
> +               memcpy(uniscr->lines + clear, save, nr * sizeof(*save));
> +               vc_uniscr_clear_lines(vc, clear, nr);
> +       }
> +}


-- 
Kees Cook
Pixel Security
