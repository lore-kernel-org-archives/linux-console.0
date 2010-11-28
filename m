From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 00:20:07 +0800
Message-ID: <1290961207.13526.31.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <20101129020610.7ea7c79e.lisa@ltmnet.com>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=aW+va0lviAXZsDMBoqX+ZNH9guVR17oeaIhuqpoWwIk=;
        b=ADCXaswvR+pmfZYP80EDm4YHnFQDjc2JofUBhwbY+CIDsz2r4Tm6sZ1oV7EIjyGUaN
         +7R61ceETInlaMrD5zGSY9D7XVF+LUV5mgq0NGtZ4MvBK7HMARpSUUNDmqqrC7JsPPMf
         FuUKWodOQ1nA0VVH6vOWdgkqP35GZY7bxLAf0=
In-Reply-To: <20101129020610.7ea7c79e.lisa@ltmnet.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lisa Milne <lisa@ltmnet.com>
Cc: "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org


> 
> Another possible model: split the current system in 2, so there's a
> bytestream handler, and a vt-legacy module. Then use the interface
> between bytestream/legacy as an interface for future vt-kernel and
> vt-user modules.

this may cause early printk stop working. 

> 
> This may make it possible to create an initial patch to do the split,
> then work on the new system independently of the current vt system.
> Hopefully reducing any problems with api/subsystem inconsistencies
> breaking existing code elsewhere, by giving it time to adapt.
> 
> This is guesswork on my part as I haven't actually looked at the code,
> so while it sounds good in theory, you'd have to check if it's actually
> doable.
> 

Sounds like a good idea. Who is in charge of VT system ? Seems no
one ....

