From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Fri, 26 Nov 2010 23:25:03 +0000
Message-ID: <20101126232503.30cfe78b@pyx>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1290772421.6087.11.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: microcai@fedoraproject.org
Cc: linux-console@vger.kernel.org

> > Use a different virtual frame buffer, or write software to multiplex
> > the
> > use of it, you know like say X does... 
> 
> Well, then different virtual frame buffer will not have fbterm running ,
> how do you see UNICODE output?

It'll have video on it so you won't anyway, and if you want it windowed
then use a windowing system or write one.
