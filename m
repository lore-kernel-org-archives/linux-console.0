From: Greg KH <greg@kroah.com>
Subject: Re: tty/powerpc: introduce the ePAPR embedded hypervisor byte
 channel driver
Date: Fri, 8 Jul 2011 15:29:51 -0700
Message-ID: <20110708222951.GA27363@kroah.com>
References: <1305830092-20104-1-git-send-email-timur@freescale.com>
 <20110708220654.GA19146@kroah.com>
 <4E178193.2090905@freescale.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=smtpout; bh=qpXL372fIxJ1SwTCDLVXVRe5YPM=; b=qUWml6uWFwppluv+gdu+hpeG+/Pnr1WiX3aGAUYz1xAYIkORoL0CYCn066HkbE++K+U/2lYEBFDt8MqQFCjXzVjx3x0630jzr1oKwIULf6mQ/y3MmqDXYVg8xI2eTmrtnLHAfx25GdV26nSN/7HmhPRxLcIlvN8c0zSZkxI4kXM=
Content-Disposition: inline
In-Reply-To: <4E178193.2090905@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, alan@lxorguk.ukuu.org.uk, arnd@arndb.de

On Fri, Jul 08, 2011 at 05:15:47PM -0500, Timur Tabi wrote:
> Greg KH wrote:
> > Doesn't apply at all to the tty-next tree, so I can't apply it here :(
> 
> Um, where exactly is the tty-next tree?  The only thing I see that looks like it
> is this:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty-2.6.git
> 
> But the description of this tree says, "junk tree, please ignore".

Don't ignore it, that's the one :)
