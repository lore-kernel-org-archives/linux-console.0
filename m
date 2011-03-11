From: Jeremy Jackson <jerj@coplanar.net>
Subject: signal to PID 1 from serial console like KeyboardRequest or CAD
Date: Fri, 11 Mar 2011 08:43:52 -0500
Message-ID: <4D7A2718.5090607@coplanar.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-console@vger.kernel.org

Hi,

I ran into a problem recently on a Linux server with a remote serial 
console.  /sbin/init (actually Upstart) was in a state where nothing 
(useful) was running.  I had to power cycle the machine to get back to 
the boot prompt.  This has the side-effect of triggering raid rebuilds.

It would be nice to have what Ctrl-Alt-Del does at the VGA console with 
PS/2 or USB keyboard. This sends a SIGINT to PID 1, and most distros 
have this set to do "shutdown -r now" which attempts a clean reboot.

Once upon a time there was KeyboardRequest, which would send a SIGWINCH 
to PID 1 (when pressing Alt-UP_arrow?).  I don't see any sign of this 
feature in Linux 2.6.32 though.

Looking at the Sysrq handlers in the kernel I don't see any keystrokes 
that send SIGINT to PID 1 either.

So, I'm wondering if it makes sense to add a Sysrq key to send a signal 
to PID1 ?

-- 
Coplanar Networks
http://www.coplanar.net
(519)489-4903
