From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v6] drivers/virt: introduce Freescale hypervisor management driver
Date: Thu, 9 Jun 2011 23:04:55 +0200
Message-ID: <201106092304.55479.arnd@arndb.de>
References: <1307652726-4356-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1307652726-4356-1-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: virtualization@lists.linux-foundation.org
Cc: Timur Tabi <timur@freescale.com>, alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, dsaxena@linaro.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Thursday 09 June 2011 22:52:06 Timur Tabi wrote:
> Add the drivers/virt directory, which houses drivers that support
> virtualization environments, and add the Freescale hypervisor management
> driver.
> 
> The Freescale hypervisor management driver provides several services to
> drivers and applications related to the Freescale hypervisor:
> 
> 1. An ioctl interface for querying and managing partitions
> 
> 2. A file interface to reading incoming doorbells
> 
> 3. An interrupt handler for shutting down the partition upon receiving the
>    shutdown doorbell from a manager partition
> 
> 4. A kernel interface for receiving callbacks when a managed partition
>    shuts down.
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
