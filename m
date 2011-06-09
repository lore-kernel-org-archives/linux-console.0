From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v4] drivers/virt: introduce Freescale hypervisor
 management driver
Date: Thu, 9 Jun 2011 11:48:51 -0500
Message-ID: <4DF0F973.6050008@freescale.com>
References: <1307573154-15838-1-git-send-email-timur@freescale.com> <20110608161009.7b05d305.randy.dunlap@oracle.com> <201106090938.23027.arnd@arndb.de> <4DF0F5A1.5080008@oracle.com> <4DF0F672.8040206@freescale.com> <4DF0F7F5.5050107@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <4DF0F7F5.5050107@oracle.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Linux Virtualization <virtualization@lists.linux-foundation.org>, konrad.wilk@oracle.com, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, cmetcalf@tilera.com, akpm@kernel.org, dsaxena@linaro.org, linux-console@vger.kernel.org, greg@kroah.com, alan@lxorguk.ukuu.org.uk

Randy Dunlap wrote:
>> > I'm okay with that idea, except there's a consensus that drivers should be in
>> > drivers/.
>> > 
> Like sound/ ?

My understanding is that this is something that's considered broken and should
be fixed, but I don't know what the holdup is.

> but what makes it a "driver"?

That's a good point.

Ok, so maybe I don't have any really good answers here. :-)

-- 
Timur Tabi
Linux kernel developer at Freescale

