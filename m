From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Wed, 1 Jun 2011 22:45:06 +0100
Message-ID: <20110601224506.4c593d61@lxorguk.ukuu.org.uk>
References: <1306953337-15698-1-git-send-email-timur@freescale.com>
	<20110601204618.32190be9@lxorguk.ukuu.org.uk>
	<20110601155430.4d5aa6de@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110601155430.4d5aa6de@schlenkerla.am.freescale.net>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Wood <scottwood@freescale.com>
Cc: Timur Tabi <timur@freescale.com>, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, linux-console@vger.kernel.org, greg@kroah.com, linuxppc-dev@lists.ozlabs.org


> There's a check for -ENOIOCTLCMD in vfs_ioctl() -- though it generates
> -EINVAL rather than -ENOTTY (why?).

Good question - perhaps someone didn't read the spec 8)
