From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor management driver
Date: Fri, 3 Jun 2011 17:28:43 +0200
Message-ID: <201106031728.43707.arnd@arndb.de>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106012340.14237.arnd@arndb.de> <20110601172412.761ff799@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110601172412.761ff799@schlenkerla.am.freescale.net>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Scott Wood <scottwood@freescale.com>
Cc: Timur Tabi <timur@freescale.com>, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, linux-console@vger.kernel.org, greg@kroah.com, linuxppc-dev@lists.ozlabs.org

On Thursday 02 June 2011, Scott Wood wrote:
> I wanted to have the hypervisor take an update dtb (we already have special
> meta-properties for things like deletion as part of the hv config
> mechanism).  But others on the project wanted to keep it simple, and so
> get/set property it was. :-/
> 
> It's unlikely to change at this point without a real need.
> 
> As for a filesystem interface, it's not a good match either. 
> You can't iterate over anything to read out the full tree from the hv.

kexec iterates over /proc/device-tree to create a dts blob.

> You can't delete anything. 

rm, rmdir

> You can't create empty nodes.

mkdir

> The hv interface was meant to enable some specific management actions,
> rather than to provide general device tree access.  This driver is a thin
> wrapper around the management hcalls.

A file system would be a slightly more abstract interface to do the
same thing, I gues.

> There would still be other ioctls needed for starting/stopping the
> partition, etc.

Right, although you could model them as a file interface as well.
KVMfs is one example doing that.

	Arnd
