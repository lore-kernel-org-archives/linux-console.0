From: renato.oferenda@gmail.com
Subject: Re: Updates on "mv", "cp" commands
Date: Sun, 1 Nov 2009 13:20:46 +0100
Message-ID: <20091101122046.GA5336@bio05.biowulf.net>
References: <86ca47940910310550s87a6140s377a3d752979037@mail.gmail.com>
 <86ca47940910311730ta75d2f3p56c3e65699c94696@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=jV9aCshibBJlr1t2xEIjtepAxV+OTAwBYPp4eWtnneo=;
        b=dDLc2skgeMB3lzajv7sGNC/qhJlZkzwIRLG7FQOtguJ1Kdkv00XKKwlZazJxINF4NE
         l4BR9mvbeXzFYw/y4q0t966P1qKOy13S1tI0MpHJE3k/vW7UCKYp3MhrhlNAiovS3fRh
         ZF896aE/CLV72/OCJK/RQjmAoYOckgLKS7XcY=
Content-Disposition: inline
In-Reply-To: <86ca47940910311730ta75d2f3p56c3e65699c94696@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: "BRAGA, Bruno" <bruno.braga@gmail.com>
Cc: linux-console@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bruno!

On Sun, Nov 01, 2009 at 09:30:21AM +0900, BRAGA, Bruno wrote:
> I looked for the code in the kernel source but I did not find any. I
> could find some sources on the GNU OS, but I am not sure if that's the
> right place (probably not).

A good place to start anything in linux is at the man page for the software=
=2E ("man" =3D=3D shorthand for "manual").

If you "man cp" and then "man mv" you'll see on the last line for each man =
page that they both belong to the GNU coreutils package. (http://www.gnu.or=
g/software/coreutils/).

Good luck!

--=20
Renato =E5=AD=97. []'s, RCB.

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkrtfR4ACgkQucaJFAH8YHuFugCffCdmkuX7fZ24lhWfEgWmwBYh
ifYAoIrPWxZJfAB0W+4jYVCDe5dWkZZv
=zcrM
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
