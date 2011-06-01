From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Wed, 1 Jun 2011 20:46:18 +0100
Message-ID: <20110601204618.32190be9@lxorguk.ukuu.org.uk>
References: <1306953337-15698-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1306953337-15698-1-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

O> +	/* One partition must be local, the other must be remote.  In other
> +	   words, if source and target are both -1, or are both not -1, then
> +	   return an error. */
> +	if ((param.source == -1) == (param.target == -1))
> +		return -EINVAL;

Excess brackets (I just mention that one in passing)

> +	/* pages is an array of struct page pointers that's initialized by
> +	   get_user_pages() */
> +	pages = kzalloc(nr_pages * sizeof(struct page *), GFP_KERNEL);
> +	if (!pages) {
> +		pr_debug("fsl-hv: could not allocate page list\n");
> +		return -ENOMEM;
> +	}

pages allocated

> +
> +	/* sg_list is the list of fh_sg_list objects that we pass to the
> +	   hypervisor */
> +	sg_list_unaligned = kmalloc(nr_pages * sizeof(struct fh_sg_list) +
> +		sizeof(struct fh_sg_list) - 1, GFP_KERNEL);
> +	if (!sg_list_unaligned) {
> +		pr_debug("fsl-hv: could not allocate S/G list\n");

but not freed on this path

Although the other paths look fine.

> +exit:
> +	if (pages) {
> +		for (i = 0; i < nr_pages; i++)
> +			if (pages[i])
> +				page_cache_release(pages[i]);
> +	}
> +
> +	kfree(sg_list_unaligned);
> +	kfree(pages);

> +static char *strdup_from_user(const char __user *ustr, size_t max)
> +{
> +	size_t len;
> +	char *str;
> +
> +	len = strnlen_user(ustr, max);
> +	if (len > max)
> +		return ERR_PTR(-ENAMETOOLONG);
> +
> +	str = kmalloc(len, GFP_KERNEL);
> +	if (!str)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (copy_from_user(str, ustr, len))
> +		return ERR_PTR(-EFAULT);
> +
> +	return str;
> +}

This belongs on lib/ if its of general use which I think it perhaps is
and if we don't have one already.


> +	default:
> +		pr_debug("fsl-hv: unknown ioctl %u\n", cmd);
> +		ret = -ENOIOCTLCMD;

-ENOTTY

(-ENOIOCTLCMD is an internal indicator designed so driver layers can say
'dunno, try the next layer up')

> +/* Linked list of processes that have us open */
> +struct list_head db_list;

static ?


> + * We use the same interrupt handler for all doorbells.  Whenever a doorbell
> + * is rung, and we receive an interrupt, we just put the handle for that
> + * doorbell (passed to us as *data) into all of the queues.

I wonder if these should be presented as IRQs or whether that makes no
sense ?


> +static irqreturn_t fsl_hv_state_change_isr(int irq, void *data)
> +{
> +	unsigned int status;
> +	struct doorbell_isr *dbisr = data;
> +	int ret;
> +
> +	/* Determine the new state, and if it's stopped, notify the clients. */
> +	ret = fh_partition_get_status(dbisr->partition, &status);
> +	if (!ret && (status == FH_PARTITION_STOPPED))
> +		schedule_work(&dbisr->work);
> +
> +	/* Call the normal handler */
> +	return fsl_hv_isr(irq, (void *) (uintptr_t) dbisr->doorbell);
> +}

Would a threaded IRQ clean this up by avoiding the queue/work stuff ?


> +static irqreturn_t fsl_hv_shutdown_isr(int irq, void *data)
> +{
> +	schedule_work(&power_off);
> +
> +	/* We should never get here */

Probably worth printing something if you do (panic(...) ?)

