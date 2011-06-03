From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Fri, 3 Jun 2011 09:44:23 -0500
Message-ID: <4DE8F347.9060104@freescale.com>
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
> For an ioctl, please follow the normal pattern of defining a separate
> structure for each case, no union.
> 
> You can use a void __user * in the common ioctl function, and pass that
> to the typed argument list in the specific functions.

I have a GPL question.  This header file is currently licensed under the  GPL v2
only.  Does that mean that any application that includes this header file so
that it can talk to the driver/hypervisor also needs to be licensed under the GPL?

-- 
Timur Tabi
Linux kernel developer at Freescale

