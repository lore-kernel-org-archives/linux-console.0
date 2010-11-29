From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 18:40:00 +0800
Message-ID: <1291027200.9785.9.camel@cai.gentoo>
References: <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <20101129020610.7ea7c79e.lisa@ltmnet.com>
	 <1290961207.13526.31.camel@cai.gentoo> <20101128194624.GP2767@thunk.org>
	 <1290993244.877.3.camel@cai.gentoo>
	 <20101129085829.GM5142@const.bordeaux.inria.fr>
	 <1291023157.9785.2.camel@cai.gentoo>
	 <20101129095823.GQ5142@const.bordeaux.inria.fr>
	 <1291025476.9785.5.camel@cai.gentoo>
	 <20101129101702.GS5142@const.bordeaux.inria.fr>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=g6RGFA1qwWWYLiD9NOuyV5etX2TPqJjH6EuJLOVPAHU=;
        b=Sl5fk5C2/sC+4SSJHw/10lBUK1U9Q2MLFdUtol8UUXNqN0/o6pI2BzasaVqhWJHmJ/
         6UHYh5y2lmjjtOxheF8u4V9V0pWE9n9gwXioBngvWzTUx65XYnwNJaIVLBdafsGUFoqj
         x7yYzKlukD+kXXXXar9nKcExUGjk5TVWmStjI=
In-Reply-To: <20101129101702.GS5142@const.bordeaux.inria.fr>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Ted Ts'o <tytso@mit.edu>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 11:17 +0100=EF=BC=8CSamuel Thiba=
ult=E5=86=99=E9=81=93=EF=BC=9A
> It seems you didn't get my point: what is the use of including CJK
> into
> kernel when that won't solve the issue for e.g. arabic, while fixing
> fbterm will solve the issue for both arabic and CJK?
>=20

You don't get my point.  fbterm of zhcon won't fit every thing.


--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
