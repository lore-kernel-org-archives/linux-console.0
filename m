From: Timur Tabi <timur@freescale.com>
Subject: Warning: unable to open an initial console.
Date: Mon, 25 Oct 2010 16:30:16 -0500
Message-ID: <4CC5F6E8.10704@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org

Hi,

I'm trying to write a console/tty driver, and I need help.  When the kernel
boots, I can see that console output is working through my driver.  However,
after the initial kernel boot, my console stops working.  Here are the relevant
parts of the boot log:

Using P4080DS HV machine description
Memory CAM mapping: 256/256 Mb, residual: 0Mb
Linux version 2.6.34-6506-00741-gbd4ea2b-dirty (b04825@efes) (gcc version 4.4.1
(Sourcery G++ Lite 4.4-194) ) #33 SMP Mon Oct 25 16:20:20 CDT 2010
Found initrd at 0xc1300000:0xc3b00000
...
Kernel command line: console=ttyEHV
...
console [ttyEHV0] enabled
...
NET: Registered protocol family 10
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
NET: Registered protocol family 15
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
Warning: unable to open an initial console. -19
RAMDISK: gzip image found at block 0
VFS: Mounted root (ext2 filesystem) readonly on device 1:0.
Freeing unused kernel memory: 236k init

And this is where it stops.

As you can see, I have a console, and then I lose it.  What could cause this to
happen?

On the surface, it appears that init can't open /dev/console, but I can't figure
out what the root cause is.

-- 
Timur Tabi
Linux kernel developer at Freescale

