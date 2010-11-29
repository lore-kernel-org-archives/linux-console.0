From: Jerome Glisse <j.glisse@gmail.com>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 16:23:24 -0500
Message-ID: <AANLkTim5RHNQnFG-fUJ=zXk1Zz4uhf3+dLGU4MwXq5Sr@mail.gmail.com>
References: <1290941875.13526.15.camel@cai.gentoo>
	<73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	<1290951770.13526.18.camel@cai.gentoo>
	<AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	<20101129020610.7ea7c79e.lisa@ltmnet.com>
	<1290961207.13526.31.camel@cai.gentoo>
	<20101128194624.GP2767@thunk.org>
	<4CF3081B.9090307@gmail.com>
	<1290996846.877.23.camel@cai.gentoo>
	<12794.1291053037@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=4MpNCRpj0O3alx3FpZuKMNEg1tpGk1+5XT05qSnkiEg=;
        b=R2Q2Vha3qT/YNO+qASrIpjTwUgGeadwaqfxukBkCMsY9VE8DDmFIAvqn11Z0F2Roln
         S+inyYDC2+44SHkfEwgM3AKnhcKJpGFXnAC+Bmy3/mRbCuXyoxsmQtZ6aXAWljiRL53c
         /5+h4yDFu1ta5vSRTYTmY0UATmkd48O4I2NW0=
In-Reply-To: <12794.1291053037@localhost>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Valdis.Kletnieks@vt.edu
Cc: microcai@fedoraproject.org, Alexey Gladkov <gladkov.alexey@gmail.com>, Ted Ts'o <tytso@mit.edu>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Mon, Nov 29, 2010 at 12:50 PM,  <Valdis.Kletnieks@vt.edu> wrote:
> On Mon, 29 Nov 2010 10:14:06 +0800, Microcai said:
>
>> The thing is, you really should agree that, implementing UNICODE fon=
t in
>> kernel isn't a bad idea.
>
> Let us know when you have implemented support for bidirectional
> scripts that require compositing or half-spacing characters. =A0Witho=
ut
> blowing out the 8K kernel stack.
>
> Doing it *right* is important:
>
> http://gizmodo.com/382026/a-cellphones-missing-dot-kills-two-people-p=
uts-three-more-in-jail
>
> Two dead, three in jail. =A0All because of broken font support. =A0Th=
at's a good
> reason to not even try unless you can do it *right*.
>
>

Side point, KMS people would like to see the direct memory access to
fb buffer vanish, right now we are wasting vram to keep a front buffer
around for fb. So somethings like always using some callback to access
(write/read) to fb buffer.

Cheers,
Jerome Glisse
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
