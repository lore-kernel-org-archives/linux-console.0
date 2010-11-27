From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Sat, 27 Nov 2010 13:53:30 +0000
Message-ID: <20101127135330.5e32a45a@pyx>
References: <1290765760.6087.3.camel@cai.gentoo>
	<20101126100915.66112ee7@lxorguk.ukuu.org.uk>
	<AANLkTi=gUrUZv=3=tEhyjtWfwhADLU5heo7+DYTQboQv@mail.gmail.com>
	<20101126104121.043cd9fb@lxorguk.ukuu.org.uk>
	<AANLkTi=T7pfTP0xHmGqLCSj_8vq_kRijCp5NF+VeBz_f@mail.gmail.com>
	<20101126104818.1e8f6511@lxorguk.ukuu.org.uk>
	<AANLkTimThFn2c4V3MGmyQESxPYW8Fan3+S92zb4xBdnH@mail.gmail.com>
	<AANLkTikCgLPgnBVHWW=g=4n8zFjkiikQ6P3S4gDL9X0=@mail.gmail.com>
	<20101126114205.4fbefa54@pyx>
	<1290772421.6087.11.camel@cai.gentoo>
	<20101126232503.30cfe78b@pyx>
	<1290837149.677.4.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1290837149.677.4.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: microcai@fedoraproject.org
Cc: linux-console@vger.kernel.org

> Think about w3m, It must run on framebuffer to display pictures. 
> But, I must run on fbterm to display CJK characters .....

So you want a windowing layer - thats a user space problem. You need that
anyway to keep the pictures and the text in the right places relative to
one another and to handle events.

> Well, if you have that time, please find out those softwares that need
> to rewrite, and, send patches to them. I'm sure they will just reply :
> why not handle UNICODE in kernel ?!

Which has been answered, if you want to run multiple graphical apps on a
framebuffer use a windowing system like everyone else does, and I would
imagine "use X" is what most of the software people would tell you.
