From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 7/7] [v5] drivers/virt: introduce Freescale hypervisor
	management driver
Date: Fri, 10 Jun 2011 11:45:51 +0100
Message-ID: <20110610104551.GB26441@sirena.org.uk>
References: <1307646794-26374-1-git-send-email-timur@freescale.com> <201106092213.13755.arnd@arndb.de> <4DF12A94.6070605@freescale.com> <201106092233.08030.arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201106092233.08030.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Timur Tabi <timur@freescale.com>, linuxppc-dev@lists.ozlabs.org, alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, virtualization@lists.linux-foundation.org

On Thu, Jun 09, 2011 at 10:33:07PM +0200, Arnd Bergmann wrote:
> On Thursday 09 June 2011 22:18:28 Timur Tabi wrote:

> > Ok, I was really hoping to avoid doing this.  Like I said, binary compatibility
> > is important, and changing the type will break my existing apps.  Are you
> > insisting that I pick a new number?

> I definitely insist that you have a proper interface in the driver at the
> time that it gets merged, and that probably includes a collision-free
> ioctl code.

This sort of stuff is one of the issues that should be being factored in
to any decision not to publish and submit the kernel code - ABIs that
haven't been reviewed upstream may well have this sort of issue.
