From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 10:58:23 +0100
Message-ID: <20101129095823.GQ5142@const.bordeaux.inria.fr>
References: <1290941875.13526.15.camel@cai.gentoo> <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu> <1290951770.13526.18.camel@cai.gentoo> <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com> <20101129020610.7ea7c79e.lisa@ltmnet.com> <1290961207.13526.31.camel@cai.gentoo> <20101128194624.GP2767@thunk.org> <1290993244.877.3.camel@cai.gentoo> <20101129085829.GM5142@const.bordeaux.inria.fr> <1291023157.9785.2.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1291023157.9785.2.camel@cai.gentoo>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Microcai <microcai@fedoraproject.org>
Cc: Ted Ts'o <tytso@mit.edu>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Microcai, le Mon 29 Nov 2010 17:32:37 +0800, a =C3=A9crit :
> =E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 09:58 +0100=EF=BC=8CSamuel Thi=
bault=E5=86=99=E9=81=93=EF=BC=9A
> > Microcai, le Mon 29 Nov 2010 09:14:04 +0800, a =C3=A9crit :
> > > Hey, my old patch already did it , and do not break any old stuff=
=2E
> >=20
> > To your knowledge.  IIRC while reading your patch I found a couple =
of
> > things that would most probably break some corner cases, which coul=
d
> > go unnoticed, that's why I proposed to first extend the internal vc
> > content matrix into unicode values, so as to clearly have to upgrad=
e all
> > drivers.
>=20
> I doesn't matter *how to do* .

Concerning breaking existing stuff, yes, it does.

> I have many different kinds of patchs that did it in different ways.
>=20
> What realy matters is that, do we agree that add unicode font support=
 is
> acceptable ?

Simple unicode font (i.e. just go beyond the arbitrary historical-vga
512 glyphs limit for fbcon) might go in.  Double-width is questionable,
but it can probably simple enough to be able to get in (there is alread=
y
some code for it anyway).

But complete unicode support (with arabic ligatures, tibetan
combinations, etc.) won't ever be accepted in the kernel as that's far
too involved in terms of font rendering.  So the userland way needs to
be fixed for these anyway, and then things like chinese will go along..=
=2E

Samuel
