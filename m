From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: inotify on /dev/vcsa?
Date: Tue, 21 Jul 2009 00:51:08 +0100
Message-ID: <20090721005108.574d5145@lxorguk.ukuu.org.uk>
References: <20090720234618.GR5397@const.famille.thibault.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20090720234618.GR5397@const.famille.thibault.fr>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

> An ioctl could be devised to wait for updates, but I was wondering
> if there could be a way to just use inotify for that.  However,
> drivers/char/vc_screen.c would have to collect the list of opened files
> in order to notify all of them (processes may even have opened another
> node with same devno as /dev/vcsa), which is not really pretty, and
> actually maybe some other device drivers would want to achieve the same
> kind of thing, so I was wondering whether that could fit into another
> place like the generic device infrastructure?

I would have thought poll() would have been cleaner. Or perhaps extending
the VT event interface I added to the vt drivers in the current patches
pending for 2.6.32 - poll support would probably be a bit lighter as
you'd just need to do something like

	event_count++;
	wake_up(&vcsa_event_wait);

and check for a count change
