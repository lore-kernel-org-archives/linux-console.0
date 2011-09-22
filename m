From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] drivers/tty: don't use the byte channel handle as a
 parameter in ehv_bytechan.c
Date: Thu, 22 Sep 2011 16:06:40 -0700
Message-ID: <20110922230640.GA16981@kroah.com>
References: <1316543217-13769-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=smtpout;
	 bh=Eud4AefG0DwcOy5jyoSM6mpq4yg=; b=Sml3xo+ED6Pc8g5NL9R0ESr5TRjr
	1H2l2BlDhKC5JgaXYCReVem1wum8G3Ywln2RpBJ6NNl/qUT1Qw1YcrM/WVoxso0o
	9v60QK53iCUrZNK8f/7aD/yh1MJoXW5u0EZpsmkVBm+wLToBcxlqCuQsNsn2aama
	2IAdZEeHHFEPXsk=
Content-Disposition: inline
In-Reply-To: <1316543217-13769-1-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-console@vger.kernel.org

On Tue, Sep 20, 2011 at 01:26:57PM -0500, Timur Tabi wrote:
> The ePAPR hypervisor byte channel console driver only supports one byte
> channel as a console, and the byte channel handle is stored in a global
> variable.  It doesn't make any sense to pass that handle as a parameter
> to the console functions, since these functions already have access to the
> global variable.
> 
> This change also fixes this compilation warning on a 64-bit kernel:
> 
>   CC      drivers/tty/ehv_bytechan.o
> drivers/tty/ehv_bytechan.c: In function 'ehv_bc_console_write':
> drivers/tty/ehv_bytechan.c:289:24: warning: cast from pointer to integer of different size
> drivers/tty/ehv_bytechan.c: In function 'ehv_bc_console_init':
> drivers/tty/ehv_bytechan.c:355:24: warning: cast to pointer from integer of different size
> 
> This warning is because the driver is converting the integer byte channel
> handle to/from the void* 'data' field of struct console.  Rather than fix
> the warning, we just eliminate the code altogether.
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>
> ---
>  drivers/tty/ehv_bytechan.c |    7 ++-----

This patch doesn't apply at all to my tty tree, what was it made
against?

confused,

greg k-h
