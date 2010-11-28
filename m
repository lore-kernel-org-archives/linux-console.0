From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: VT console need rewrite
Date: Sun, 28 Nov 2010 20:11:52 +0100
Message-ID: <20101128191152.GV10602@const.famille.thibault.fr>
References: <1290941875.13526.15.camel@cai.gentoo> <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu> <1290951770.13526.18.camel@cai.gentoo> <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com> <1290954545.13526.27.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1290954545.13526.27.camel@cai.gentoo>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Microcai <microcai@fedoraproject.org>
Cc: "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Microcai, le Sun 28 Nov 2010 22:29:05 +0800, a =E9crit :
> So, here is the design according to your description  ..=20
>=20
> JUST export /dev/fb and /dev/pts and /dev/console
> The kernel use /dev/console, but invisible.=20
> The rest of the world uses /dev/pts
>=20
> Make init using /dev/fb to display boot message, and agetty runs
> on /dev/pts

Errr, but that already exists, that's fbterm...

Samuel
