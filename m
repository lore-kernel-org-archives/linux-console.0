From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded hypervisor
 byte channel driver
Date: Thu, 19 May 2011 10:54:03 -0500
Message-ID: <4DD53D1B.4060600@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com>	<1305813272-31826-7-git-send-email-timur@freescale.com>	<20110519153358.5876f310@lxorguk.ukuu.org.uk>	<4DD533DE.1020705@freescale.com> <20110519165039.7fd8ec34@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110519165039.7fd8ec34@lxorguk.ukuu.org.uk>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Alan Cox wrote:
>>> > > The kfifo API is probably faster and cleaner. Much of tty still uses
>>> > > CIRC_* because they predate the new APIs.
>> > 
>> > Ok, I'll change it.
> I flag that one up as a general comment - don't feel you need to change
> it if CIRC_* works in your case.

CIRC_* does work for me, so I'll keep it as-is.

>>> > > I guess the only other thing to consider is whether you want to implement
>>> > > a SYSRQ interface on your console ?
>> > 
>> > I don't think byte channels can support SYSRQ, but I'll look into it.

> What some drivers do in this case is nominate some obscure ctrl sequence
> to mean 'sysrq' unless doubled (eg ctrl-^ etc)

Ok, I can do that.

> Depends if the functionality is useful in your environment or not

It is, but I'd like to add it later so that I can make the 2.6.40 window (if it
isn't already too late).


-- 
Timur Tabi
Linux kernel developer at Freescale

