From: Lisa Milne <lisa@ltmnet.com>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 02:06:10 +1000
Message-ID: <20101129020610.7ea7c79e.lisa@ltmnet.com>
References: <1290941875.13526.15.camel@cai.gentoo>
	<73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	<1290951770.13526.18.camel@cai.gentoo>
	<AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "jonsmirl@gmail.com" <jonsmirl@gmail.com>
Cc: microcai@fedoraproject.org, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Sun, 28 Nov 2010 09:05:44 -0500
"jonsmirl@gmail.com" <jonsmirl@gmail.com> wrote:

> On Sun, Nov 28, 2010 at 8:42 AM, Microcai
> <microcai@fedoraproject.org> wrote:
> >
> > Yeah, I'd also like to rewrite it incrementally. But... who will
> > accept that incrementally patch ? It just seems that incremental
> > patch will be horrible at the beginning...... It will be discard
> > without a reason .....
> 
> You can use CONFIG_VT to remove the entire VT subsystem. It might be
> easier for you to write an alternative VT system that could be enabled
> with a different flag.
> 
> The VT system is very old code from the earliest days of Linux.
> Thousands of things depend on it both in the kernel and user space. It
> will be very hard to make significant changes to it that don't break
> lots of dependent code.
> 
> Another model to consider... Remove the VT subsystem. Replace it will
> a Unicode VT system built in user space. Using the existing kernel
> code, leave a single user console in the kernel that would only be
> used for system maintenance. Normal users would never see this console
> unless their system was really messed up.

Another possible model: split the current system in 2, so there's a
bytestream handler, and a vt-legacy module. Then use the interface
between bytestream/legacy as an interface for future vt-kernel and
vt-user modules.

This may make it possible to create an initial patch to do the split,
then work on the new system independently of the current vt system.
Hopefully reducing any problems with api/subsystem inconsistencies
breaking existing code elsewhere, by giving it time to adapt.

This is guesswork on my part as I haven't actually looked at the code,
so while it sounds good in theory, you'd have to check if it's actually
doable.

-- 
Lisa Milne <lisa@ltmnet.com>
