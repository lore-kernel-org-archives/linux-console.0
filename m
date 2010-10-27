From: Timur Tabi <timur@freescale.com>
Subject: Is this mailing list dead?
Date: Wed, 27 Oct 2010 15:38:01 -0500
Message-ID: <4CC88DA9.7010103@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org

Is anyone reading this mailing list?  I presume that since it's called
"linux-console" and hosted on kernel.org, that this is the right place to ask
for help with writing console drivers.  However, it doesn't appear that anyone
is actually reading this list, so I want to make sure I'm not wasting my time here.

I'm trying to write a console/TTY driver that is not a UART driver, and I can't
seem to find a good example of such a driver out there.  Specfically, my driver
has an interrupt handler that calls tty_insert_flip_string() when it receives
new input.  What I don't understand is how am I supposed to know what "struct
tty_struct" to use for this function.  It appears that it's possible to open the
TTY device multiple times, each time with a different struct tty_struct.  But I
can only have one interrupt handler, so I don't know how I'm supposed to
determine which of the many struct tty_struct pointers to use.

-- 
Timur Tabi
Linux kernel developer at Freescale

