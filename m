From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: inotify on /dev/vcsa?
Date: Tue, 21 Jul 2009 01:46:18 +0200
Message-ID: <20090720234618.GR5397@const.famille.thibault.fr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754463AbZGTXqY@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Hello,

Powersaving is everywhere, including accessibility.  User-level daemons
use /dev/vcsa to know what text is displayed on the screen.  Problem
is: there is no way to _wait_ for an update to happen, so these daemons
actually poll every e.g. 40ms so as to be reactive enough for smooth
user experience.  That means waking up 25 times per second, which is not
so greenish while the computer could be completely idle else.

An ioctl could be devised to wait for updates, but I was wondering
if there could be a way to just use inotify for that.  However,
drivers/char/vc_screen.c would have to collect the list of opened files
in order to notify all of them (processes may even have opened another
node with same devno as /dev/vcsa), which is not really pretty, and
actually maybe some other device drivers would want to achieve the same
kind of thing, so I was wondering whether that could fit into another
place like the generic device infrastructure?

Samuel
