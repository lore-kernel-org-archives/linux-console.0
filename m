From: Greg KH <greg@kroah.com>
Subject: Re: tty/powerpc: introduce the ePAPR embedded hypervisor byte
 channel driver
Date: Fri, 8 Jul 2011 15:06:54 -0700
Message-ID: <20110708220654.GA19146@kroah.com>
References: <1305830092-20104-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=smtpout; bh=nZX/yUK7Mhs/F9kIiC+j9eZnBzI=; b=c3x+jyVsECqKLbWvnByJJTufnDaait1YGiv47IlPbOqGKJNeVNtU91DefJU1Z9WgMWhXlrpu6V8Q5c0n9Wq+kYffMkP+KxGpLLb9WgJvDRqQywhZPcwj7SCZPm3mhzRMXZIU05VMuHzeG/U4vsZLCSF9s47VG5BGf7CFE52K18I=
Content-Disposition: inline
In-Reply-To: <1305830092-20104-1-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, alan@lxorguk.ukuu.org.uk, arnd@arndb.de

On Thu, May 19, 2011 at 08:34:52AM -0000, Timur Tabi wrote:
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

Doesn't apply at all to the tty-next tree, so I can't apply it here :(

