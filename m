From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 10:14:06 +0800
Message-ID: <1290996846.877.23.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <20101129020610.7ea7c79e.lisa@ltmnet.com>
	 <1290961207.13526.31.camel@cai.gentoo> <20101128194624.GP2767@thunk.org>
	 <4CF3081B.9090307@gmail.com>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=CXmu3KtGGpxjp+xyTsVkZ0uamcR7HDZI57BgV30TnR4=;
        b=hfPaoo/SAEA7Hh9HIhoiHYFEGun0OBWS0wiJUs2QmSpAeZT3bNsOfIbYGFywbPfL9z
         wBfyRxNvRC48mr3uGQp7HQuYk3paqUs6ZQtqN0BwLGYJkCbTB8V1DFBI7MkHItWnIPB7
         N1YNTHRRy2uUJ0LCWLdrca3lcJpyBZIX+Atgc=
In-Reply-To: <4CF3081B.9090307@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alexey Gladkov <gladkov.alexey@gmail.com>
Cc: Ted Ts'o <tytso@mit.edu>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

=E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 04:55 +0300=EF=BC=8CAlexey Gladk=
ov=E5=86=99=E9=81=93=EF=BC=9A
> 28.11.2010 22:46, Ted Ts'o wrote:
> > How many people do regular login, development, reading e-mail, etc.=
,
> > on the console?  Very few!
>=20
> Once I broke the euro symbol in the kbd keymaps and got a kick in the
> ass very quickly :). It means that users continue to use the console
> quite active.
>=20
> Another example: I keep getting a new keymaps and console fonts for
> each new kbd release.
>=20
> Maybe not a lot of console users, but more of them than you think.
>=20
> > If the answer is because you hate X, as
> > you've already pointed out, we already have fbterm.  Where is it
> > written that we need to have a full unicode-capable console system?
>=20
> fbterm =E2=80=8Ecan't help in all cases. For example: we have a limit=
ation
> NR_KEYS, which makes it impossible to use keycode > 256 in keymaps.
> I've already received several complaints about it.
>=20

YES, user-space can't always fit! Some function need to be implemented
in kernel. And that's why we have KMS, we have auto cgroup ....

Don't say, hey , hard to implement, all you have to to is apply the
path .. No need to do for you.

If the patch isn't as good as you expected, reject, I'll try better one=
=2E
The thing is, you really should agree that, implementing UNICODE font i=
n
kernel isn't a bad idea.


