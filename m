From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Fri, 26 Nov 2010 10:09:15 +0000
Message-ID: <20101126100915.66112ee7@lxorguk.ukuu.org.uk>
References: <1290765760.6087.3.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1290765760.6087.3.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: microcai@fedoraproject.org
Cc: linux-console@vger.kernel.org, linux-kernel@vger.kernel.org, brad@neruo.com

>  I know there are most people speaking only English, and never meet
> non-ASCII characters on console. But, hey , what about others ?

Like the people who have never met Indic languages or half-space using
languages, or Arabic or right to left/left to right mixed or ...

>  So, here is the solution: Making framebuffer console handle UNICODE font in
> kernel.

It isn't really a solution - the rendering rules for Unicode are extremely
complex, this is why things like Pango exist to do it in user space.

Alan
