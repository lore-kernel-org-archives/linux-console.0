From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Wed, 1 Jun 2011 17:24:12 -0500
Message-ID: <20110601172412.761ff799@schlenkerla.am.freescale.net>
References: <1306953337-15698-1-git-send-email-timur@freescale.com>
	<201106012340.14237.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106012340.14237.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Timur Tabi <timur@freescale.com>, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, linux-console@vger.kernel.org, greg@kroah.com, linuxppc-dev@lists.ozlabs.org

On Wed, 1 Jun 2011 23:40:14 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> > +static long ioctl_dtprop(struct fsl_hv_ioctl_prop __user *p, int set)
> > +{
> > +	struct fsl_hv_ioctl_prop param;
> > +	char __user *upath, *upropname;
> > +	void __user *upropval;
> > +	char *path = NULL, *propname = NULL;
> > +	void *propval = NULL;
> > +	int ret = 0;
> > +
> 
> I'm not convinced that an ioctl interface is the right way to work with
> device tree properties. A more natural way would be to export it as
> a file system, or maybe as a flattened device tree blob (the latter option
> would require changing the hypervisor interface, which might not be
> possible).

I wanted to have the hypervisor take an update dtb (we already have special
meta-properties for things like deletion as part of the hv config
mechanism).  But others on the project wanted to keep it simple, and so
get/set property it was. :-/

It's unlikely to change at this point without a real need.

As for a filesystem interface, it's not a good match either.  You can't
iterate over anything to read out the full tree from the hv.  You can't
delete anything.  You can't create empty nodes.  The hv interface was meant
to enable some specific management actions, rather than to provide general
device tree access.  This driver is a thin wrapper around the management
hcalls.

There would still be other ioctls needed for starting/stopping the
partition, etc.

> > +/**
> > + * fsl_hv_ioctl: ioctl main entry point
> > + */
> > +static long fsl_hv_ioctl(struct file *file, unsigned int cmd,
> > +			 unsigned long argaddr)
> > +{
> > +	union fsl_hv_ioctl_param __user *arg =
> > +		(union fsl_hv_ioctl_param __user *)argaddr;
> > +	long ret;
> > +
> 
> For an ioctl, please follow the normal pattern of defining a separate
> structure for each case, no union.

And have fsl_hypervisor.h provide the full set of proper ioctl numbers, with
the specific struct for each ioctl referenced, rather than having the client program do
"ioctl(f, _IOWR(0, cmd, union fsl_hv_ioctl_param), p)".

-Scott

