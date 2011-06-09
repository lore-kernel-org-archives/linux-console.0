From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v4] drivers/virt: introduce Freescale hypervisor
 management driver
Date: Thu, 9 Jun 2011 13:55:17 -0500
Message-ID: <4DF11715.5030001@freescale.com>
References: <1307573154-15838-1-git-send-email-timur@freescale.com> <201106090929.23671.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106090929.23671.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org, alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, dsaxena@linaro.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Arnd Bergmann wrote:
> Then get rid of all the code that takes apart the ioctl command numbers
> again and just do a switch/case based on the command.

I still need to keep that code to maintain binary compatibility with existing
applications that pass the union as a parameter.

I'll fix that after we've updated the applications.  But we have a
chicken-or-the-egg problem where we need the same application to work with the
new and old ioctl interface for a period of time.

-- 
Timur Tabi
Linux kernel developer at Freescale

