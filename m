From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: VT console need rewrite
Date: Sun, 28 Nov 2010 23:46:34 +0000
Message-ID: <20101128234634.461daec4@pyx>
References: <1290941875.13526.15.camel@cai.gentoo>
	<73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	<1290951770.13526.18.camel@cai.gentoo>
	<AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	<20101129020610.7ea7c79e.lisa@ltmnet.com>
	<1290961207.13526.31.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1290961207.13526.31.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: microcai@fedoraproject.org
Cc: Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

> Sounds like a good idea. Who is in charge of VT system ? Seems no
> one ....

Which bit - lots of people own different parts of it, because there is a
lot of it, and people own different sections of currently ongoing
projects. Plus the X DRM folks own the KMS framebuffers, various authors
own their own low level drivers for each card and so on.

I kind of own the drivers/tty/vt* bits.

I simply don't see how you are going to address the majority of the
worlds languages in kernel space, all the major ones are too complex and
pango is too big and complex to put in kernel as are the needed font
renderers. Most of the needed compositing accelerations are also not
directly exposed in KMS to the console driver as would be needed

Your other problem is mode setting, VESA is on its way out, a lot of
devices today, especially non X86 ones pretty much need X to do any kind
of video management beyond "here is how the firmware console was
configured", and indeed many embedded devices don't have an VT code
enabled at all, just a printk console and possibly ttyprintk, both of
which may well only be talking to the debug ports

Alan
