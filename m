From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 09:28:03 +0800
Message-ID: <1290994083.877.13.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <20101129020610.7ea7c79e.lisa@ltmnet.com>
	 <1290961207.13526.31.camel@cai.gentoo>  <20101128234634.461daec4@pyx>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=owJPn4jzx+WD2qY99lhdF4NbZz6ICEn+ggI0huULq+I=;
        b=MkTI+cBqdiM8ed7YSiMpCa0EmWNJ6oyxOeLjw3sDVDhSUbJMlQlohuqd4p0gzDWZHK
         PH1tDrlhzMHvAv8Cai6qJUtVCIdmhUs58qzlvSBYzo6Rt++V9XkBI2QhEcG6lGVf6ST4
         97C8yScKfL4OIkg1GkFiYlivMN3aj9tlFlRHE=
In-Reply-To: <20101128234634.461daec4@pyx>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 23:46 +0000=EF=BC=8CAlan Cox=E5=86=
=99=E9=81=93=EF=BC=9A
> Which bit - lots of people own different parts of it, because there i=
s a
> lot of it, and people own different sections of currently ongoing
> projects. Plus the X DRM folks own the KMS framebuffers, various auth=
ors
> own their own low level drivers for each card and so on.
>=20
> I kind of own the drivers/tty/vt* bits.

Don't you see the cosole code ? There is TODO that say , "hey , I need
UNICODE support..."

I'm not breaking old one to introduce new feature, but fix a little BUG
in the TODO list.=20

> I simply don't see how you are going to address the majority of the
> worlds languages in kernel space, all the major ones are too complex =
and
> pango is too big and complex to put in kernel as are the needed font
> renderers. Most of the needed compositing accelerations are also not
> directly exposed in KMS to the console driver as would be needed

Simply drawing characters won't need any hw acceleration. It doesn't
matter if it is slow. KMS and Wayland will make more people work under
console, trust me.

>=20
> Your other problem is mode setting, VESA is on its way out, a lot of
No, VESA will still be here for another decades. Some fb driver conflic=
t
with the X one, even there is a fb driver for you card, you simply won'=
t
use it unless it does not conflict with X one. My PC , for example,
nvidiafb conflict with X one, so I have to use VESA.

> devices today, especially non X86 ones pretty much need X to do any k=
ind
> of video management beyond "here is how the firmware console was
> configured", and indeed many embedded devices don't have an VT code
> enabled at all, just a printk console and possibly ttyprintk, both of
> which may well only be talking to the debug ports
>=20
> Alan

printk console , if redirect to a ttyS? , then the outer Linux world
terminal will do UNICODE handling.=20



--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
