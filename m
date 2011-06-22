From: Kumar Gala <kumar.gala@freescale.com>
Subject: Re: [PATCH 1/7] powerpc: make irq_choose_cpu() available to all PIC drivers
Date: Wed, 22 Jun 2011 06:41:26 -0500
Message-ID: <9215F3F9-AA0A-4C76-B2F0-DF18A9FAAB35@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com> <1305813272-31826-2-git-send-email-timur@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1305813272-31826-2-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: Timur Tabi <timur@freescale.com>
Cc: benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org


On May 19, 2011, at 8:54 AM, Timur Tabi wrote:

> From: Stuart Yoder <stuart.yoder@freescale.com>
> 
> Move irq_choose_cpu() into arch/powerpc/kernel/irq.c so that it can be used
> by other PIC drivers.  The function is not MPIC-specific.
> 
> Signed-off-by: Stuart Yoder <stuart.yoder@freescale.com>
> Signed-off-by: Timur Tabi <timur@freescale.com>
> ---
> arch/powerpc/include/asm/irq.h |    2 ++
> arch/powerpc/kernel/irq.c      |   35 +++++++++++++++++++++++++++++++++++
> arch/powerpc/sysdev/mpic.c     |   36 ------------------------------------
> 3 files changed, 37 insertions(+), 36 deletions(-)

applied to next

- k

