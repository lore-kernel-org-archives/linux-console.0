From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: console / fbdev: fbcon support for bits_per_pixel = 1?
Date: Sun, 15 Jun 2014 10:57:48 +0200
Message-ID: <CAMuHMdXMWFXG99iiuk1j=0DaQbWbmcpGxaTfDNX8o+Dz7MH7aw@mail.gmail.com>
References: <539C1C1F.5060904@biereigel.de>
	<20140614143550.59367463@neptune.home>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=JLVWejUkzK5iut6EHuqyt2SHBsbGznR0v8RPR9RQg20=;
        b=jwvhqFpNdxrJh26V+mQxkuiI6V1EEbFakOJWXikoGHbvwSz8GWzKx87ytTr9SYZGCw
         o/PNV2hrPNyRLrhy9jBqyoE9iSBwJQ0rJxcP9+cZeUm9z+Y5uLkArvQaHvpxQsPF1Y2b
         g05QIOyZYrixyKMeSceiPxnUiNv21zlKNBsLBW+XR4wGYX/IaOLamBUD0TkPVC2T+nci
         14eCZ2YWXU3o+FiMZgMCmSEA3ZZa6GRpfsGHKuTnHVywWP0ElpT27ZxxrzQPBdUdYMVa
         +5qCTQIZdNFYhxRX+YP6vgRoU52fK9tOrx4ZnhmBBnGqPY4QtOpGfCcXGzBi4Z5b07b7
         xmnw==
In-Reply-To: <20140614143550.59367463@neptune.home>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Cc: Stefan Biereigel <stefan@biereigel.de>, Linux Fbdev development list <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org, brian <brian.fonfara@gmx.de>

On Sat, Jun 14, 2014 at 2:35 PM, Bruno Pr=C3=A9mont
<bonbons@linux-vserver.org> wrote:
>> Is this behavior intended or are we triggering a bug here (that no o=
ne noticed, because
>> who in the world uses monochrome framebuffers these days..). I can't=
 see any comments that
>> monochrome consoles should not work with 1 bit per pixel. See the co=
de below if you spot
>> some errors (ignore some missing error handling and mediocre style f=
or now, please).
>
> fbcon on 1bpp frambuffer worked for me with picoLCD (though I have fo=
und no userspace

I'm not aware of 1 bpp frame buffer consoles being broken.

> framebuffer application willing to operate at 1bpp).

Xfbdev does. I revived support for monochrome (and Atari/Amiga-style
bitplanes) last year.

And of course
https://git.kernel.org/cgit/linux/kernel/git/geert/fbtest.git/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
