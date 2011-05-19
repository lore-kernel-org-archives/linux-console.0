From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded hypervisor
 byte channel driver
Date: Thu, 19 May 2011 11:05:49 -0500
Message-ID: <4DD53FDD.7070503@freescale.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com>	<1305813272-31826-7-git-send-email-timur@freescale.com> <20110519153358.5876f310@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110519153358.5876f310@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Alan Cox wrote:
>> > +		/* Pass the received data to the tty layer.  Note that this
>> > +		 * function calls tty_buffer_request_room(), so I'm not sure if
>> > +		 * we should have also called tty_buffer_request_room().
>> > +		 */
>> > +		ret = tty_insert_flip_string(ttys, buffer, len);

> You only need to request_room in advance if you can't handle the case
> where the insert_flip_string returns less than you stuffed down it.

If tty_insert_flip_string() returns less than I stuffed down it, the characters
it didn't accept will be dropped.  That's because once I receive them, I have
nowhere else to put them.  I suppose I could implement a receive FIFO, but that
seems overkill.  If calling tty_buffer_request_room() ensures that
tty_insert_flip_string() always accepts all the characters, I would rather do that.

-- 
Timur Tabi
Linux kernel developer at Freescale
