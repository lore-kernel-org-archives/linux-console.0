From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 14:07:21 +0000
Message-ID: <20101129140721.40bbc1e8@lxorguk.ukuu.org.uk>
References: <1290941875.13526.15.camel@cai.gentoo>
	<73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	<1290951770.13526.18.camel@cai.gentoo>
	<AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	<20101129020610.7ea7c79e.lisa@ltmnet.com>
	<1290961207.13526.31.camel@cai.gentoo>
	<20101128234634.461daec4@pyx>
	<1290994083.877.13.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1290994083.877.13.camel@cai.gentoo>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: microcai@fedoraproject.org
Cc: Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

> Don't you see the cosole code ? There is TODO that say , "hey , I need
> UNICODE support..."

And what has happened over time is that we've learned

- that real unicode is hard
- that some languages need very complex character handling, and this
  happens to be most of the major non western european languages in the
  world today

and someone put all the needed logic into pango, and people wrote fbterm
and friends. The world has moved on

> Simply drawing characters won't need any hw acceleration. It doesn't
> matter if it is slow. KMS and Wayland will make more people work under
> console, trust me.

No I don't trust you, sorry. You need compositing acceleration to do some
of the character composing efficiently and to do anti-aliasing which for
small symbols in many non western fonts is rather essential.

> > Your other problem is mode setting, VESA is on its way out, a lot of
> No, VESA will still be here for another decades. Some fb driver conflict

VESA is X86 specific, PC class hardware specific and subject to various
assumptions, when it works.

No VESA on Intel MID platforms, no VESA on PPC, no VESA on Android phones

> printk console , if redirect to a ttyS? , then the outer Linux world
> terminal will do UNICODE handling. 

In a window in a debug/development environment under X11 with Pango..
