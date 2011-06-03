From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Fri, 3 Jun 2011 11:22:13 -0500
Message-ID: <20110603112213.4f4d1b4e@schlenkerla.am.freescale.net>
References: <1306953337-15698-1-git-send-email-timur@freescale.com>
	<201106012340.14237.arnd@arndb.de>
	<20110601172412.761ff799@schlenkerla.am.freescale.net>
	<201106031728.43707.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106031728.43707.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Timur Tabi <timur@freescale.com>, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, linux-console@vger.kernel.org, greg@kroah.com, linuxppc-dev@lists.ozlabs.org

On Fri, 3 Jun 2011 17:28:43 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Thursday 02 June 2011, Scott Wood wrote:
> > I wanted to have the hypervisor take an update dtb (we already have special
> > meta-properties for things like deletion as part of the hv config
> > mechanism).  But others on the project wanted to keep it simple, and so
> > get/set property it was. :-/
> > 
> > It's unlikely to change at this point without a real need.
> > 
> > As for a filesystem interface, it's not a good match either. 
> > You can't iterate over anything to read out the full tree from the hv.
> 
> kexec iterates over /proc/device-tree to create a dts blob.

That's irrelevant, because we're not talking about that device tree.  We're
talking about the device tree of another hypervisor guest.

> > You can't delete anything. 
> 
> rm, rmdir
> 
> > You can't create empty nodes.
> 
> mkdir

I know how to operate a filesystem.  You can't do these operations *on
another guest's device tree through the hv interface*.

> > There would still be other ioctls needed for starting/stopping the
> > partition, etc.
> 
> Right, although you could model them as a file interface as well.
> KVMfs is one example doing that.

And what would be the benefit of this major restructuring and added
complexity?

-Scott

