From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 11:17:02 +0100
Message-ID: <20101129101702.GS5142@const.bordeaux.inria.fr>
References: <1290951770.13526.18.camel@cai.gentoo> <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com> <20101129020610.7ea7c79e.lisa@ltmnet.com> <1290961207.13526.31.camel@cai.gentoo> <20101128194624.GP2767@thunk.org> <1290993244.877.3.camel@cai.gentoo> <20101129085829.GM5142@const.bordeaux.inria.fr> <1291023157.9785.2.camel@cai.gentoo> <20101129095823.GQ5142@const.bordeaux.inria.fr> <1291025476.9785.5.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1291025476.9785.5.camel@cai.gentoo>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Microcai <microcai@fedoraproject.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Ted Ts'o <tytso@mit.edu>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Microcai, le Mon 29 Nov 2010 18:11:16 +0800, a =C3=A9crit :
> =E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 10:58 +0100=EF=BC=8CSamuel Thi=
bault=E5=86=99=E9=81=93=EF=BC=9A
> > Simple unicode font (i.e. just go beyond the arbitrary historical-v=
ga
> > 512 glyphs limit for fbcon) might go in.  Double-width is
> > questionable,
> > but it can probably simple enough to be able to get in (there is
> > already
> > some code for it anyway).
> >=20
> > But complete unicode support (with arabic ligatures, tibetan
> > combinations, etc.) won't ever be accepted in the kernel as that's =
far
> > too involved in terms of font rendering.  So the userland way needs=
 to
> > be fixed for these anyway, and then things like chinese will go
> > along...
> >=20
> > Samuel=20
>=20
> YES, my patch just include BMP(mostly CJK), not full UNICODE. IF it c=
an
> be included, then I can do more work to make sure it doesn't break ol=
d
> stuff. And it's configurable. users don't have to be forced to use.

It seems you didn't get my point: what is the use of including CJK into
kernel when that won't solve the issue for e.g. arabic, while fixing
fbterm will solve the issue for both arabic and CJK?

Samuel
