From: Felix Miata <mrmazda@earthlink.net>
Subject: black screen on startx exit from native modes back to xga on vttys
Date: Fri, 17 Apr 2015 06:31:35 -0400
Message-ID: <5530E107.9030600@earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org

gfxchps involved:
radeon rv200
NVidia NV11

Bugs filed and mailing list threads, all unhelpful:
https://bugzilla.redhat.com/show_bug.cgi?id=1096487
https://bugs.mageia.org/show_bug.cgi?id=15662
https://ml.mageia.org/l/arc/dev/2014-09/msg00218.html
https://ml.mageia.org/l/arc/dev/2015-02/msg00384.html
http://lists.x.org/archives/xorg/2015-March/057252.html
http://lists.x.org/archives/xorg/2015-April/057314.html
http://lists.freedesktop.org/archives/systemd-devel/2015-April/030752.html

Newest appearance of the problem is on Tumbleweed, where it only started very
recently, compared to a year ago in Rawhide.

Typical modes used in Xorg are 1600x1200 and 1440x900, while in most cases
vttys are supposed to be 1024x768, and without Plymouth from cmdline
inclusion of video=1024x768@60. Could this be a KMS defect?
-- 
"The wise are known for their understanding, and pleasant
words are persuasive." Proverbs 16:21 (New Living Translation)

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
