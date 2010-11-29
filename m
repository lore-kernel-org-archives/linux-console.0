From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 18:11:16 +0800
Message-ID: <1291025476.9785.5.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <20101129020610.7ea7c79e.lisa@ltmnet.com>
	 <1290961207.13526.31.camel@cai.gentoo> <20101128194624.GP2767@thunk.org>
	 <1290993244.877.3.camel@cai.gentoo>
	 <20101129085829.GM5142@const.bordeaux.inria.fr>
	 <1291023157.9785.2.camel@cai.gentoo>
	 <20101129095823.GQ5142@const.bordeaux.inria.fr>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=q/C7v/RvATWS0KP5uIKTTLriTSbIvi/Jkh6vpY91zSk=;
        b=ERocapjAS6txltrcr5yiNtWi8bWTa+K4b4YpaOlNKfKLfa1x5KikOThKUOccNQzBHv
         m5F3+RWmFRvKsD+u5n9jPPWE26NyWg9XMtqq6Z5XQYJKxDPfCEkBUIR0QwXbD2ZRj5n0
         lBPuKI9INk9PUSAm+G26b2kmJqcXFqn53FDag=
In-Reply-To: <20101129095823.GQ5142@const.bordeaux.inria.fr>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Ted Ts'o <tytso@mit.edu>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 10:58 +0100=EF=BC=8CSamuel Thiba=
ult=E5=86=99=E9=81=93=EF=BC=9A
>=20
> Simple unicode font (i.e. just go beyond the arbitrary historical-vga
> 512 glyphs limit for fbcon) might go in.  Double-width is
> questionable,
> but it can probably simple enough to be able to get in (there is
> already
> some code for it anyway).
>=20
> But complete unicode support (with arabic ligatures, tibetan
> combinations, etc.) won't ever be accepted in the kernel as that's fa=
r
> too involved in terms of font rendering.  So the userland way needs t=
o
> be fixed for these anyway, and then things like chinese will go
> along...
>=20
> Samuel=20

YES, my patch just include BMP(mostly CJK), not full UNICODE. IF it can
be included, then I can do more work to make sure it doesn't break old
stuff. And it's configurable. users don't have to be forced to use.





--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
