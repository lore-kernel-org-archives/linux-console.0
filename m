From: Harald Dunkel <harri@afaics.de>
Subject: wishlist: vnc framebuffer device?
Date: Sat, 16 Jun 2012 13:05:24 +0200
Message-ID: <4FDC6874.4070106@afaics.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi folks,

To make a headless system "less headless", would it be possible
to integrate a vnc framebuffer device into the kernel?

The idea is to have a vnc server instead of a local screen and
keyboard to show the boot output and to provide a console login
on /dev/tty{1..6}. It would be pretty similar to qemu. No need
for fancy graphics, of course. The IP address might either be
obtained using DHCP, or it might use an IP address/netmask
given on the kernel command line.

I understand that authentication might be an issue here.

Hopefully this isn't one of the oh-no-not-again questions. I
haven't seen it mentioned on the kernel or linux-console
mailing lists before.


Regards

Harri
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk/caG4ACgkQUTlbRTxpHjf8EwCZAZ0H17WYyEwJB3QgCNjazY2O
3NMAn2e0dJa3sbiZr33nY11m1g0zm0j3
=MANA
-----END PGP SIGNATURE-----
