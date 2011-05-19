From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded hypervisor
 byte channel driver
Date: Thu, 19 May 2011 09:27:52 -0500
Message-ID: <4DD528E8.20203@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com> <1305813272-31826-7-git-send-email-timur@freescale.com> <20110519142225.GC21441@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110519142225.GC21441@kroah.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <greg@kroah.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Greg KH wrote:
> Why do this conversion in the driver?  Shouldn't that be something that
> userspace worries about?

The udbg interface is a very early kernel printk interface.  I don't know what
the "u" stands for, but "dbg" is for "debug".  The udbg interface is removed
once a normal console driver kicks in.

This is why I need to specify the byte channel handle via Kconfig.  This code is
used so early that not even the device tree is available.

All of the udbg_putc functions do this.

-- 
Timur Tabi
Linux kernel developer at Freescale

