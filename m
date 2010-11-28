From: "jonsmirl@gmail.com" <jonsmirl@gmail.com>
Subject: Re: VT console need rewrite
Date: Sun, 28 Nov 2010 09:49:00 -0500
Message-ID: <AANLkTi=dMnZeqdDXppE5U5kb9zXs5WcyEs-op=wmB7rw@mail.gmail.com>
References: <1290941875.13526.15.camel@cai.gentoo>
	<73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	<1290951770.13526.18.camel@cai.gentoo>
	<AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	<1290954545.13526.27.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=2C1dp6p289exkBbyX0E+kd6Su3wvG8h8Y8r92ofnjz4=;
        b=HzV7vbQw7HHlLKOhkQreIa5rS4Y9NZ9PZzW4cQ/VtY8Hm8GjdjkXIWbhU9gT8cFiNO
         zIwX+Cocpfxj6ydg+5lqbsNiGoDsVw1A5tCoeacVUgcY8GTlziQgqWneDA/8qn2mTz3y
         i7YVPpJ8/fdAeWC2tixSTuk/Ca518go5/vur8=
In-Reply-To: <1290954545.13526.27.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: microcai@fedoraproject.org
Cc: Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Sun, Nov 28, 2010 at 9:29 AM, Microcai <microcai@fedoraproject.org> =
wrote:
> =E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 09:05 -0500=EF=BC=8Cjonsmirl@g=
mail.com=E5=86=99=E9=81=93=EF=BC=9A
>> On Sun, Nov 28, 2010 at 8:42 AM, Microcai <microcai@fedoraproject.or=
g> wrote:
>> > =E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 08:24 -0500=EF=BC=8CTheodor=
e Tso=E5=86=99=E9=81=93=EF=BC=9A
>> >> On Nov 28, 2010, at 5:57 AM, Microcai wrote:
>> >>
>> >> > Hi, there
>> >> >
>> >> > =C2=A0 =C2=A0 I'm implementing the UNICODE font of the framebuf=
fer console, (see
>> >> > http://lkml.org/lkml/2010/11/26/50 in case you do not got my em=
ail). But
>> >> > current vt code is too bugy, too many direct assumes about vt b=
uffer,
>> >> > This makes me so hard to hack. =C2=A0There is TODO telling me t=
o add UNICODE
>> >> > support, but no room for such code, that's why my patch is so t=
ricky.
>> >> >
>> >> > =C2=A0 =C2=A0 And the code itself, if you'll excuse me, it isn'=
t as beautiful as rest
>> >> > of the kernel.
>> >> > =C2=A0 =C2=A0 So, it really really need a clean rewrite.I'm gan=
na take is hard job.
>> >> > =C2=A0 =C2=A0 And, please tell me if is worth to do so.
>> >>
>> >> Yes, the console is code is very old. =C2=A0 But please be aware =
that lots of code (both in the kernel and in userspace) has dependencie=
s upon how the code behaves. =C2=A0 So changing it in a way that does n=
ot break backwards compatibility is hard. =C2=A0i.e., it is hard to hac=
k for a reason.
>> >>
>> >> I would recommend an incremental rewrite (i.e., one patch at a ti=
me), as opposed to a rewrite from scratch. =C2=A0 Because people will w=
ant to be assured that things haven't broken in a horrible way as a res=
ult of a complete rewrite...
>> >>
>> >> -- Ted
>> >>
>> >
>> > Yeah, I'd also like to rewrite it incrementally. But... who will a=
ccept
>> > that incrementally patch ? It just seems that incremental patch wi=
ll be
>> > horrible at the beginning...... It will be discard without a
>> > reason .....
>>
>> You can use CONFIG_VT to remove the entire VT subsystem. It might be
>> easier for you to write an alternative VT system that could be enabl=
ed
>> with a different flag.
>>
>> The VT system is very old code from the earliest days of Linux.
>> Thousands of things depend on it both in the kernel and user space. =
It
>> will be very hard to make significant changes to it that don't break
>> lots of dependent code.
>>
>> Another model to consider... Remove the VT subsystem. Replace it wil=
l
>> a Unicode VT system built in user space. Using the existing kernel
>> code, leave a single user console in the kernel that would only be
>> used for system maintenance. Normal users would never see this conso=
le
>> unless their system was really messed up.
>>
>>
>
> So, here is the design according to your description =C2=A0..
>
> JUST export /dev/fb and /dev/pts and /dev/console
> The kernel use /dev/console, but invisible.
> The rest of the world uses /dev/pts
>
> Make init using /dev/fb to display boot message, and agetty runs
> on /dev/pts
>
> Another user-space program use /dev/fb to display all /dev/pts , you =
can
> use alt+Fx to switch between them (kernel no longer handles console
> switch).
>
> So, there is no virtual console ... . Just as windows =C2=A0(who uses=
 cmd.exe
> to display console )
>
> kernel just deal with BYTE stream, no need for font handling .....
>
> Will you agree with that kind of system ?

It is a lot of work to get a system like that running, but it should
work when finished. It also lets you avoid messing with the VT layer
which will be a very painful process.

Now that we have KMS you can even hide the boot display if you want.
My Ubuntu system jumps straight to a graphical boot display and you
have to hit a key to see the boot console.



>
>
>
>
>
>



--=20
Jon Smirl
jonsmirl@gmail.com
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
