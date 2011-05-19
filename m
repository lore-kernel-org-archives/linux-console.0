From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded hypervisor
 byte channel driver
Date: Thu, 19 May 2011 10:09:16 -0500
Message-ID: <4DD5329C.2040200@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com> <1305813272-31826-7-git-send-email-timur@freescale.com> <201105191702.39919.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201105191702.39919.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Arnd Bergmann wrote:
> Why is this using a full tty driver instead of the hvc framework that most
> other hypervisor consoles use?

Because HVC uses the same interface for consoles and tty, and that resulted in
dropped characters if the client driver returns EAGAIN because it's output
buffer is full.  I posted a patch that "fixes" this, but it was rejected.
Here's the original patch:

http://lists.ozlabs.org/pipermail/linuxppc-dev/2010-August/085136.html

And here's the thread discussing our concerns:

http://lists.ozlabs.org/pipermail/linuxppc-dev/2010-September/thread.html

(search for "fix dropping of characters when output byte channel is full")

-- 
Timur Tabi
Linux kernel developer at Freescale

