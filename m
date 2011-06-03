From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Fri, 3 Jun 2011 10:28:05 -0500
Message-ID: <4DE8FD85.7000703@freescale.com>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106012340.14237.arnd@arndb.de> <4DE8008E.9030008@freescale.com> <201106031724.44957.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106031724.44957.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Arnd Bergmann wrote:
>> > I don't think it's correct to think of a hypervisor as firmware, so I don't
>> > think drivers/firmware is better.
>> > 
>> > I'm not sure that creating virt/fsl and putting the driver in there is a good
>> > idea, because it will be the only driver in that directory.  Unlike KVM, this
>> > driver is just a collection of front-ends to our hypervisor API.  The actual
>> > hypervisor is completely separate.  That's why I put it in drivers/misc, because
>> > it's just a single driver with a miscellaneous collection of interfaces.

> Ok, fair enough. If nobody has a strong preference any other way, just make it
> drivers/firmware then.

Did you mean to say drivers/misc?

-- 
Timur Tabi
Linux kernel developer at Freescale

