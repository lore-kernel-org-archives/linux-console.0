From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Finding executables
Date: Fri, 9 Jan 2004 11:04:16 +0100
Sender: linux-console-owner@vger.kernel.org
Message-ID: <20040109100416.GQ14285@lug-owl.de>
References: <btlhcu$ruh$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ubEh+iSFTuEFLNSo"
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <btlhcu$ruh$1@sea.gmane.org>
List-Id: <linux-console.vger.kernel.org>
To: linux-console@vger.kernel.org


--ubEh+iSFTuEFLNSo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-01-08 22:20:42 -0800, Jeffrey Holle <jeff.holle@verizon.net>
wrote in message <btlhcu$ruh$1@sea.gmane.org>:
> Is there a way to get a list of just the executable files that are=20
> within a directory tree?

$ find / -type f -perm +111

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--ubEh+iSFTuEFLNSo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE//nygHb1edYOZ4bsRAiMhAJsGP6hF0fC/o9DJu6kcz8ZwKjmfNQCfTwFc
LtnsZgMbbIbxrWyTqE/di08=
=s9OE
-----END PGP SIGNATURE-----

--ubEh+iSFTuEFLNSo--
