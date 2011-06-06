From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor
 management driver
Date: Mon, 6 Jun 2011 11:09:41 -0500
Message-ID: <4DECFBC5.6070205@freescale.com>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106061742.01974.arnd@arndb.de> <4DECF6B3.5020700@freescale.com> <201106061803.58531.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106061803.58531.arnd@arndb.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Deepak Saxena <dsaxena@linaro.org>, kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Arnd Bergmann wrote:
> When we talked about the situation of drivers/misc and drivers/char at
> one of the recent conferences, a broad consensus was that they are in
> need of a maintainer, which I foolishly signed up for. Deepak wanted
> to send an update to the MAINTAINERS file for this (I guess I can do
> that too, since he must have forgotten about it), but the main idea is
> that I'm there to say no to any driver that someone tries to add there,
> unless there are really good reasons why it is actually a good place
> to live for that driver.

Can you give me an example of a driver that *does* belong in drivers/misc?
Frankly, I just don't see what's wrong with a repository of various drivers that
don't really belong anywhere else.

And what about my concern that my driver will be the only one in drivers/virt?

-- 
Timur Tabi
Linux kernel developer at Freescale

