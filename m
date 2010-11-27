From: Microcai <microcai@fedoraproject.org>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Sat, 27 Nov 2010 13:52:29 +0800
Message-ID: <1290837149.677.4.camel@cai.gentoo>
References: <1290765760.6087.3.camel@cai.gentoo>
	 <20101126100915.66112ee7@lxorguk.ukuu.org.uk>
	 <AANLkTi=gUrUZv=3=tEhyjtWfwhADLU5heo7+DYTQboQv@mail.gmail.com>
	 <20101126104121.043cd9fb@lxorguk.ukuu.org.uk>
	 <AANLkTi=T7pfTP0xHmGqLCSj_8vq_kRijCp5NF+VeBz_f@mail.gmail.com>
	 <20101126104818.1e8f6511@lxorguk.ukuu.org.uk>
	 <AANLkTimThFn2c4V3MGmyQESxPYW8Fan3+S92zb4xBdnH@mail.gmail.com>
	 <AANLkTikCgLPgnBVHWW=g=4n8zFjkiikQ6P3S4gDL9X0=@mail.gmail.com>
	 <20101126114205.4fbefa54@pyx> <1290772421.6087.11.camel@cai.gentoo>
	 <20101126232503.30cfe78b@pyx>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=0HhAxMtS7kVjLeOJE/XTFFC7U0JRAEHetZVUlT3duXE=;
        b=mAQxj52GTrEPfL/nxJlgMaiTFkH7dCU8sCsRJNr0eErMbEEcPW1UAXid65c1XdYV3k
         QPFStgu2dTN3JWRuHng5THGT5vlNUQTRaax0V21R6zluAWvnX51z8Ukd4m+/goIXIQW3
         T83qAFiaqp6OGf26eBeyoA6fJ0+3uNfcM42SY=
In-Reply-To: <20101126232503.30cfe78b@pyx>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-console@vger.kernel.org


> 
> It'll have video on it so you won't anyway, and if you want it windowed
> then use a windowing system or write one.

Think about w3m, It must run on framebuffer to display pictures. 
But, I must run on fbterm to display CJK characters .....

to re-write w3m ? And possibly hundreds of other software to just make
sure to reject my patch ?

Well, if you have that time, please find out those softwares that need
to rewrite, and, send patches to them. I'm sure they will just reply :
why not handle UNICODE in kernel ?!


