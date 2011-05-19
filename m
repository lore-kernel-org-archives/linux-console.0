From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded hypervisor
 byte channel driver
Date: Thu, 19 May 2011 10:14:38 -0500
Message-ID: <4DD533DE.1020705@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com>	<1305813272-31826-7-git-send-email-timur@freescale.com> <20110519153358.5876f310@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110519153358.5876f310@lxorguk.ukuu.org.uk>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Alan Cox wrote:
> ttys = tty_port_tty_get(&bc->port);
> stuff
> if (ttys != NULL)
> 	tty stuff
> 	tty_kref_put(ttys);

Under what circumstances can ttys be NULL?  I currently only use this code in
the RX and TX interrupt handlers, which are both enabled in the
tty_port_operations.activate() function.

Is this right for the TX handler:

static irqreturn_t ehv_bc_tty_tx_isr(int irq, void *data)
{
	struct ehv_bc_data *bc = data;
	struct tty_struct *ttys = tty_port_tty_get(&bc->port);

	ehv_bc_tx_dequeue(bc);
	if (ttys) {
		tty_wakeup(ttys);
		tty_kref_put(ttys);
	}

	return IRQ_HANDLED;
}

I just want to make sure that testing for NULL is really necessary in my
interrupt handlers.

>> > +		len = min_t(unsigned int,
>> > +			    CIRC_CNT_TO_END(bc->head, bc->tail, BUF_SIZE),
>> > +			    EV_BYTE_CHANNEL_MAX_BYTES);
> The kfifo API is probably faster and cleaner. Much of tty still uses
> CIRC_* because they predate the new APIs.

Ok, I'll change it.

> You really also need a hangup method so vhangup() does the right thing
> and you can securely do logins etc and sessions on your console. As
> you've got no hardware entangled in this and you already use tty_port
> helpers the hangup helper will do the work for you.

Ok.

> 
> I guess the only other thing to consider is whether you want to implement
> a SYSRQ interface on your console ?

I don't think byte channels can support SYSRQ, but I'll look into it.

-- 
Timur Tabi
Linux kernel developer at Freescale

