From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] drivers/tty: don't use the byte channel handle as a
 parameter in ehv_bytechan.c
Date: Thu, 22 Sep 2011 16:28:28 -0700
Message-ID: <20110922232828.GA12088@kroah.com>
References: <1316543217-13769-1-git-send-email-timur@freescale.com>
 <20110922230640.GA16981@kroah.com>
 <4E7BC1A9.5050708@freescale.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=smtpout;
	 bh=qEIPNLy6vJ24dKQ6/b3qQBkUTVc=; b=tog/CPrQgaVhjVwRPn2D4pKqxTOD
	7JmbSrRjuIH7Lz0TPpxvYCROLBd8H8hZzyCf/a+VRXQyv+wsaZ5bzoR6bAiy2n/w
	kr+H6bpIW5LkaHC6fWAdbsQH6E4XOthT7NBzdShFOfZzca+58VlEwY3dME7UGteY
	bgCqs4hVPjuEF6s=
Content-Disposition: inline
In-Reply-To: <4E7BC1A9.5050708@freescale.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-console@vger.kernel.org

On Thu, Sep 22, 2011 at 06:15:53PM -0500, Timur Tabi wrote:
> Greg KH wrote:
> > This patch doesn't apply at all to my tty tree, what was it made
> > against?
> 
> An internal repository that supposed to be in-sync with the latest and greatest.
> 
> What's the URL for your tty-next repo?

There is no public one due to kernel.org being down.

Does your patch apply to linux-next?
