From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v3 0/3] have the vt console preserve unicode characters
Date: Tue, 17 Jul 2018 21:00:08 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1807172055140.11681@knanqh.ubzr>
References: <20180627035642.8561-1-nicolas.pitre@linaro.org> <20180628123803.GA22045@kroah.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=rKWWvqr4cxMXVLm0gybOjFfTfp/ZwNWw7784lzBuK9U=;
        b=Enqyesqn21m+hDxu6t6Uj+IKAZYSPY1O7vCrol63SQFnvHx/Eu4319U5ABt2xqu2ML
         rg0nL1lrGfUjQWAYF01h51sbg8p3Cmifbpuk5xOEK/GuOS1W3HmT2Fcz9tnd7rXGdKqZ
         GiGGlKIlL7HbhFCJvKKsykLIRGmAgr1FDPtzI=
In-Reply-To: <20180628123803.GA22045@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Adam Borowski <kilobyte@angband.pl>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Thu, 28 Jun 2018, Greg Kroah-Hartman wrote:

> On Tue, Jun 26, 2018 at 11:56:39PM -0400, Nicolas Pitre wrote:
> > The vt code translates UTF-8 strings into glyph index values and stores 
> > those glyph values in the screen buffer. Because there can only be at 
> > most 512 glyphs at the moment, it is impossible to represent most 
> > unicode characters, in which case a default glyph (often '?') is 
> > displayed instead. The original unicode value is then lost.
> > 
> > The 512-glyph limitation is inherent to text-mode VGA displays after 
> > which the core console code was modelled. This also means that the 
> > /dev/vcs* devices only provide user space with glyph index values, and 
> > then user applications must get hold of the unicode-to-glyph table the 
> > kernel is using in order to back-translate those into actual characters. 
> > It is not possible to get back the original unicode value when multiple 
> > unicode characters map to the same glyph, especially for the vast 
> > majority that maps to the default replacement glyph.
> > 
> > Users of /dev/vcs* shouldn't have to be restricted to a narrow unicode 
> > space from lossy screen content because of that. This is especially true 
> > for accessibility applications such as BRLTTY that rely on /dev/vcs to 
> > render screen content onto braille terminals.
> > 
> > It was also argued that the VGA-centric glyph buffer should eventually 
> > go entirely. The current design made sense when hardware was slow and 
> > managing the screen directly into the VGA memory made a difference (i.e. 
> > 25 years ago). Modern console display drivers no longer have to be 
> >    limited to 512 glyphs.
> > Quoting Alan Cox:
> > 
> > |The only driver that it suits is the VGA text mode driver, which at 
> > |2GHz+ is going to be fast enough whatever format you convert from. We 
> > |have the memory, the processor power and the fact almost all our 
> > |displays are bitmapped (or more complex still) all in favour of 
> > |throwing away that limit.
> > 
> > This patch series introduces unicode screen support to the core console 
> > code with /dev/vcs* as a first user. Memory is allocated, and possible 
> > CPU overhead introduced, only if /dev/vcsu is read at least once. For 
> > now both the glyph and unicode buffers are maintained in parallel to 
> > allow for a smooth transition.
> > 
> > I'm a prime user of this new /dev/vcsu interface, as well as the BRLTTY 
> > maintainer Dave Mielke who implemented support for this in BRLTTY. There 
> > is therefore a vested interest in maintaining this feature as necessary. 
> > And this received extensive testing as well at this point.
> > 
> > This is also available on top of v4.18-rc2 here:
> > 
> >   git://git.linaro.org/people/nicolas.pitre/linux vt-unicode
> > 
> > Changes from v2:
> > 
> > - Dropped patch #4 as it was useful only for initial debugging and it 
> >   attracted all the review comments so far -- actually more than the 
> >   patch is worth.
> 
> If you want this "feature" back, I'll be glad to take it, as odds are it
> will help when any future person wants to test any changes in the code.
> 
> So feel free to resend it, I have no objection to it as-is.
> 
> And I've queued the other 3 up now, nice job.

Thanks!

I'm about to send 3 more patches to put on top of what you already have: 
patch #1 is that debugging code (still disabled by default), patch #2 
removes the VLA, and patch #3 updates devices.txt.


Nicolas
