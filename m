From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded hypervisor
 byte channel driver
Date: Thu, 19 May 2011 07:22:25 -0700
Message-ID: <20110519142225.GC21441@kroah.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com>
 <1305813272-31826-7-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=smtpout; bh=2dKC4yGy2zFHM1VmOVcM2nXL7nM=; b=ggAwUYURggyVfpbeYTUtoGd7aTGYm78g9FNNlJc7EqCPGJarSIhWrYXNPGLOWLxWMXbiU338+bH638MvS8snkjqVMCnuPE/5ihEMJPvrs7T52cQWZBjqLcfykWECmME53Vg41b7s53wWWBoAzU7sHvkfPJJjMjkMuXoUbEu8r8w=
Content-Disposition: inline
In-Reply-To: <1305813272-31826-7-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Thu, May 19, 2011 at 08:54:31AM -0500, Timur Tabi wrote:
> +/*
> + * The udbg subsystem calls this function to display a single character.
> + * We convert CR to a CR/LF.
> + */
> +static void ehv_bc_udbg_putc(char c)
> +{
> +	if (c == '\n')
> +		byte_channel_spin_send('\r');
> +
> +	byte_channel_spin_send(c);
> +}

Why do this conversion in the driver?  Shouldn't that be something that
userspace worries about?

thanks,

greg k-h
