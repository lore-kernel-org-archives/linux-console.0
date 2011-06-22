From: Kumar Gala <kumar.gala@freescale.com>
Subject: Re: [PATCH 4/7] powerpc: add Freescale hypervisor partition control functions
Date: Wed, 22 Jun 2011 06:41:52 -0500
Message-ID: <CC6FDFDC-FB47-495E-B998-5D1CD115AA2D@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com> <1305813272-31826-5-git-send-email-timur@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1305813272-31826-5-git-send-email-timur@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: Timur Tabi <timur@freescale.com>
Cc: benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org


On May 19, 2011, at 8:54 AM, Timur Tabi wrote:

> Add functions to restart and halt the current partition when running under
> the Freescale hypervisor.  These functions should be assigned to various
> function pointers of the ppc_md structure during the .probe() function for
> the board:
> 
> 	ppc_md.restart = fsl_hv_restart;
> 	ppc_md.power_off = fsl_hv_halt;
> 	ppc_md.halt = fsl_hv_halt;
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>
> ---
> arch/powerpc/sysdev/fsl_soc.c |   27 +++++++++++++++++++++++++++
> arch/powerpc/sysdev/fsl_soc.h |    3 +++
> 2 files changed, 30 insertions(+), 0 deletions(-)

applied to next

- k
