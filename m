From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded
 hypervisor byte channel driver
Date: Thu, 19 May 2011 18:25:51 +0100
Message-ID: <20110519182551.0c06cd10@lxorguk.ukuu.org.uk>
References: <1305813272-31826-1-git-send-email-timur@freescale.com>
	<1305813272-31826-7-git-send-email-timur@freescale.com>
	<20110519153358.5876f310@lxorguk.ukuu.org.uk>
	<4DD545E4.9090408@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <4DD545E4.9090408@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Thu, 19 May 2011 11:31:32 -0500
Timur Tabi <timur@freescale.com> wrote:

> Alan Cox wrote:
> > You really also need a hangup method so vhangup() does the right thing
> > and you can securely do logins etc and sessions on your console. As
> > you've got no hardware entangled in this and you already use tty_port
> > helpers the hangup helper will do the work for you.
> 
> So all I need is this?
> 
> static void ehv_bc_tty_hangup(struct tty_struct *ttys)
> {
> 	struct ehv_bc_data *bc = ttys->driver_data;
> 
> 	tty_port_hangup(&bc->port);
> }
> 
> I've noticed that some drivers flush their transmit buffers before calling
> tty_port_hangup(), but some others don't.  Should I do this too?  I don't know
> if hangup should be as quick as possible.

Doesn't matter too much. If you can flush it quickly then do so
