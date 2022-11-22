From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] virtio_console: Introduce an ID allocator for virtual
 console numbers
Date: Tue, 22 Nov 2022 16:15:26 +0100
Message-ID: <61474ecb-fa2a-e651-9157-b73b6b5a8295__22786.8171919667$1669130301$gmane$org@redhat.com>
References: <20221122134643.376184-1-clg@kaod.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669130132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hK0ObLejkUdO2kT5TG9vuCU2RH+H4+xSCZQ9aj/PoXU=;
        b=J8ryw+EkuV7DG2NHZ3QMwcUrLprL3LBkrQi+mqUfE6LnpVoHYq1kbKqyKxmR+37k6mdRLD
        +cArgk+FmWeU/uNnEndSgVdjF70C0vC0Uk4jy8JQZSm/9o/Fjr3pdPjjUq/nLzopMRiM+k
        FqYV/Tu1qJmTLZ8FEIUB+opkn7edrBE=
Content-Language: en-US
In-Reply-To: <20221122134643.376184-1-clg@kaod.org>
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org

On 22/11/2022 14.46, Cédric Le Goater wrote:
> When a virtio console port is initialized, it is registered as an hvc
> console using a virtual console number. If a KVM guest is started with
> multiple virtio console devices, the same vtermno (or virtual console
> number) can be used to allocate different hvc consoles, which leads to
> various communication problems later on.
> 
> This is also reported in debugfs :
> 
>    # grep vtermno /sys/kernel/debug/virtio-ports/*
>    /sys/kernel/debug/virtio-ports/vport1p1:console_vtermno: 1
>    /sys/kernel/debug/virtio-ports/vport2p1:console_vtermno: 1
>    /sys/kernel/debug/virtio-ports/vport3p1:console_vtermno: 2
>    /sys/kernel/debug/virtio-ports/vport4p1:console_vtermno: 3
> 
> Replace the next_vtermno global with an ID allocator and start the
> allocation at 1 as it is today. Also recycle IDs when a console port
> is removed.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>   Changes in v3:
>   - made use of ida_alloc_min()
>   - free ID in case of error
>   
>   Changes in v2:
>   - introduced an ID allocator
> 
>   drivers/char/virtio_console.c | 26 +++++++++++---------------
>   1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index 9fa3c76a267f..6a821118d553 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -13,6 +13,7 @@
>   #include <linux/fs.h>
>   #include <linux/splice.h>
>   #include <linux/pagemap.h>
> +#include <linux/idr.h>
>   #include <linux/init.h>
>   #include <linux/list.h>
>   #include <linux/poll.h>
> @@ -48,22 +49,11 @@ struct ports_driver_data {
>   	/* List of all the devices we're handling */
>   	struct list_head portdevs;
>   
> -	/*
> -	 * This is used to keep track of the number of hvc consoles
> -	 * spawned by this driver.  This number is given as the first
> -	 * argument to hvc_alloc().  To correctly map an initial
> -	 * console spawned via hvc_instantiate to the console being
> -	 * hooked up via hvc_alloc, we need to pass the same vtermno.
> -	 *
> -	 * We also just assume the first console being initialised was
> -	 * the first one that got used as the initial console.
> -	 */
> -	unsigned int next_vtermno;
> -
>   	/* All the console devices handled by this driver */
>   	struct list_head consoles;
>   };
> -static struct ports_driver_data pdrvdata = { .next_vtermno = 1};
> +
> +static struct ports_driver_data pdrvdata;
>   
>   static DEFINE_SPINLOCK(pdrvdata_lock);
>   static DECLARE_COMPLETION(early_console_added);
> @@ -89,6 +79,8 @@ struct console {
>   	u32 vtermno;
>   };
>   
> +static DEFINE_IDA(vtermno_ida);
> +
>   struct port_buffer {
>   	char *buf;
>   
> @@ -1244,18 +1236,21 @@ static int init_port_console(struct port *port)
>   	 * pointers.  The final argument is the output buffer size: we
>   	 * can do any size, so we put PAGE_SIZE here.
>   	 */
> -	port->cons.vtermno = pdrvdata.next_vtermno;
> +	ret = ida_alloc_min(&vtermno_ida, 1, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
>   
> +	port->cons.vtermno = ret;
>   	port->cons.hvc = hvc_alloc(port->cons.vtermno, 0, &hv_ops, PAGE_SIZE);
>   	if (IS_ERR(port->cons.hvc)) {
>   		ret = PTR_ERR(port->cons.hvc);
>   		dev_err(port->dev,
>   			"error %d allocating hvc for port\n", ret);
>   		port->cons.hvc = NULL;
> +		ida_free(&vtermno_ida, port->cons.vtermno);
>   		return ret;
>   	}
>   	spin_lock_irq(&pdrvdata_lock);
> -	pdrvdata.next_vtermno++;
>   	list_add_tail(&port->cons.list, &pdrvdata.consoles);
>   	spin_unlock_irq(&pdrvdata_lock);
>   	port->guest_connected = true;
> @@ -1532,6 +1527,7 @@ static void unplug_port(struct port *port)
>   		list_del(&port->cons.list);
>   		spin_unlock_irq(&pdrvdata_lock);
>   		hvc_remove(port->cons.hvc);
> +		ida_free(&vtermno_ida, port->cons.vtermno);
>   	}
>   
>   	remove_port_data(port);

Reviewed-by: Thomas Huth <thuth@redhat.com>

