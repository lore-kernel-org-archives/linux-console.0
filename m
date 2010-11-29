From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 09:14:04 +0800
Message-ID: <1290993244.877.3.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <20101129020610.7ea7c79e.lisa@ltmnet.com>
	 <1290961207.13526.31.camel@cai.gentoo>  <20101128194624.GP2767@thunk.org>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=r2UaVwJrsH/WgtZBiXo+p3qKpdaTK/LmR8k/Eo1CYGs=;
        b=wdBVb4/MvcmjYQ9Irwhr4gBvhkzlHOj9jCDaJY8IRUfuSI1vg1y6AqadjK/P4EECTf
         8AVVxg/nmL4LgA8E1THfBUDQBTmjEg7HNyOub59Ww1NEfUHPM7oB5hifrSujToYoXPhx
         M3ZyFHebArP3g4nzA+Nzcfo1p00wWkxiMUL/o=
In-Reply-To: <20101128194624.GP2767@thunk.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ted Ts'o <tytso@mit.edu>
Cc: Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 14:46 -0500=EF=BC=8CTed Ts'o=E5=86=
=99=E9=81=93=EF=BC=9A
> On Mon, Nov 29, 2010 at 12:20:07AM +0800, Microcai wrote:
> >=20
> > > Another possible model: split the current system in 2, so there's=
 a
> > > bytestream handler, and a vt-legacy module. Then use the interfac=
e
> > > between bytestream/legacy as an interface for future vt-kernel an=
d
> > > vt-user modules.
> >=20
> > this may cause early printk stop working.=20
>=20
> Let's start by asking a much more fundamental question; what the heck
> are your goals?
>=20
> If the main goal of the console is emergency debugging when the syste=
m
> is in a very bad state (i.e., trashed initrd, etc.) do we really even
> need Unicode support?
>=20
> How many people do regular login, development, reading e-mail, etc.,
> on the console?  Very few!  If the answer is because you hate X, as
> you've already pointed out, we already have fbterm.  Where is it
> written that we need to have a full unicode-capable console system?
> Why is this so important; especially if doing this is going to be ver=
y
> difficult, and risks breaking lots of stuff if we try to mess with it=
?
>=20
> 	       	     	      	      - Ted

Hey, my old patch already did it , and do not break any old stuff.
Question is , the VT code *is really very old*.=20
Just want to simplify the code, remove old stuff, make it future
compatible. Forward compatibility is more important than backward one =20



--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
