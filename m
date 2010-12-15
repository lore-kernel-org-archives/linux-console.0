From: Pavel Machek <pavel@ucw.cz>
Subject: Re: VT console need rewrite
Date: Wed, 15 Dec 2010 15:40:55 +0100
Message-ID: <20101215144055.GA10467@ucw.cz>
References: <1290941875.13526.15.camel@cai.gentoo>
 <87mxosla7p.fsf@basil.nowhere.org>
 <20101213071328.GB2328@ucw.cz>
 <20101213101801.1f698c7c@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101213101801.1f698c7c@lxorguk.ukuu.org.uk>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Andi Kleen <andi@firstfloor.org>, microcai@fedoraproject.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Hi!

> > Yes. These days kernel sources and kernel messages both contain
> > non-ASCII characters... as well as many filesystems.
> 
> But not in kernel printed messages.

Yes, even in those (but something eats my mail).

CAFE driver has non-ascii characters in pci device name, and that
leaks to dmesg.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
