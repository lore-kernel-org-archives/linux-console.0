From: "Dhananjai M. Rao" <dmadhava@djrao.com>
Subject: Concurrent multiple virtual Consoles using 2 video cards + 2 monitors
Date: Mon, 22 Dec 2003 10:16:31 -0500 (EST)
Sender: linux-console-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0312221016040.1329-100000@dragon.CyberneticEvolution.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org

Hello,

I am trying to figure out how to configure 2 concurrently active virtual
consoles (just text-based ones and not using X with xinearama extensions
etc.) on the Linux kernel.

I am trying to do this on a Athlon/XP machine running Linux kernel 2.4.20
(distributed with Red Hat 9.0 stock) and I have 1 AGP video card (nVidia
GeForce) and 1 PCI video card (S3ViRGE) and 2 monitors connected to the
two video cards.  When the machine boots up (into runlevel 3), only one
monitor (the PCI video card) is active and the other monitor is not used.
[However, when I start-up X (with suitable configuration), both monitors
work fine]

I would like to have 2 concurrent virtual consoles running on the two
monitors simultaneously.  How do I setup virtual consoles to achieve this?
I am guessing if I can get two virtual consoles working simultaneously?

Any tips, suggestions, or pointers to other resources are welcome.

thanks in advance for your time and patience for responding to this
request.

with regards and seasons greetings
-DJ


