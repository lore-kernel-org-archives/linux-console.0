From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [PATCH] drivers/tty: don't use the byte channel handle as a
 parameter in ehv_bytechan.c
Date: Fri, 23 Sep 2011 01:11:55 +0000
Message-ID: <4E7BDCDA.6060506@freescale.com>
References: <1316543217-13769-1-git-send-email-timur@freescale.com>
 <20110922230640.GA16981@kroah.com> <4E7BC1A9.5050708@freescale.com>
 <20110922232828.GA12088@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110922232828.GA12088@kroah.com>
Content-Language: en-US
Content-ID: <C5C7C787C50EC349BFDFC774FFB5C123@freescale.net>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <greg@kroah.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-console@vger.kernel.org" <linux-console@vger.kernel.org>

Greg KH wrote:
>>> >  >  This patch doesn't apply at all to my tty tree, what was it made
>>> >  >  against?
>> >
>> >  An internal repository that supposed to be in-sync with the latest and greatest.
>> >
>> >  What's the URL for your tty-next repo?
> There is no public one due to kernel.org being down.
>
> Does your patch apply to linux-next?

It does not, and I see why now.  Looks like the internal tree is not in 
sync after all.

I will post a V2 shortly.

-- 
Timur Tabi
Linux kernel developer at Freescale
