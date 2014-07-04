From: Kewal Agola <kewalagola@gmail.com>
Subject: Trouble with Virtual Terminal
Date: Fri, 4 Jul 2014 13:14:41 +0530
Message-ID: <CAOsdogr5WZh3XNndEgBhPQxmD6waSbWGk2d-T-C-9dVbYB5JZg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=42SVfxlyhZqmmVH0aNIC1tnkdoGKKHvZEDtgUwf7TRI=;
        b=bGLdTpSpmkmTT1P1mervNu2UhIN8jEcqqocEQ6M8guVbFPkZtSBPARa0S+msK0DVdc
         TNiwMUK4b824ulIjWld2tMt6eva29mt9+hA3PhcvSMIfpEiLLaL0fnf2X/Buk/2zEHES
         xQ/yMRSAKi67BOljLSFhyJKZX7O+rHm422MaTReunUN5Mo6yjOn1T5tCYgZcCWb1NMB5
         7pCylNyXg4Dmlmdm1zrlSj/E1h2yCGkqWmoReRw/qZBps3UyWELIZ4UP1dhODC83pkZl
         NLBohdePW8UsseYTqSjCFdDyV93qlB/S6lxJneDgHW0Bc8H74lOUEPjcG1I0BzTYDYYW
         H0Eg==
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org

Hi,

I am using a customized ARM based platform with an LCD monitor. I am
having trouble with virtual terminal. Terminal emulator with X-serve
works fine. But as soon as I switch to virtual terminal (ctrl + alt +
F1), the characters get scrambled. If I type character 'a', at first
character 'a' looks as if it were written with a broken line,
gradually after few seconds proper shape comes up. If I enter command
"dmesg" the output looks garbled due to overlapping of two consecutive
lines.

Processor Family : ARMv7.
Linux Kernel version : 3.0.31
Operating system : ARM Ubuntu.

I know there is some issue with display driver. But I do not know what
changes could help me. Can someone suggest me the way out?

Thanks,
Kewal
