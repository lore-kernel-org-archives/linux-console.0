From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded
 hypervisor byte channel driver
Date: Thu, 19 May 2011 15:36:12 +0100
Message-ID: <20110519153612.726140be@lxorguk.ukuu.org.uk>
References: <1305813272-31826-1-git-send-email-timur@freescale.com>
	<1305813272-31826-7-git-send-email-timur@freescale.com>
	<20110519142225.GC21441@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110519142225.GC21441@kroah.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <greg@kroah.com>
Cc: Timur Tabi <timur@freescale.com>, kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Thu, 19 May 2011 07:22:25 -0700
Greg KH <greg@kroah.com> wrote:

> On Thu, May 19, 2011 at 08:54:31AM -0500, Timur Tabi wrote:
> > +/*
> > + * The udbg subsystem calls this function to display a single character.
> > + * We convert CR to a CR/LF.
> > + */
> > +static void ehv_bc_udbg_putc(char c)
> > +{
> > +	if (c == '\n')
> > +		byte_channel_spin_send('\r');
> > +
> > +	byte_channel_spin_send(c);
> > +}
> 
> Why do this conversion in the driver?  Shouldn't that be something that
> userspace worries about?

udbg is a bit before the land of userspace so it needs to do whatever
adaption the firmware/happyvisor interface wants.
