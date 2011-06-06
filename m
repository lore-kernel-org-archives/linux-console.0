From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Mon, 6 Jun 2011 11:27:31 -0500
Message-ID: <4DECFFF3.6060601@freescale.com>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106061803.58531.arnd@arndb.de> <4DECFBC5.6070205@freescale.com> <201106061824.53844.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106061824.53844.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Deepak Saxena <dsaxena@linaro.org>, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, Chris Metcalf <cmetcalf@tilera.com>

Arnd Bergmann wrote:
> I have no doubt that more of these will come. Chris Metcalf is currently
> looking for a home for his tilera hypervisor drivers, and we have the
> microsoft hyperv drivers in drivers/staging, so they will hopefully
> move to a proper place later. We also have similar drivers in other
> places, e.g. drivers/ps3/ps3-sys-manager.c, drivers/s390/char/vmcp.c
> or parts of drivers/xen.

Alright, drivers/virt it is.  I'll post a v4 once everyone else has had a chance
to comment on v3.

-- 
Timur Tabi
Linux kernel developer at Freescale

