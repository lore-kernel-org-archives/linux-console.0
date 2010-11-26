From: microcai <microcai@fedoraproject.org>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Fri, 26 Nov 2010 18:53:01 +0800
Message-ID: <AANLkTimThFn2c4V3MGmyQESxPYW8Fan3+S92zb4xBdnH@mail.gmail.com>
References: <1290765760.6087.3.camel@cai.gentoo> <20101126100915.66112ee7@lxorguk.ukuu.org.uk>
 <AANLkTi=gUrUZv=3=tEhyjtWfwhADLU5heo7+DYTQboQv@mail.gmail.com>
 <20101126104121.043cd9fb@lxorguk.ukuu.org.uk> <AANLkTi=T7pfTP0xHmGqLCSj_8vq_kRijCp5NF+VeBz_f@mail.gmail.com>
 <20101126104818.1e8f6511@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:content-type;
        bh=TW1XirCrd2nodeEPFji0f3LH9m/IlrEBlQRwWKTxYu8=;
        b=MafBhRmLIu9slNEd/vXGKCjKg/y6qPOCrKMcUlW407Vtfd7yxGaTW4f2Qg2nU5mlG4
         MWqhqt4EUsJLMe/pSc55mENUHm5iHnGQD8/F1Z8BUV+SkpLIaZh1eSRCH72WAYkww1lB
         lsFTjfWarbQcIpv6k/HJ1AIZbtvxhpzaafceQ=
In-Reply-To: <20101126104818.1e8f6511@lxorguk.ukuu.org.uk>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-console@vger.kernel.org

>
> No - KMS handles a lot that you can't do nicely in user space. But you
> don't have to use X to use KMS.
>
> Alan
>

Same as this patch. can you do mplayer on the fbcon and get nice
Chinese or Japanese (or any other languages ) output from console ??!
Not if you are using fbterm.

also, how about have nice output ( Native Language in init ) when starting up ?
You can't do it with fbterm.
