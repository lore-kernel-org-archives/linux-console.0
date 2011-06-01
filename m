From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Wed, 1 Jun 2011 15:54:30 -0500
Message-ID: <20110601155430.4d5aa6de@schlenkerla.am.freescale.net>
References: <1306953337-15698-1-git-send-email-timur@freescale.com>
	<20110601204618.32190be9@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110601204618.32190be9@lxorguk.ukuu.org.uk>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Timur Tabi <timur@freescale.com>, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, linux-console@vger.kernel.org, greg@kroah.com, linuxppc-dev@lists.ozlabs.org

On Wed, 1 Jun 2011 20:46:18 +0100
Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:

> > +static char *strdup_from_user(const char __user *ustr, size_t max)
> > +{
> > +	size_t len;
> > +	char *str;
> > +
> > +	len = strnlen_user(ustr, max);
> > +	if (len > max)
> > +		return ERR_PTR(-ENAMETOOLONG);

if (len >= max)

> > +	str = kmalloc(len, GFP_KERNEL);
> > +	if (!str)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	if (copy_from_user(str, ustr, len))
> > +		return ERR_PTR(-EFAULT);
> > +
> > +	return str;
> > +}

Memory leak on the EFAULT path

If strnlen_user gets an exception, it'll return zero, causing a
zero-length kmalloc.  Will kmalloc(0, ...) return NULL?  If so, a bad
user pointer would result in -ENOMEM rather than -EFAULT.

> > +	default:
> > +		pr_debug("fsl-hv: unknown ioctl %u\n", cmd);
> > +		ret = -ENOIOCTLCMD;
> 
> -ENOTTY
> 
> (-ENOIOCTLCMD is an internal indicator designed so driver layers can say
> 'dunno, try the next layer up')

There's a check for -ENOIOCTLCMD in vfs_ioctl() -- though it generates
-EINVAL rather than -ENOTTY (why?).

Using -ENOIOCTLCMD consistently would make it easier to refactor a
toplevel ioctl handler into a nested one, plus consistency is good in
general.

> > + * We use the same interrupt handler for all doorbells.  Whenever a doorbell
> > + * is rung, and we receive an interrupt, we just put the handle for that
> > + * doorbell (passed to us as *data) into all of the queues.
> 
> I wonder if these should be presented as IRQs or whether that makes no
> sense ?

They are presented as IRQs.  This driver registers the same handler for all
doorbell IRQs, and pipes the notifications up to userspace, but you could
also directly register a kernel handler for an individual doorbell IRQ.

> > +static irqreturn_t fsl_hv_shutdown_isr(int irq, void *data)
> > +{
> > +	schedule_work(&power_off);
> > +
> > +	/* We should never get here */
> 
> Probably worth printing something if you do (panic(...) ?)

I don't think the comment is accurate.  We've just scheduled the workqueue,
not waited for it to complete.

Timur, shouldn't this schedule orderly_poweroff rather than
kernel_power_off?

-Scott

