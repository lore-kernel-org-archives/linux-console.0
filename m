From: Theodore Tso <tytso@MIT.EDU>
Subject: Re: VT console need rewrite
Date: Sun, 28 Nov 2010 08:24:15 -0500
Message-ID: <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
References: <1290941875.13526.15.camel@cai.gentoo>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1290941875.13526.15.camel@cai.gentoo>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: microcai@fedoraproject.org
Cc: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org


On Nov 28, 2010, at 5:57 AM, Microcai wrote:

> Hi, there
> 
> 	I'm implementing the UNICODE font of the framebuffer console, (see
> http://lkml.org/lkml/2010/11/26/50 in case you do not got my email). But
> current vt code is too bugy, too many direct assumes about vt buffer,
> This makes me so hard to hack.  There is TODO telling me to add UNICODE
> support, but no room for such code, that's why my patch is so tricky.
> 
> 	And the code itself, if you'll excuse me, it isn't as beautiful as rest
> of the kernel.
> 	So, it really really need a clean rewrite.I'm ganna take is hard job.	
> 	And, please tell me if is worth to do so.

Yes, the console is code is very old.   But please be aware that lots of code (both in the kernel and in userspace) has dependencies upon how the code behaves.   So changing it in a way that does not break backwards compatibility is hard.  i.e., it is hard to hack for a reason.

I would recommend an incremental rewrite (i.e., one patch at a time), as opposed to a rewrite from scratch.   Because people will want to be assured that things haven't broken in a horrible way as a result of a complete rewrite...

-- Ted
