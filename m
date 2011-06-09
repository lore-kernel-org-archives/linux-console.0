From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 7/7] [v5] drivers/virt: introduce Freescale hypervisor
 management driver
Date: Thu, 9 Jun 2011 13:31:17 -0700
Message-ID: <20110609203117.GB14235@kroah.com>
References: <1307646794-26374-1-git-send-email-timur@freescale.com>
 <201106092213.13755.arnd@arndb.de>
 <4DF12A94.6070605@freescale.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=smtpout; bh=d+z7VJIKbi/eNRN9q+tP73z4n68=; b=jERuf1ofkFgnQNKeD/rQQ/pXCM97YnqPDxjXk9XVkvXPUZDVRVim0ZKlctIiMcYQumPPtKppvy8fu7K1inwOC16zhHXBpwuCBMMyQk+cc/rPrYRmrcK5Z2ezMG0YdsI3dqH+0fDxhN6qkH1J1zr22ivFPLNRF8QyBFFvw9Zm7t0=
Content-Disposition: inline
In-Reply-To: <4DF12A94.6070605@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, alan@lxorguk.ukuu.org.uk, kumar.gala@freescale.com, benh@kernel.crashing.org, akpm@kernel.org, cmetcalf@tilera.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org, virtualization@lists.linux-foundation.org

On Thu, Jun 09, 2011 at 03:18:28PM -0500, Timur Tabi wrote:
> > More importantly, the code you have chose (0) conflicts with existing drivers
> > (frame buffer, scsi and wavefront among others). Please chose a free one and
> > add it to Documentation/ioctl/ioctl-number.txt in the same patch.
> 
> Ok, I was really hoping to avoid doing this.  Like I said, binary compatibility
> is important, and changing the type will break my existing apps.  Are you
> insisting that I pick a new number?

Why is binary compatibility important?  Isn't this a brand new driver
for a brand new system?  What userspace tools are out there in the wild
for such a thing?

confused,

greg k-h
