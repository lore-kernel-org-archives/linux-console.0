From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 09:16:39 +0100
Message-ID: <20101129081639.GA5142@const.bordeaux.inria.fr>
References: <1290941875.13526.15.camel@cai.gentoo> <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu> <1290951770.13526.18.camel@cai.gentoo> <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com> <1290954545.13526.27.camel@cai.gentoo> <20101128191152.GV10602@const.famille.thibault.fr> <1290993006.877.0.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1290993006.877.0.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Microcai <microcai@fedoraproject.org>
Cc: "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Microcai, le Mon 29 Nov 2010 09:10:06 +0800, a =C3=A9crit :
> =E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 20:11 +0100=EF=BC=8CSamuel Thi=
bault=E5=86=99=E9=81=93=EF=BC=9A
> > Microcai, le Sun 28 Nov 2010 22:29:05 +0800, a =C3=A9crit :
> > > So, here is the design according to your description  ..=20
> > >=20
> > > JUST export /dev/fb and /dev/pts and /dev/console
> > > The kernel use /dev/console, but invisible.=20
> > > The rest of the world uses /dev/pts
> > >=20
> > > Make init using /dev/fb to display boot message, and agetty runs
> > > on /dev/pts
> >=20
> > Errr, but that already exists, that's fbterm...
>=20
> Every time someone try to implement something , some other guy will j=
ump
> out and say, that already exist, in user-space ..... blablablabla

But isn't that basically what you are describing?

(i.e. what's the use of using a pts and /dev/fb, if not for a userlevel
terminal to actually do the work?)

Samuel
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
