From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Fri, 26 Nov 2010 11:42:05 +0000
Message-ID: <20101126114205.4fbefa54@pyx>
References: <1290765760.6087.3.camel@cai.gentoo>
	<20101126100915.66112ee7@lxorguk.ukuu.org.uk>
	<AANLkTi=gUrUZv=3=tEhyjtWfwhADLU5heo7+DYTQboQv@mail.gmail.com>
	<20101126104121.043cd9fb@lxorguk.ukuu.org.uk>
	<AANLkTi=T7pfTP0xHmGqLCSj_8vq_kRijCp5NF+VeBz_f@mail.gmail.com>
	<20101126104818.1e8f6511@lxorguk.ukuu.org.uk>
	<AANLkTimThFn2c4V3MGmyQESxPYW8Fan3+S92zb4xBdnH@mail.gmail.com>
	<AANLkTikCgLPgnBVHWW=g=4n8zFjkiikQ6P3S4gDL9X0=@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <AANLkTikCgLPgnBVHWW=g=4n8zFjkiikQ6P3S4gDL9X0=@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: microcai <microcai@fedoraproject.org>
Cc: linux-console@vger.kernel.org

> There is lots of  program want to open framebuffer , but how can you
> make it run if the framebuffer is already taken by fbterm ?

Use a different virtual frame buffer, or write software to multiplex the
use of it, you know like say X does...
