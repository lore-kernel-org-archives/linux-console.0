From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 09:59:13 +0100
Message-ID: <20101129085913.GN5142@const.bordeaux.inria.fr>
References: <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu> <1290951770.13526.18.camel@cai.gentoo> <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com> <1290954545.13526.27.camel@cai.gentoo> <20101128191152.GV10602@const.famille.thibault.fr> <1290993006.877.0.camel@cai.gentoo> <20101129081639.GA5142@const.bordeaux.inria.fr> <AANLkTinmdRjEkmywaMevN5_A=2N8_pBsOAJj8PoAaznz@mail.gmail.com> <20101129082711.GB5142@const.bordeaux.inria.fr> <1291020805.9785.0.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1291020805.9785.0.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Microcai <microcai@fedoraproject.org>
Cc: "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Microcai, le Mon 29 Nov 2010 16:53:25 +0800, a =C3=A9crit :
> =E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 09:27 +0100=EF=BC=8CSamuel Thi=
bault=E5=86=99=E9=81=93=EF=BC=9A
> > microcai, le Mon 29 Nov 2010 16:20:11 +0800, a =C3=A9crit :
> > > > But isn't that basically what you are describing?
> > > >
> > > > (i.e. what's the use of using a pts and /dev/fb, if not for a u=
serlevel
> > > > terminal to actually do the work?)
> > > >
> > >=20
> > > ok, try run zhcon on pts.  can you do that ?
> >=20
> > zhcon _provides_ a pts, that's what I mean.
>=20
> So you agree zhcon can't run on pts.

Sure. It doesn't make sense. But what zhcon does should be done in
fbterm.

> Then there's dozens of zhcon.

What do you mean by this?

Samuel
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
