From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Thu, 2 Jun 2011 16:28:46 -0500
Message-ID: <4DE8008E.9030008@freescale.com>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106012340.14237.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106012340.14237.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Arnd Bergmann wrote:
> I think drivers/misc is not the right place for this, but I'm not completely
> sure what is. drivers/firmware would be better at least, but virt/fsl might
> also be ok.

I don't think it's correct to think of a hypervisor as firmware, so I don't
think drivers/firmware is better.

I'm not sure that creating virt/fsl and putting the driver in there is a good
idea, because it will be the only driver in that directory.  Unlike KVM, this
driver is just a collection of front-ends to our hypervisor API.  The actual
hypervisor is completely separate.  That's why I put it in drivers/misc, because
it's just a single driver with a miscellaneous collection of interfaces.

We also don't want to have any Kconfig options that "turn on" hypervisor
support.  I've intentionally made support for the hypervisor part of the normal
platform code, and the device tree is used to determine whether that code is
active or not.

So virt/fsl seems like overkill to me.

> I'm not convinced that an ioctl interface is the right way to work with
> device tree properties. A more natural way would be to export it as
> a file system, or maybe as a flattened device tree blob (the latter option
> would require changing the hypervisor interface, which might not be
> possible).

As Scott said, this is just a front-end to the hypervisor API, and we already
have applications that depend on the ioctl interface.  Considering that this
driver is specific to the Freescale hypervisor, so I don't see any harm in using
ioctls.

> For an ioctl, please follow the normal pattern of defining a separate
> structure for each case, no union.

Ok.  This will break our existing applications, but it's a minor fix.

-- 
Timur Tabi
Linux kernel developer at Freescale

