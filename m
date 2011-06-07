From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Tue, 7 Jun 2011 14:20:50 -0500
Message-ID: <4DEE7A12.80302@freescale.com>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106070908.16301.arnd@arndb.de> <4DEE567E.7080102@tilera.com> <201106072116.21469.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106072116.21469.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chris Metcalf <cmetcalf@tilera.com>, linuxppc-dev@lists.ozlabs.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, Deepak Saxena <dsaxena@linaro.org>, linux-console@vger.kernel.org, greg@kroah.com

Arnd Bergmann wrote:
> For the spi flash driver that goes through the hypervisor abstraction,
> I think drivers/virt/tile would be better than driver/platform/tile,
> but we should really have a new "abstract flash character driver" subsystem
> for that.

Why should it matter that the SPI flash driver goes through the hypervisor
abstration?  One of the patches in this patchset is a TTY driver that goes
through the Freescale hypervisor.  I put the drivers in drivers/tty.

-- 
Timur Tabi
Linux kernel developer at Freescale

