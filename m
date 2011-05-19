From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded hypervisor byte channel driver
Date: Thu, 19 May 2011 17:02:39 +0200
Message-ID: <201105191702.39919.arnd@arndb.de>
References: <1305813272-31826-1-git-send-email-timur@freescale.com> <1305813272-31826-7-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1305813272-31826-7-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Thursday 19 May 2011, Timur Tabi wrote:
> 
> The ePAPR embedded hypervisor specification provides an API for "byte
> channels", which are serial-like virtual devices for sending and receiving
> streams of bytes.

Why is this using a full tty driver instead of the hvc framework that most
other hypervisor consoles use?

	Arnd
