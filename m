From: Swapnil Pimpale <swapnil.pict@gmail.com>
Subject: Help regarding the splitting of available screen size
Date: Thu, 4 Mar 2010 23:02:30 +0530
Message-ID: <b2ac5deb1003040932m7b2527f3jc8b5a015226de23c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=IayUyow+2qZXI0pPWLF89PocxbJWXP7MZeDwaiA8evs=;
        b=Ef70wvaKSnkjmqXhuWVJGVxMtscPbuVyk+iKLbK8FuP3GQ9eW/9e7tuer4LR7Ovf+7
         l9cn8HP2Wenr/+IQZkrX7CYus1VKuOIzksB1m24TQcpPkT65tn59VM98n4xSwr38MLfb
         0HyeaFZlaBjChbHqpebFWREqbi/5Z0ZqWakPY=
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org

Hi all,
   I am working on a project which requires the kernel to use only
half of screen. Other half of the screen will be used for some other
purpose. I will be running the kernel in text mode. I tried to do some
changes to file .drivers/console/vgacon.c to achieve this.
 I changed the value of vga_video_num_lines to half of its value, but
that didn't work for me.
 I am using the linux kernel version 2.6.24.7 for my project.

Could anyone please suggest me any pointers for implementing this .

Thanks,
Swapnil Pimpale
