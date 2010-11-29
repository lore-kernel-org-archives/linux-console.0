From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 10:49:18 +0800
Message-ID: <20101129024918.GA5218@cr0.nay.redhat.com>
References: <1290941875.13526.15.camel@cai.gentoo>
 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
 <1290951770.13526.18.camel@cai.gentoo>
 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
 <1290954545.13526.27.camel@cai.gentoo>
 <20101128191152.GV10602@const.famille.thibault.fr>
 <1290993006.877.0.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=oAUBUxsfGx//ikmpuv7IxmV3QoBNhfRXF0dz0yZ2lkM=;
        b=MHNIVpRDfKoezeBeLjOHF7B92uNQJBQ59pZRDAem9r69N8tRGrddbAod4CDQepK2z4
         /8BDwXyxOcWxXhMu8qSKS1dSKDsYhRYPRkYZJhQKmYE21bo2wo43VmUfLFT89QqcOAe5
         vQI8xcXrxWArYGTbvJ8gvJbwtyk9Iiw6Qd+aA=
Content-Disposition: inline
In-Reply-To: <1290993006.877.0.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Microcai <microcai@fedoraproject.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Mon, Nov 29, 2010 at 09:10:06AM +0800, Microcai wrote:
>=E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 20:11 +0100=EF=BC=8CSamuel Thib=
ault=E5=86=99=E9=81=93=EF=BC=9A
>> Microcai, le Sun 28 Nov 2010 22:29:05 +0800, a =C3=A9crit :
>> > So, here is the design according to your description  ..=20
>> >=20
>> > JUST export /dev/fb and /dev/pts and /dev/console
>> > The kernel use /dev/console, but invisible.=20
>> > The rest of the world uses /dev/pts
>> >=20
>> > Make init using /dev/fb to display boot message, and agetty runs
>> > on /dev/pts
>>=20
>> Errr, but that already exists, that's fbterm...
>>=20
>> Samuel
>
>Every time someone try to implement something , some other guy will ju=
mp
>out and say, that already exist, in user-space ..... blablablabla
>

Remember, remember, kernel provides a mechanism, not a policy.
(From this point, auto-groups *does* break it.)
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
