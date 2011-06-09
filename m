From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v5] drivers/virt: introduce Freescale hypervisor management driver
Date: Thu, 9 Jun 2011 22:25:07 +0200
Message-ID: <201106092225.08090.arnd@arndb.de>
References: <1307646794-26374-1-git-send-email-timur@freescale.com> <4DF12345.1040409@freescale.com> <4DF123AA.6070402@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <4DF123AA.6070402@oracle.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linuxppc-dev@lists.ozlabs.org
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Timur Tabi <timur@freescale.com>, konrad.wilk@oracle.com, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, cmetcalf@tilera.com, akpm@kernel.org, dsaxena@linaro.org, linux-console@vger.kernel.org, greg@kroah.com, virtualization@lists.linux-foundation.org, alan@lxorguk.ukuu.org.uk

On Thursday 09 June 2011 21:48:58 Randy Dunlap wrote:
> > So is it okay to stick with 0, or do I need to pick a new number?
> 
> I wasn't suggesting that you change the 0, just note that it has conflicts,
> like other ioctls do.

We normally don't try to maintain binary compatibility with out of tree
kernel patches. That only leads to inferior interfaces finding their way
into the kernel.

	Arnd
