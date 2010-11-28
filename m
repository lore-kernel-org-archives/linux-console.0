From: "jonsmirl@gmail.com" <jonsmirl@gmail.com>
Subject: Re: VT console need rewrite
Date: Sun, 28 Nov 2010 09:05:44 -0500
Message-ID: <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
References: <1290941875.13526.15.camel@cai.gentoo>
	<73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	<1290951770.13526.18.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=yXFA1IIgBmGSq7gMfsfFKtJBRVNLU8SSRNIexBTU53Y=;
        b=GslcxBu5R3L7rXznVVHVzDFKrGEbSVafX2D68aRAqu8jlw7Y0IPQvA2V/ifZGqRamJ
         7Q2VGKHyz7kEjPKubThKMmpmRv6VCYoB5ddecxwUqgGbsd41FmjeX30sQyhXJhxBzzaq
         3CDDBJji86EMTdKRy9LTsQnAnoz1rSw8NhdkM=
In-Reply-To: <1290951770.13526.18.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: microcai@fedoraproject.org
Cc: Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Sun, Nov 28, 2010 at 8:42 AM, Microcai <microcai@fedoraproject.org> =
wrote:
> =E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 08:24 -0500=EF=BC=8CTheodore T=
so=E5=86=99=E9=81=93=EF=BC=9A
>> On Nov 28, 2010, at 5:57 AM, Microcai wrote:
>>
>> > Hi, there
>> >
>> > =C2=A0 =C2=A0 I'm implementing the UNICODE font of the framebuffer=
 console, (see
>> > http://lkml.org/lkml/2010/11/26/50 in case you do not got my email=
). But
>> > current vt code is too bugy, too many direct assumes about vt buff=
er,
>> > This makes me so hard to hack. =C2=A0There is TODO telling me to a=
dd UNICODE
>> > support, but no room for such code, that's why my patch is so tric=
ky.
>> >
>> > =C2=A0 =C2=A0 And the code itself, if you'll excuse me, it isn't a=
s beautiful as rest
>> > of the kernel.
>> > =C2=A0 =C2=A0 So, it really really need a clean rewrite.I'm ganna =
take is hard job.
>> > =C2=A0 =C2=A0 And, please tell me if is worth to do so.
>>
>> Yes, the console is code is very old. =C2=A0 But please be aware tha=
t lots of code (both in the kernel and in userspace) has dependencies u=
pon how the code behaves. =C2=A0 So changing it in a way that does not =
break backwards compatibility is hard. =C2=A0i.e., it is hard to hack f=
or a reason.
>>
>> I would recommend an incremental rewrite (i.e., one patch at a time)=
, as opposed to a rewrite from scratch. =C2=A0 Because people will want=
 to be assured that things haven't broken in a horrible way as a result=
 of a complete rewrite...
>>
>> -- Ted
>>
>
> Yeah, I'd also like to rewrite it incrementally. But... who will acce=
pt
> that incrementally patch ? It just seems that incremental patch will =
be
> horrible at the beginning...... It will be discard without a
> reason .....

You can use CONFIG_VT to remove the entire VT subsystem. It might be
easier for you to write an alternative VT system that could be enabled
with a different flag.

The VT system is very old code from the earliest days of Linux.
Thousands of things depend on it both in the kernel and user space. It
will be very hard to make significant changes to it that don't break
lots of dependent code.

Another model to consider... Remove the VT subsystem. Replace it will
a Unicode VT system built in user space. Using the existing kernel
code, leave a single user console in the kernel that would only be
used for system maintenance. Normal users would never see this console
unless their system was really messed up.



>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/
>



--=20
Jon Smirl
jonsmirl@gmail.com
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
