From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v5] drivers/virt: introduce Freescale hypervisor management driver
Date: Thu, 9 Jun 2011 22:13:13 +0200
Message-ID: <201106092213.13755.arnd@arndb.de>
References: <1307646794-26374-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1307646794-26374-1-git-send-email-timur@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>, linuxppc-dev@lists.ozlabs.org
Cc: alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, virtualization@lists.linux-foundation.org

Hi Timur, thanks for addressing the issues I pointed out. Unfortunately, I
have found a few more now:

On Thursday 09 June 2011 21:13:14 Timur Tabi wrote:
> +       /* Make sure the application is called the right driver. */
> +       if (_IOC_TYPE(cmd) != 0) {
> +               pr_debug("fsl-hv: ioctl type %u should be 0\n", _IOC_TYPE(cmd));
> +               return -EINVAL;
> +       }
> +
> +       /* Make sure the application set the direction flag correctly. */
> +       if (_IOC_DIR(cmd) != (_IOC_READ | _IOC_WRITE)) {
> +               pr_debug("fsl-hv: ioctl direction should be _IOWR\n");
> +               return -EINVAL;
> +       }
> +
> +       /*
> +        * Make sure the application is passing the right structure to us.
> +        * For backwards compatibility with older applications, we only check
> +        * if the size is too small, rather than unequal.
> +        */
> +
> +       switch (_IOC_NR(cmd)) {
> +       case (_IOC_NR(FSL_HV_IOCTL_PARTITION_RESTART)):
> +               size = sizeof(struct fsl_hv_ioctl_restart);
> +               if (_IOC_SIZE(cmd) < size)
> +                       goto size_error;
> +               ret = ioctl_restart(arg);
> +               break;

As mentioned, it would be easier and more readable to just do

	switch(cmd) {
	case FSL_HV_IOCTL_PARTITION_RESTART:
		...

	case FSL_HV_IOCTL_PARTITION_GET_STATUS;
		...

There is no need to check the bits individually when you can simply
compare the command number.

> +/**
> + * enum fsl_hv_ioctl_cmd - ioctl commands
> + * @FSL_HV_IOCTL_PARTITION_RESTART: restart another partition
> + * @FSL_HV_IOCTL_PARTITION_GET_STATUS: get a partition's status
> + * @FSL_HV_IOCTL_PARTITION_START: boot another partition
> + * @FSL_HV_IOCTL_PARTITION_STOP: stop this or another partition
> + * @FSL_HV_IOCTL_MEMCPY: copy data from one partition to another
> + * @FSL_HV_IOCTL_DOORBELL: ring a doorbell
> + * @FSL_HV_IOCTL_GETPROP: get a property from another guest's device tree
> + * @FSL_HV_IOCTL_SETPROP: set a property in another guest's device tree
> + *
> + * This enum lists the available ioctl commands for the Freescale hypervisor
> + * management driver.  The meaning
> + */
> +enum fsl_hv_ioctl_cmd {
> +       FSL_HV_IOCTL_PARTITION_RESTART = _IOWR(0, 1, struct fsl_hv_ioctl_restart),
> +       FSL_HV_IOCTL_PARTITION_GET_STATUS = _IOWR(0, 2, struct fsl_hv_ioctl_status),
> +       FSL_HV_IOCTL_PARTITION_START = _IOWR(0, 3, struct fsl_hv_ioctl_start),
> +       FSL_HV_IOCTL_PARTITION_STOP = _IOWR(0, 4, struct fsl_hv_ioctl_stop),
> +       FSL_HV_IOCTL_MEMCPY = _IOWR(0, 5, struct fsl_hv_ioctl_memcpy),
> +       FSL_HV_IOCTL_DOORBELL = _IOWR(0, 6, struct fsl_hv_ioctl_doorbell),
> +       FSL_HV_IOCTL_GETPROP = _IOWR(0, 7, struct fsl_hv_ioctl_prop),
> +       FSL_HV_IOCTL_SETPROP = _IOWR(0, 8, struct fsl_hv_ioctl_prop),
> +};

Using a #define here is usually preferred because then you can use #ifdef in a user
application to check if a given value has been assigned.

More importantly, the code you have chose (0) conflicts with existing drivers
(frame buffer, scsi and wavefront among others). Please chose a free one and
add it to Documentation/ioctl/ioctl-number.txt in the same patch.

	Arnd
