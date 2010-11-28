From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Sun, 28 Nov 2010 22:29:05 +0800
Message-ID: <1290954545.13526.27.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=fsZ5YogmtiflSxGC36868tYgBSf9gh/v+7Nwhyjb+GU=;
        b=frgTMPeDbxTWM4btp9AXRz+ynlIDbPpD9Z0nIOXOhv0y2ceM9edFRv9nZPWTADTg3+
         BpnREDXrAk82l5IeHmnC3mgrhUl8Nd9pxZz5mWZbb+xrmPyJky0joOBZUnFNSOPU/r04
         w1hrDux8KgvCg5C0oi5uWXrX4KXHaAitO0SVc=
In-Reply-To: <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "jonsmirl@gmail.com" <jonsmirl@gmail.com>
Cc: Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 09:05 -0500=EF=BC=8Cjonsmirl@gma=
il.com=E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Nov 28, 2010 at 8:42 AM, Microcai <microcai@fedoraproject.org=
> wrote:
> > =E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 08:24 -0500=EF=BC=8CTheodore=
 Tso=E5=86=99=E9=81=93=EF=BC=9A
> >> On Nov 28, 2010, at 5:57 AM, Microcai wrote:
> >>
> >> > Hi, there
> >> >
> >> >     I'm implementing the UNICODE font of the framebuffer console=
, (see
> >> > http://lkml.org/lkml/2010/11/26/50 in case you do not got my ema=
il). But
> >> > current vt code is too bugy, too many direct assumes about vt bu=
ffer,
> >> > This makes me so hard to hack.  There is TODO telling me to add =
UNICODE
> >> > support, but no room for such code, that's why my patch is so tr=
icky.
> >> >
> >> >     And the code itself, if you'll excuse me, it isn't as beauti=
ful as rest
> >> > of the kernel.
> >> >     So, it really really need a clean rewrite.I'm ganna take is =
hard job.
> >> >     And, please tell me if is worth to do so.
> >>
> >> Yes, the console is code is very old.   But please be aware that l=
ots of code (both in the kernel and in userspace) has dependencies upon=
 how the code behaves.   So changing it in a way that does not break ba=
ckwards compatibility is hard.  i.e., it is hard to hack for a reason.
> >>
> >> I would recommend an incremental rewrite (i.e., one patch at a tim=
e), as opposed to a rewrite from scratch.   Because people will want to=
 be assured that things haven't broken in a horrible way as a result of=
 a complete rewrite...
> >>
> >> -- Ted
> >>
> >
> > Yeah, I'd also like to rewrite it incrementally. But... who will ac=
cept
> > that incrementally patch ? It just seems that incremental patch wil=
l be
> > horrible at the beginning...... It will be discard without a
> > reason .....
>=20
> You can use CONFIG_VT to remove the entire VT subsystem. It might be
> easier for you to write an alternative VT system that could be enable=
d
> with a different flag.
>=20
> The VT system is very old code from the earliest days of Linux.
> Thousands of things depend on it both in the kernel and user space. I=
t
> will be very hard to make significant changes to it that don't break
> lots of dependent code.
>=20
> Another model to consider... Remove the VT subsystem. Replace it will
> a Unicode VT system built in user space. Using the existing kernel
> code, leave a single user console in the kernel that would only be
> used for system maintenance. Normal users would never see this consol=
e
> unless their system was really messed up.
>=20
>=20

So, here is the design according to your description  ..=20

JUST export /dev/fb and /dev/pts and /dev/console
The kernel use /dev/console, but invisible.=20
The rest of the world uses /dev/pts

Make init using /dev/fb to display boot message, and agetty runs
on /dev/pts

Another user-space program use /dev/fb to display all /dev/pts , you ca=
n
use alt+Fx to switch between them (kernel no longer handles console
switch).

So, there is no virtual console ... . Just as windows  (who uses cmd.ex=
e
to display console )

kernel just deal with BYTE stream, no need for font handling .....

Will you agree with that kind of system ?=20





--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
