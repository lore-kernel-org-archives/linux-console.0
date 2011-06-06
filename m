From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Mon, 6 Jun 2011 17:23:56 -0400
Message-ID: <20110606212356.GA20112@dumpdata.com>
References: <1306953337-15698-1-git-send-email-timur@freescale.com>
 <201106061803.58531.arnd@arndb.de>
 <4DECFBC5.6070205@freescale.com>
 <201106061824.53844.arnd@arndb.de>
 <4DED4030.9050503@tilera.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DED4030.9050503@tilera.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Metcalf <cmetcalf@tilera.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Timur Tabi <timur@freescale.com>, Deepak Saxena <dsaxena@linaro.org>, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Mon, Jun 06, 2011 at 05:01:36PM -0400, Chris Metcalf wrote:
> On 6/6/2011 12:24 PM, Arnd Bergmann wrote:
> > On Monday 06 June 2011, Timur Tabi wrote:.
> >> And what about my concern that my driver will be the only one in drivers/virt?
> > I have no doubt that more of these will come. Chris Metcalf is currently
> > looking for a home for his tilera hypervisor drivers, and we have the
> > microsoft hyperv drivers in drivers/staging, so they will hopefully
> > move to a proper place later. We also have similar drivers in other
> > places, e.g. drivers/ps3/ps3-sys-manager.c, drivers/s390/char/vmcp.c
> > or parts of drivers/xen.
> 
> It might help if someone (Arnd?) wanted to propose a statement of what
> drivers/virt was really for.  If it's for any Linux driver that upcalls to

Was for? I am not seeing it in v3.0-rc2?

> a hypervisor for any reason, then the Tilera paravirtualized drivers fit in
> well.  If it's intended more for drivers that guests running under a
> hypervisor can use to talk to the hypervisor itself (e.g. managing

I believe that the code that deals with specific subsystem (so block API
for example) would reside in subsystem directory (so drivers/block would have
your virtualization block driver). This allows the maintainer of block
to make sure your driver is OK.

> notifications that a hypervisor delivers to a guest to cause it to shut
> down or take other actions), then it doesn't seem like the Tilera

That looks to be arch/<x>/tilera/virt/ candidate?

> paravirtualized device drivers belong there, since they're just using the
> Tilera hypervisor synchronously to do I/O or get/set device and driver state.

Well, I/O sounds like block API or network API. But then you are also
doing management ioctl - which implies "drivers". "drivers/tilera" does not
work?

> 
> -- 
> Chris Metcalf, Tilera Corp.
> http://www.tilera.com
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
