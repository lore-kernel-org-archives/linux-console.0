From: microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 16:20:11 +0800
Message-ID: <AANLkTinmdRjEkmywaMevN5_A=2N8_pBsOAJj8PoAaznz@mail.gmail.com>
References: <1290941875.13526.15.camel@cai.gentoo> <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
 <1290951770.13526.18.camel@cai.gentoo> <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
 <1290954545.13526.27.camel@cai.gentoo> <20101128191152.GV10602@const.famille.thibault.fr>
 <1290993006.877.0.camel@cai.gentoo> <20101129081639.GA5142@const.bordeaux.inria.fr>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:content-type;
        bh=1bNK29lAW5p1EnMp1ODul3IlofqMV1zrUz5UA3rbsGk=;
        b=N5f77p6UjVACSkexLdE66H8ayZV9eC9+IaYUk/oWqKo2NPAZgA5+2FPZDbYY7aMRQf
         hJVFfde+B8KXufl+tqtMOXwRQOymd3FvoTnLdeP8aVEt9gFW4fieADaIv3hFCogftKzR
         NtFSxvpo+TCH2aeuB0SCz93MzDgURL7+2n4nw=
In-Reply-To: <20101129081639.GA5142@const.bordeaux.inria.fr>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Microcai <microcai@fedoraproject.org>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kerne

> But isn't that basically what you are describing?
>
> (i.e. what's the use of using a pts and /dev/fb, if not for a userlevel
> terminal to actually do the work?)
>

ok, try run zhcon on pts.  can you do that ?
