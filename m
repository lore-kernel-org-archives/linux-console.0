From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 6/7] tty/powerpc: introduce the ePAPR embedded hypervisor
 byte channel driver
Date: Thu, 19 May 2011 09:02:39 -0700
Message-ID: <20110519160239.GB25606@kroah.com>
References: <1305813272-31826-1-git-send-email-timur@freescale.com>
 <1305813272-31826-7-git-send-email-timur@freescale.com>
 <20110519153358.5876f310@lxorguk.ukuu.org.uk>
 <4DD533DE.1020705@freescale.com>
 <20110519165039.7fd8ec34@lxorguk.ukuu.org.uk>
 <4DD53D1B.4060600@freescale.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=smtpout; bh=KtlHeIauygYQwknRcs/Vw0FHGvI=; b=TCLZFRRqu3rYXN/EJqAn2zmGHJ8Zwzqr858dUii9fu1IjQI88Cz8Zi+xn17PoG5l0pcgNhJCHO4yS4eU5R2kryFzCVlRMRkCHT+Zvhs/2OO9pECr6XiAHbJu45jaS74hYJe0+CCK47xy51Hjfq4srN/xUBbtHtdKE9JgdfjQ4Rw=
Content-Disposition: inline
In-Reply-To: <4DD53D1B.4060600@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Thu, May 19, 2011 at 10:54:03AM -0500, Timur Tabi wrote:
> > Depends if the functionality is useful in your environment or not
> 
> It is, but I'd like to add it later so that I can make the 2.6.40 window (if it
> isn't already too late).

It's too late, it needed to be in linux-next _before_ the window opened.

sorry,

greg k-h
