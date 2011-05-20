From: Kumar Gala <kumar.gala@freescale.com>
Subject: Re: [PATCH 0/7] This patchset adds support for running Linux under the Freescale hypervisor,
Date: Fri, 20 May 2011 15:29:08 -0500
Message-ID: <A221B293-A4DD-4223-AEEA-F3E5243D2C0A@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1305813272-31826-1-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: Timur Tabi <timur@freescale.com>
Cc: benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org


On May 19, 2011, at 8:54 AM, Timur Tabi wrote:

> have hypervisor extensions (e.g. the P4080 which has an e500mc core).
> 
> I think it makes sense for this patchset to go through Kumar Gala's -next 
> branch, but I still need ACKs from various people on the parts that are
> not e500-specific.
> 
> 1. powerpc: make irq_choose_cpu() available to all PIC drivers
> 2. powerpc: introduce ePAPR embedded hypervisor hcall interface
> 3. powerpc: introduce the ePAPR embedded hypervisor vmpic driver
> 4. powerpc: add Freescale hypervisor partition control functions
> 5. powerpc/85xx: add board support for the Freescale hypervisor
> 6. tty/powerpc: introduce the ePAPR embedded hypervisor byte channel driver
> 7. drivers/misc: introduce Freescale hypervisor management driver
> 
> Ben Herrenschmidt, please review/ack parts 1-3.
> 
> Greg Kroah-Hartman, please review/ack part 6.
> 
> Andrew Morton, please review/ack part 7.
> 
> Thank you very much for looking at this patchset.  I hope to have it included 
> in 2.6.40.

Applied to 'test' branch.  (grabbed 'v2' of tty patch).  Fixed merged conflicts.

- k
