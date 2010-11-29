From: microcai <microcai@fedoraproject.org>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Mon, 29 Nov 2010 09:42:30 +0800
Message-ID: <AANLkTim-S7XcZgKHvGJMG-71B8-73aZ1AX5EFXefcW=w@mail.gmail.com>
References: <1290765760.6087.3.camel@cai.gentoo> <20101126100915.66112ee7@lxorguk.ukuu.org.uk>
 <AANLkTi=gUrUZv=3=tEhyjtWfwhADLU5heo7+DYTQboQv@mail.gmail.com>
 <20101126104121.043cd9fb@lxorguk.ukuu.org.uk> <AANLkTi=T7pfTP0xHmGqLCSj_8vq_kRijCp5NF+VeBz_f@mail.gmail.com>
 <20101126104818.1e8f6511@lxorguk.ukuu.org.uk> <AANLkTimThFn2c4V3MGmyQESxPYW8Fan3+S92zb4xBdnH@mail.gmail.com>
 <AANLkTikCgLPgnBVHWW=g=4n8zFjkiikQ6P3S4gDL9X0=@mail.gmail.com>
 <20101126114205.4fbefa54@pyx> <1290772421.6087.11.camel@cai.gentoo>
 <20101126232503.30cfe78b@pyx> <1290837149.677.4.camel@cai.gentoo> <20101127135330.5e32a45a@pyx>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type;
        bh=1V+N0akmkCB413MGspEm5IPwz2O6T/vZokxSF1e+7bg=;
        b=FGXd36lbpQRLPyBCha/PeseYHvg1jhD/ZbL65vVCU5j0cQK1hqp/F6yQaAK5jxXKq3
         Y+ji6THFSsKXErVtIrE9ZVxQiiPbCxCT2aaGk8uTveb9PPW8J6ZFgoVgkxDlFSMoQcUT
         OJCDqzZeK54UZ1GI+pDFa6Z6k44cjVkmMhZ1Y=
In-Reply-To: <20101127135330.5e32a45a@pyx>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-console@vger.kernel.org

>
>> Well, if you have that time, please find out those softwares that need
>> to rewrite, and, send patches to them. I'm sure they will just reply :
>> why not handle UNICODE in kernel ?!
>
> Which has been answered, if you want to run multiple graphical apps on a
> framebuffer use a windowing system like everyone else does, and I would
> imagine "use X" is what most of the software people would tell you.
>

think of w3m. which runs on framebuffer, so ,fbterm is useless here.
But w3m uses framebuffer to draw pictures, not characters.
So, if you want nice output, enable UNICODE font in kernel will be the
best way rather than hacking into the w3m code.
if you hack one w3m ,there will be another one that need this kinds of hack ....
implement it in kernel was/is/will be the best choice.
