From: Kumar Gala <kumar.gala@freescale.com>
Subject: Re: [PATCH 5/7] powerpc/85xx: add board support for the Freescale hypervisor
Date: Wed, 22 Jun 2011 06:42:00 -0500
Message-ID: <5853C1C3-ADAF-4F6E-A675-F4DEF7162B38@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com> <1305813272-31826-6-git-send-email-timur@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1305813272-31826-6-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: Timur Tabi <timur@freescale.com>
Cc: benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org


On May 19, 2011, at 8:54 AM, Timur Tabi wrote:

> Add support for the ePAPR-compliant Freescale hypervisor (aka "Topaz") on the
> Freescale P3041DS, P4080DS, and P5020DS reference boards.
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>
> ---
> arch/powerpc/platforms/85xx/Kconfig      |    3 +++
> arch/powerpc/platforms/85xx/corenet_ds.c |    7 +++++++
> arch/powerpc/platforms/85xx/p3041_ds.c   |   16 +++++++++++++++-
> arch/powerpc/platforms/85xx/p4080_ds.c   |   29 ++++++++++++++++-------------
> arch/powerpc/platforms/85xx/p5020_ds.c   |   16 +++++++++++++++-
> 5 files changed, 56 insertions(+), 15 deletions(-)

applied to next

- k
