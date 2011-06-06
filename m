From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor management driver
Date: Mon, 6 Jun 2011 18:24:53 +0200
Message-ID: <201106061824.53844.arnd@arndb.de>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106061803.58531.arnd@arndb.de> <4DECFBC5.6070205@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <4DECFBC5.6070205@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>
Cc: Deepak Saxena <dsaxena@linaro.org>, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, Chris Metcalf <cmetcalf@tilera.com>

On Monday 06 June 2011, Timur Tabi wrote:
> Arnd Bergmann wrote:
> > When we talked about the situation of drivers/misc and drivers/char at
> > one of the recent conferences, a broad consensus was that they are in
> > need of a maintainer, which I foolishly signed up for. Deepak wanted
> > to send an update to the MAINTAINERS file for this (I guess I can do
> > that too, since he must have forgotten about it), but the main idea is
> > that I'm there to say no to any driver that someone tries to add there,
> > unless there are really good reasons why it is actually a good place
> > to live for that driver.
> 
> Can you give me an example of a driver that does belong in drivers/misc?

Not really.

> Frankly, I just don't see what's wrong with a repository of various drivers that
> don't really belong anywhere else.

The main problem is that for the most part it's a pile of crap that
nobody wants to look at, so drivers getting added there see basically
no real review.

> And what about my concern that my driver will be the only one in drivers/virt?

I have no doubt that more of these will come. Chris Metcalf is currently
looking for a home for his tilera hypervisor drivers, and we have the
microsoft hyperv drivers in drivers/staging, so they will hopefully
move to a proper place later. We also have similar drivers in other
places, e.g. drivers/ps3/ps3-sys-manager.c, drivers/s390/char/vmcp.c
or parts of drivers/xen.

	Arnd
