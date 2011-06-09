From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v4] drivers/virt: introduce Freescale hypervisor
 management driver
Date: Thu, 9 Jun 2011 15:24:27 -0500
Message-ID: <4DF12BFB.5030102@freescale.com>
References: <1307573154-15838-1-git-send-email-timur@freescale.com> <201106090929.23671.arnd@arndb.de> <4DF11715.5030001@freescale.com> <201106092220.22246.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106092220.22246.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, linux-console@vger.kernel.org

Arnd Bergmann wrote:
> The lesson to learn here is obviously not to ship binaries of applications
> to customers before the driver has been merged in a mainline kernel.

Believe me, I know this, but unfortunately I have no control over every aspect
of our development cycle.

> The best way out that I can see is to make the driver carry the proper
> interface in the upstream version, but to have a private patch to support
> both interface versions in the kernel you ship on machines that require
> backwards compatibility. Once you have phased out the user application,
> you can then drop that patch and use the upstream version of the
> interfaces.

I think I can make that work.

-- 
Timur Tabi
Linux kernel developer at Freescale

