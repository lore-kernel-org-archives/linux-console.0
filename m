From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor management driver
Date: Tue, 7 Jun 2011 21:34:24 +0200
Message-ID: <201106072134.24721.arnd@arndb.de>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106072116.21469.arnd@arndb.de> <4DEE7A12.80302@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <4DEE7A12.80302@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>
Cc: Chris Metcalf <cmetcalf@tilera.com>, linuxppc-dev@lists.ozlabs.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, Deepak Saxena <dsaxena@linaro.org>, linux-console@vger.kernel.org, greg@kroah.com

On Tuesday 07 June 2011 21:20:50 Timur Tabi wrote:
> Arnd Bergmann wrote:
> > For the spi flash driver that goes through the hypervisor abstraction,
> > I think drivers/virt/tile would be better than driver/platform/tile,
> > but we should really have a new "abstract flash character driver" subsystem
> > for that.
> 
> Why should it matter that the SPI flash driver goes through the hypervisor
> abstration?  One of the patches in this patchset is a TTY driver that goes
> through the Freescale hypervisor.  I put the drivers in drivers/tty.

The driver in question is for a hypervisor that abstracts the flash memory
using a read/write interface. There is no way you can represent that as
a SPI host driver.

	Arnd
