From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Mon, 6 Jun 2011 10:48:03 -0500
Message-ID: <4DECF6B3.5020700@freescale.com>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106031724.44957.arnd@arndb.de> <4DE8FD85.7000703@freescale.com> <201106061742.01974.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106061742.01974.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Arnd Bergmann wrote:
> Sorry, I misread your first sentence above. I thought you said that you prefer
> drivers/firmware over virt/fsl. drivers/misc is definitely the wrong
> place for this, please choose a better one. Maybe drivers/virt/ ?

I'll be more than happy to go with the consensus, but I don't think it makes
sense to create a new directory just for this one, limited-use driver.  You're
the only person who's complained about drivers/misc.  I'm pretty sure that if I
put it in drivers/virt, I'll get more complaints.

I still don't understand what's wrong with drivers/misc, especially since my
driver registers as a "misc" driver.

-- 
Timur Tabi
Linux kernel developer at Freescale

