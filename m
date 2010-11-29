From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 17:32:37 +0800
Message-ID: <1291023157.9785.2.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <20101129020610.7ea7c79e.lisa@ltmnet.com>
	 <1290961207.13526.31.camel@cai.gentoo> <20101128194624.GP2767@thunk.org>
	 <1290993244.877.3.camel@cai.gentoo>
	 <20101129085829.GM5142@const.bordeaux.inria.fr>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=YYPwdplfbYukWldxfkyjaHGCDY41K96OHCc24w2UFjc=;
        b=CCzyHF1WI2HGI936nDKfoDfBczM2hl28aJOVXzVMdH1fVRZZ2Di+gHLGWDBFQKGhd0
         vU0m8kHwGjZ7++vYG54YkWHuMCbSuYO5Hc/EhjZX5DsAQVpTlp76B/M02Zt5d3HE1ZBJ
         5K0f8LUgLWasdbqJjrl57bqiPqUIPDRklnhjw=
In-Reply-To: <20101129085829.GM5142@const.bordeaux.inria.fr>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Ted Ts'o <tytso@mit.edu>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 09:58 +0100=EF=BC=8CSamuel Thiba=
ult=E5=86=99=E9=81=93=EF=BC=9A
> Microcai, le Mon 29 Nov 2010 09:14:04 +0800, a =C3=A9crit :
> > Hey, my old patch already did it , and do not break any old stuff.
>=20
> To your knowledge.  IIRC while reading your patch I found a couple of
> things that would most probably break some corner cases, which could
> go unnoticed, that's why I proposed to first extend the internal vc
> content matrix into unicode values, so as to clearly have to upgrade =
all
> drivers.
>=20
> Samuel

I doesn't matter *how to do* . I have many different kinds of patchs
that did it in different ways.

What realy matters is that, do we agree that add unicode font support i=
s
acceptable ?



--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
