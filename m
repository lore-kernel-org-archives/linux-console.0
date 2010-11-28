From: Microcai <microcai@fedoraproject.org>
Subject: VT console need rewrite
Date: Sun, 28 Nov 2010 18:57:55 +0800
Message-ID: <1290941875.13526.15.camel@cai.gentoo>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:content-type:organization:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=dyEKvYvbx3ogbgTMmTDn08QGkr1bCJl2B10rFVrUFL8=;
        b=EdyvxNdqTnwm/LUSnkMwFEZk6SbiHOgJg4laMsLNwnjc8bAppnrL0kZ0nB6E+7rBsS
         mWq9BiBBSxlUJes5UagxV0+zSHl+MaGlv4t0+ra6y/2weUGkZOilqmFA6dgEJlHFTpyk
         dJPTcm7p1QLYp2QqKMWbLc9HG7JpPXqaYvIZw=
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Hi, there

	I'm implementing the UNICODE font of the framebuffer console, (see
http://lkml.org/lkml/2010/11/26/50 in case you do not got my email). But
current vt code is too bugy, too many direct assumes about vt buffer,
This makes me so hard to hack.  There is TODO telling me to add UNICODE
support, but no room for such code, that's why my patch is so tricky.

	And the code itself, if you'll excuse me, it isn't as beautiful as rest
of the kernel.
	So, it really really need a clean rewrite.I'm ganna take is hard job.	
	And, please tell me if is worth to do so.


