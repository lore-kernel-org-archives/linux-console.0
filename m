From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Sun, 28 Nov 2010 21:42:50 +0800
Message-ID: <1290951770.13526.18.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=E9vOOqSDYeDMD6JeZOcCru+66TN6RD5NAzg+uOp1/to=;
        b=WySAbl9+v95ktdxOHUq4hp/ocsVRc/i+MIJPLXwF/2hBDJTs/SGiQdxz+ij7cP8J70
         8EoVDUEydUFoSbY0WyMHUrXmgf5UHVDouJ2Qo5+Cr/WIZTUZ/bLHgCUCOAnxPJW3DyRd
         nIba8Cgf/48b1WO93tECckdzeWdzeS4pjBoHI=
In-Reply-To: <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Theodore Tso <tytso@mit.edu>
Cc: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 08:24 -0500=EF=BC=8CTheodore Tso=
=E5=86=99=E9=81=93=EF=BC=9A
> On Nov 28, 2010, at 5:57 AM, Microcai wrote:
>=20
> > Hi, there
> >=20
> > 	I'm implementing the UNICODE font of the framebuffer console, (see
> > http://lkml.org/lkml/2010/11/26/50 in case you do not got my email)=
=2E But
> > current vt code is too bugy, too many direct assumes about vt buffe=
r,
> > This makes me so hard to hack.  There is TODO telling me to add UNI=
CODE
> > support, but no room for such code, that's why my patch is so trick=
y.
> >=20
> > 	And the code itself, if you'll excuse me, it isn't as beautiful as=
 rest
> > of the kernel.
> > 	So, it really really need a clean rewrite.I'm ganna take is hard j=
ob.=09
> > 	And, please tell me if is worth to do so.
>=20
> Yes, the console is code is very old.   But please be aware that lots=
 of code (both in the kernel and in userspace) has dependencies upon ho=
w the code behaves.   So changing it in a way that does not break backw=
ards compatibility is hard.  i.e., it is hard to hack for a reason.
>=20
> I would recommend an incremental rewrite (i.e., one patch at a time),=
 as opposed to a rewrite from scratch.   Because people will want to be=
 assured that things haven't broken in a horrible way as a result of a =
complete rewrite...
>=20
> -- Ted
>=20

Yeah, I'd also like to rewrite it incrementally. But... who will accept
that incrementally patch ? It just seems that incremental patch will be
horrible at the beginning...... It will be discard without a
reason .....


--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
