From: Veyrdite <veyrdite@gmail.com>
Subject: Re: wishlist: vnc framebuffer device?
Date: Sun, 17 Jun 2012 18:57:18 +1000
Message-ID: <4FDD9BEE.9010800@gmail.com>
References: <4FDC6874.4070106@afaics.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:cc:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=o/+BgfjmGEcc2WsP3wnYZK6lfoi0ojxazVlL/kS54z0=;
        b=c3XnZy1C2AyyDgV+3yZuWR/W9YmQJjxdtA21E9a7A1jGsoRlFTrKQioTQ7NfW19WLF
         zDMxrKBfwl0dpjD9KBQMUdvsAQFtxn4BSvp+d/GEl1ZZBZ7j/FIzPtucMekhde8mCtK4
         daAsW70DzAYuD2aPB4tbfwfk6phdFyIzeAw80rEmxY98B59P/SjGNOvwaq0TrdrKw+cL
         hO3iJ/o1TsdERK1bFREuUS/bfFI2zcTzI5YsIU1oXVUMI2qAVMabmsNIN4WVxJ07CqVf
         85XHzJWf6Z5ErOSfFD+4Mzxb5vd+cV7wqwHHymFStSn2QLiQGP6CsC150+3kWwE940pf
         srSw==
In-Reply-To: <4FDC6874.4070106@afaics.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

Hey Harald,

 > To make a headless system "less headless", would it be possible
 > to integrate a vnc framebuffer device into the kernel?

VNC as I understand is more suitable for graphical environments.  For
just text SSH or even telnet/netcat would be more practical.

 > The idea is to have a vnc server instead of a local screen and
 > keyboard to show the boot output and to provide a console login
 > on /dev/tty{1..6}. It would be pretty similar to qemu. No need
 > for fancy graphics, of course. The IP address might either be
 > obtained using DHCP, or it might use an IP address/netmask
 > given on the kernel command line.

As I understand it most init implementations log all of their messages
to a file in /var/log, so you can view them all post-bootup once you
have vnc'd or into the box.  This would be the simplest and most
foolproof solution, but may not be what you want.

If you are going to send your messaged over a trusted LAN or network
( ie not the internet ) then I'd go with the 'netconsole' module for the
kernel.

See https://www.kernel.org/doc/Documentation/networking/netconsole.txt

It (hopefully) would just require an extra kernel command line on the
headless machine and a 'netcat -ul portnumber' on the receiving machine.
  'Hopefully' because I am unsure if your kern

The problem is that everything is sent as unencrypted plaintext.

 > I understand that authentication might be an issue here.

Yes, if you mean the security of the transmitted data.

It is unlikely your ISP and other routing companies will violate your
security, but there is always a risk of someone doing something they
shouldn't be.  It is also *very* unhackerlike to send any plaintext over
the internet, and you should be secretly ashamed deep down if you do so.

If you do need to secure this information, it might be possible to link
SSH to your innitab and have things sent that way.  That is idealistic.

In the worst case scenario, you will just have to write a script that
acts as an init service that delays all bootup until it can make an SSH
connection to another computer and shove the lines of bootup information
from /var/log to the other computer as they appear.

If my words have gone over your head, please tell me.  I have no clue
what you skill level and experience is, and I am making assumptions :)

Regards, William
