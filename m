From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 09:58:29 +0100
Message-ID: <20101129085829.GM5142@const.bordeaux.inria.fr>
References: <1290941875.13526.15.camel@cai.gentoo> <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu> <1290951770.13526.18.camel@cai.gentoo> <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com> <20101129020610.7ea7c79e.lisa@ltmnet.com> <1290961207.13526.31.camel@cai.gentoo> <20101128194624.GP2767@thunk.org> <1290993244.877.3.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1290993244.877.3.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Microcai <microcai@fedoraproject.org>
Cc: Ted Ts'o <tytso@mit.edu>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Microcai, le Mon 29 Nov 2010 09:14:04 +0800, a =E9crit :
> Hey, my old patch already did it , and do not break any old stuff.

To your knowledge.  IIRC while reading your patch I found a couple of
things that would most probably break some corner cases, which could
go unnoticed, that's why I proposed to first extend the internal vc
content matrix into unicode values, so as to clearly have to upgrade al=
l
drivers.

Samuel
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
