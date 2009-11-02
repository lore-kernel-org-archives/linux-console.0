From: Renato Callado Borges <renato.oferenda@gmail.com>
Subject: Re: Updates on "mv", "cp" commands
Date: Mon, 2 Nov 2009 06:26:40 +0100
Message-ID: <20091102052640.GA4073@bio05.biowulf.net>
References: <86ca47940910310550s87a6140s377a3d752979037@mail.gmail.com>
 <86ca47940910311730ta75d2f3p56c3e65699c94696@mail.gmail.com>
 <87y6mq64wn.fsf@erwin.mina86.com>
 <86ca47940911010347v235b0642q140e50489c7c8259@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=HCMu0pZmGk2wS8WL6SnMt0yGMSimX3xteYQ9uVXafpE=;
        b=UuugZVdFfdR2QMLFI8c6nN7o+YSD9sMLbmAs5ciKS6ZqqqeZs1xU5f/GvM48QxwWQs
         ouAY3iC0+asr49Mc5FEv6PtYPsYU9D50HQXbGYctew9amhU6mCFw9VDDNAf6Dei8H0Wi
         Dpyu7MX5EzwGA9pya2Yy9ulRciQy3ZpdHBsTM=
Content-Disposition: inline
In-Reply-To: <86ca47940911010347v235b0642q140e50489c7c8259@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: "BRAGA, Bruno" <bruno.braga@gmail.com>
Cc: Michal Nazarewicz <mina86@tlen.pl>, linux-console@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruno!

Wouldn't you prefer to build something on top of cp and mv, like a wrapper =
script? I did a sketch for such a wrapper for cp, tell me what you think.

#!/bin/bash

if [ ! -n "$2" ]; then
    echo "Usage: $0 input_file output_file"
fi

LS_ALIAS=3D`alias | grep "ls=3D'" | cut -d "'" -f 2`
if [ -n "$LS_ALIAS" ]; then
    unalias ls
fi

SIZE1=3D`ls -l "$1" | cut -d " " -f 5`
cp "$1" "$2" &
sleep 1
echo -n "Copying: $1 -> $2 ["
tput sc
SIZE2=3D`ls -l "$2" | cut -d " " -f 5`
while [ $SIZE2 -lt $SIZE1 ]; do
    PERCENTAGE=3D`echo "a=3D$SIZE2/$SIZE1;100*a" | bc -l | cut -d "." -f 1`
    tput rc
    echo -n "$PERCENTAGE%]"
    sleep 1
    SIZE2=3D`ls -l $2 | cut -d " " -f 5`
done
echo " Done."

if [ -n "$LS_ALIAS" ]; then
    alias ls=3D"$LS_ALIAS"
fi

Be careful: this script might fail if cp has to overwrite files, and there =
are race conditions (that's the reason for the sleep outside the while loop=
).

Cheers,
Renato.

On Sun, Nov 01, 2009 at 08:47:21PM +0900, BRAGA, Bruno wrote:
> Thanks for the reply Michal.
>=20
> I will look into that (I found the source in GNU's source code, but I
> am still kinda lost on to whom should I ask stuff, lol). i will let
> you know if/when I get things done with the team there.
>=20
> Cheers,
>=20
> ******************************
> Braga, Bruno
> http://www.brunobraga.net
> bruno.braga@gmail.com
> *******************************
>=20
> "The future belongs to people who see possibilities before they become
> obvious!." -- Ted Levitt
>=20
>=20
>=20
> 2009/11/1 Michal Nazarewicz <mina86@tlen.pl>:
> > "BRAGA, Bruno" <bruno.braga@gmail.com> writes:
> >> I don't know if that's the place to post this question, but I am sure
> >> someone here will be able to give me hints on how to proceed.
> >>
> >> I would like to propose and patch improvements on the "mv" (move) and
> >> "cp" (copy) commands, by adding options for progress information.
> >
> > That's something I was wondering about some time ago myself.
> >
> >> The idea is that any GUI actions already do it graphically, and other
> >> CLI applications, such as "rsync", have this as an extended option
> >> "--progress". This is handy for large files processing, for instance.
> >>
> >> I looked for the code in the kernel source but I did not find any. I
> >> could find some sources on the GNU OS, but I am not sure if that's the
> >> right place (probably not).
> >
> > You won't find any sources of cp or mv in Linux source code because cp
> > and mv commands are user space and as such they are not part of Linux
> > per se.
> >
> > If you are using some kind of GNU/Linux distribution the place to look
> > is GNU coreutils package. =C2=A0Consult gnu.org webpage for it's source=
 code
> > and information how to submit patches.
> >
> > --
> > Best regards, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _ =C2=A0 =C2=A0 _
> > =C2=A0.o. | Liege of Serenly Enlightened Majesty of =C2=A0 =C2=A0 =C2=
=A0o' \,=3D./ `o
> > =C2=A0..o | Computer Science, =C2=A0Michal "mina86" Nazarewicz =C2=A0 (=
o o)
> > =C2=A0ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-console" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Renato =E5=AD=97. []'s, RCB.

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkrubZAACgkQucaJFAH8YHswfgCcCosJQ9X/nOdrknb8O4zKJHCY
PbQAn2OiU23OULK6hvEuTXyXVFh5o6GY
=vCZx
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
