From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: feeding a script from standard input
Date: Wed, 28 Jan 2004 15:05:37 +0100
Sender: linux-console-owner@vger.kernel.org
Message-ID: <20040128140536.GW8401@lug-owl.de>
References: <bv4v6h$rlc$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zHuqcmpxcmc4O8tc"
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bv4v6h$rlc$1@sea.gmane.org>
List-Id: <linux-console.vger.kernel.org>
To: linux-console@vger.kernel.org


--zHuqcmpxcmc4O8tc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-01-26 22:04:16 -0800, Jeffrey Holle <jeff.holle@verizon.net>
wrote in message <bv4v6h$rlc$1@sea.gmane.org>:
> I have a script, call it genpyste that looks like this:
>=20
> 	#!/bin/sh
> 	pyste --out=3D. --multiple --module=3Dmymodule Parameter.pyste
>=20
> The problem with it is that this is just a start of it.
> When I'm done, there will need to be about 30 parameters like=20
> Parameter.pyste.
>=20
> I'm wondering if I can do something like this from the command line:
>=20
> 	ls *.pyste | ./genpyste
>=20
> What, if anything, can be done to the genpyste script to work like this?

Why not make it like this:

#!/bin/sh
pyste --out=3D. --multiple --module=3Dmymodule "$*"

and then call it like
$ ./genpystr *.pyste

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--zHuqcmpxcmc4O8tc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAF8GwHb1edYOZ4bsRAjQ5AKCMK0HQ1H6LAgh4HleWXuA3A2mgtQCfc3ul
5XksQP5yaC+obcMzbmNFlQI=
=4qPI
-----END PGP SIGNATURE-----

--zHuqcmpxcmc4O8tc--
