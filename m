From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 6/7] [v2] tty/powerpc: introduce the ePAPR embedded hypervisor
 byte channel driver
Date: Wed, 22 Jun 2011 10:23:32 -0500
Message-ID: <4E0208F4.4030800@freescale.com>
References: <1305830092-20104-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1305830092-20104-1-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kerne

Timur Tabi wrote:
> The ePAPR embedded hypervisor specification provides an API for "byte
> channels", which are serial-like virtual devices for sending and receiving
> streams of bytes.  This driver provides Linux kernel support for byte
> channels via three distinct interfaces:
> 
> 1) An early-console (udbg) driver.  This provides early console output
> through a byte channel.  The byte channel handle must be specified in a
> Kconfig option.
> 
> 2) A normal console driver.  Output is sent to the byte channel designated
> for stdout in the device tree.  The console driver is for handling kernel
> printk calls.
> 
> 3) A tty driver, which is used to handle user-space input and output.  The
> byte channel used for the console is designated as the default tty.
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>

I know you guys are busy, but can I get an ACK or two on this patch, if there
are no issues with it?  It's the only one of the seven that doesn't have one.  I
think v2 has addressed all of the concerns raised on version 1.

-- 
Timur Tabi
Linux kernel developer at Freescale

