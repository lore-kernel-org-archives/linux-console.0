From: Pavel Machek <pavel@ucw.cz>
Subject: Re: VT console need rewrite
Date: Mon, 13 Dec 2010 08:13:29 +0100
Message-ID: <20101213071328.GB2328@ucw.cz>
References: <1290941875.13526.15.camel@cai.gentoo>
 <87mxosla7p.fsf@basil.nowhere.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87mxosla7p.fsf@basil.nowhere.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: microcai@fedoraproject.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Hi!

> > 	And the code itself, if you'll excuse me, it isn't as beautiful as rest
> > of the kernel.
> > 	So, it really really need a clean rewrite.I'm ganna take is hard job.	
> > 	And, please tell me if is worth to do so.
> 
> To be honest I have doubts its worth it. This was discussed years and
> years ago and the conclusion back then that people who need unicode
> fonts should use them in X or another graphical console environment
> (there are plenty to chose from these days). Has this changed?

Yes. These days kernel sources and kernel messages both contain
non-ASCII characters... as well as many filesystems.
								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
