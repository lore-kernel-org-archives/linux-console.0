From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v4] drivers/virt: introduce Freescale hypervisor management driver
Date: Thu, 9 Jun 2011 22:20:22 +0200
Message-ID: <201106092220.22246.arnd@arndb.de>
References: <1307573154-15838-1-git-send-email-timur@freescale.com> <201106090929.23671.arnd@arndb.de> <4DF11715.5030001@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DF11715.5030001@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>, linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, linux-console@vger.kernel.org

On Thursday 09 June 2011 20:55:17 Timur Tabi wrote:
> Arnd Bergmann wrote:
> > Then get rid of all the code that takes apart the ioctl command numbers
> > again and just do a switch/case based on the command.
> 
> I still need to keep that code to maintain binary compatibility with existing
> applications that pass the union as a parameter.
> 
> I'll fix that after we've updated the applications.  But we have a
> chicken-or-the-egg problem where we need the same application to work with the
> new and old ioctl interface for a period of time.

The lesson to learn here is obviously not to ship binaries of applications
to customers before the driver has been merged in a mainline kernel.

The best way out that I can see is to make the driver carry the proper
interface in the upstream version, but to have a private patch to support
both interface versions in the kernel you ship on machines that require
backwards compatibility. Once you have phased out the user application,
you can then drop that patch and use the upstream version of the
interfaces.

	Arnd
