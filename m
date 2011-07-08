From: Timur Tabi <timur@freescale.com>
Subject: Re: tty/powerpc: introduce the ePAPR embedded hypervisor byte channel
 driver
Date: Fri, 8 Jul 2011 17:12:42 -0500
Message-ID: <4E1780DA.3090800@freescale.com>
References: <1305830092-20104-1-git-send-email-timur@freescale.com> <20110708220654.GA19146@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110708220654.GA19146@kroah.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <greg@kroah.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, alan@lxorguk.ukuu.org.uk, arnd@arndb.de

Greg KH wrote:
>> > 3) A tty driver, which is used to handle user-space input and output.  The
>> > byte channel used for the console is designated as the default tty.
>> > 
>> > Signed-off-by: Timur Tabi <timur@freescale.com>
> Doesn't apply at all to the tty-next tree, so I can't apply it here :(

I shall take care of that right now.

-- 
Timur Tabi
Linux kernel developer at Freescale

