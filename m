From: microcai <microcai@fedoraproject.org>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Fri, 26 Nov 2010 18:19:55 +0800
Message-ID: <AANLkTi=gUrUZv=3=tEhyjtWfwhADLU5heo7+DYTQboQv@mail.gmail.com>
References: <1290765760.6087.3.camel@cai.gentoo> <20101126100915.66112ee7@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=DUpklsgb3kkRakWKoCatVVonHXPyI7eRX3vOtLqBFNQ=;
        b=BMLuuuN0ks2ZRJ3hc1jxjzem1w/qrNaAK3TpmqgWmmhJEHvv+AvsLZ3kJEqLoj4jGF
         B2PPQYR5VeUdScJ5M2m/IXa6On4S2r4zEdAb/wbdHsBejqTKtnTl8+tDz3O6KC6qQCdG
         cBk78rwCULPX8NKVqVa7rGQbpiliwaepQeHyY=
In-Reply-To: <20101126100915.66112ee7@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-console@vger.kernel.org, linux-kernel@vger.kernel.org

2010/11/26 Alan Cox <alan@lxorguk.ukuu.org.uk>:
>> =C2=A0I know there are most people speaking only English, and never =
meet
>> non-ASCII characters on console. But, hey , what about others ?
>
> Like the people who have never met Indic languages or half-space usin=
g
> languages, or Arabic or right to left/left to right mixed or ...
>
>> =C2=A0So, here is the solution: Making framebuffer console handle UN=
ICODE font in
>> kernel.
>
> It isn't really a solution - the rendering rules for Unicode are extr=
emely
> complex, this is why things like Pango exist to do it in user space.
>
> Alan
>

Hey,  just support very basic rendering. that should fix most situation=
s.
If ascii fits 90% situations, then this UNICODE support should fit 99%
situations. It don't make console display urgly glyph. Users who want
more complex  can simply choose gnome-terminal or konsole or blablalba
=2E...
This maks it possible to quickly view an UTF-8 text without boring X.
