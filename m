From: Chris Metcalf <cmetcalf@tilera.com>
Subject: Re: [PATCH 7/7] [v4] drivers/virt: introduce Freescale hypervisor
 management driver
Date: Fri, 10 Jun 2011 10:17:20 -0400
Message-ID: <4DF22770.4010103@tilera.com>
References: <1307573154-15838-1-git-send-email-timur@freescale.com> <20110608161009.7b05d305.randy.dunlap@oracle.com> <201106090938.23027.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106090938.23027.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org, Linux Virtualization <virtualization@lists.linux-foundation.org>, Randy Dunlap <randy.dunlap@oracle.com>, Timur Tabi <timur@freescale.com>, konrad.wilk@oracle.com, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, dsaxena@linaro.org, linux-console@vger.kernel.org, greg@kroah.com, alan@lxorguk.ukuu.org.uk

On 6/9/2011 3:38 AM, Arnd Bergmann wrote:
> On Thursday 09 June 2011 01:10:09 Randy Dunlap wrote:
>> On Wed, 8 Jun 2011 17:45:54 -0500 Timur Tabi wrote:
>>
>>> Add the drivers/virt directory, which houses drivers that support
>>> virtualization environments, and add the Freescale hypervisor management
>>> driver.
>> It can't go in linux/virt or linux/virt/fsl instead?  why drivers/ ?
>>
>> or maybe linux/virt should be drivers/virt ?
> See discussion for v2 of this patch. I suggested that drivers/firmware and virt/
> as options, the counterarguments were that drivers/firmware is for passive
> firmware as opposed to firmware that acts as a hypervisor, and that virt/ is
> for the host side of hypervisors like kvm, not for guests.
>
> The driver in here most closely resembles the xen dom0 model, where a
> priviledged guest controls other guests, but unlike xen there is a single
> driver file, so there is no need to have drivers/fsl-hv directory just
> for this one file. We do have a number of other hypervisors that fit in the
> same category, so they can be added here later.

This still leaves open the question of what really should go in this new
directory. Is it just for drivers that manage/control the hypervisor?  Or
is it also for drivers that just use the hypervisor to do I/O of some kind,
but aren't related to any other "family" of drivers, i.e., a driver that
would have been dumped in drivers/char or drivers/misc in the old days?

My specific interest at the moment is the proposed tile-srom.c driver
(https://patchwork.kernel.org/patch/843892/), which uses a simple
hypervisor read/write API to access the portion of the SPI ROM used to hold
the boot stream for a TILE processor.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com


