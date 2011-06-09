From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v5] drivers/virt: introduce Freescale hypervisor
 management driver
Date: Thu, 9 Jun 2011 15:40:13 -0500
Message-ID: <4DF12FAD.9010101@freescale.com>
References: <1307646794-26374-1-git-send-email-timur@freescale.com> <201106092213.13755.arnd@arndb.de> <4DF12A94.6070605@freescale.com> <20110609203117.GB14235@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110609203117.GB14235@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <greg@kroah.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, virtualization@lists.linux-foundation.org

Greg KH wrote:
> Why is binary compatibility important?  Isn't this a brand new driver
> for a brand new system?  What userspace tools are out there in the wild
> for such a thing?

This driver (and the hypervisor it talks to, plus the apps, etc) has been in
internal development for three years.  There hasn't been a lot of effort
internally to release this software upstream until recently.

I personally have been complaining about it for quite some time, but I have no
control over our internal release process.  Even when the hardware has been
announced and available for purchase, the BSP is sometimes only available under
NDA.  Eventually, everything is publicly released, and most of the code is
pushed upstream, but it's a long and painful struggle at times.

My concern has been dealing with the headaches of bug reports from customers,
etc as they upgrade their kernel but not their apps, and then wonder why nothing
works.

But as Arnd pointed out, it really isn't as big of deal as I make it out to be.
 I can maintain compatibility internally.  I blame my allergy medicine.

-- 
Timur Tabi
Linux kernel developer at Freescale
