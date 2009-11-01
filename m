From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: Updates on "mv", "cp" commands
Date: Sun, 01 Nov 2009 09:11:20 +0100
Message-ID: <87y6mq64wn.fsf@erwin.mina86.com>
References: <86ca47940910310550s87a6140s377a3d752979037@mail.gmail.com>
	<86ca47940910311730ta75d2f3p56c3e65699c94696@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-url:x-pgp-fp:x-pgp:date:in-reply-to:message-id
         :user-agent:mime-version:content-type;
        bh=dHOuuUddX7Tu9Eh7OPgr2YaJUUZ+ZECu/es+SaHKq1Q=;
        b=WxRRWDrxVqUntwcrNkI3EoUYCnKSjCRE9FNb3K/hN1Wj94vYXTVdaWAlVEbW3Kselm
         blvROb6oxX4fdv5CXq9egRb9AXbqzu8kxiAhYdvVWHo4DLveXN5uA+5JXboWjpIpkWIq
         60hm7iUttw8OUOLUs2/KUhindafJ4vFNr011g=
In-Reply-To: <86ca47940910311730ta75d2f3p56c3e65699c94696@mail.gmail.com>
	(Bruno BRAGA's message of "Sun, 1 Nov 2009 09:30:21 +0900")
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: "BRAGA, Bruno" <bruno.braga@gmail.com>
Cc: linux-console@vger.kernel.org

--=-=-=
Content-Transfer-Encoding: quoted-printable

"BRAGA, Bruno" <bruno.braga@gmail.com> writes:
> I don't know if that's the place to post this question, but I am sure
> someone here will be able to give me hints on how to proceed.
>
> I would like to propose and patch improvements on the "mv" (move) and
> "cp" (copy) commands, by adding options for progress information.

That's something I was wondering about some time ago myself.

> The idea is that any GUI actions already do it graphically, and other
> CLI applications, such as "rsync", have this as an extended option
> "--progress". This is handy for large files processing, for instance.
>
> I looked for the code in the kernel source but I did not find any. I
> could find some sources on the GNU OS, but I am not sure if that's the
> right place (probably not).

You won't find any sources of cp or mv in Linux source code because cp
and mv commands are user space and as such they are not part of Linux
per se.

If you are using some kind of GNU/Linux distribution the place to look
is GNU coreutils package.  Consult gnu.org webpage for it's source code
and information how to submit patches.

=2D-=20
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=3D./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEARECAAYFAkrtQq8ACgkQUyzLALfG3x4GdACdHAkTFJ1wq0gbiow0miZK7SUF
hRcAoLBJyxQPjTgJhKDke1uVHF+woNFg
=tYt6
-----END PGP SIGNATURE-----
--=-=-=--
