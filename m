From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v5] drivers/virt: introduce Freescale hypervisor management driver
Date: Thu, 9 Jun 2011 22:33:07 +0200
Message-ID: <201106092233.08030.arnd@arndb.de>
References: <1307646794-26374-1-git-send-email-timur@freescale.com> <201106092213.13755.arnd@arndb.de> <4DF12A94.6070605@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <4DF12A94.6070605@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, virtualization@lists.linux-foundation.org

On Thursday 09 June 2011 22:18:28 Timur Tabi wrote:
> > More importantly, the code you have chose (0) conflicts with existing drivers
> > (frame buffer, scsi and wavefront among others). Please chose a free one and
> > add it to Documentation/ioctl/ioctl-number.txt in the same patch.
> 
> Ok, I was really hoping to avoid doing this.  Like I said, binary compatibility
> is important, and changing the type will break my existing apps.  Are you
> insisting that I pick a new number?

I definitely insist that you have a proper interface in the driver at the
time that it gets merged, and that probably includes a collision-free
ioctl code.

You can probably make the driver support both the traditional and the
new interface, but I would prefer if you kept that as a private patch
on top a clean kernel driver. It's also a good idea to keep the header
file clean and only define the new interface there, to ensure that all
applications that are built in the future have to use the new interface.

When you make the patch to add backwards compat support, just add it
to the driver itself, not to the header.

	Arnd
