From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 0/3] use unicode for vt mouse paste
Date: Tue, 17 Jul 2018 23:10:27 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1807172304250.11681@knanqh.ubzr>
References: <20180718020604.3u25omf5fxqvsy3q@angband.pl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=0njeVzpI+WBn7bnpgyaDKXzdgTRSqbdTxvAoehO9lj4=;
        b=BsK67wG0jrFg8wadTm2lBp+ETQRyTpd+gBuEMqnYkcFXTbyxWvk06lwqAmYTcmA8PW
         Zw6nmmoPY0IMUM8W61b78hHai00nVyiZsifrlA+C7Y0IKcSary2NIrmBM4gHPT9fr1pL
         5SOa/3YffRrNqzkf0VlkHHWK9wFyAcZZh9hnE=
In-Reply-To: <20180718020604.3u25omf5fxqvsy3q@angband.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Borowski <kilobyte@angband.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Wed, 18 Jul 2018, Adam Borowski wrote:

> Hi!
> Based on Nicolas' nice work (in tty-next), let's avoid corrupting characters
> that have been copy+pasted via mouse selection.  The uniscr array holds
> their original identity even if they got mangled by glyph conversion.
> The glyph conversion lossily turns similar-looking characters into a
> representation, and everyone else into a replacement character.
> 
> There's no proper handling for CJK (yet?) but anything of wcwidth()==1 will
> work fine.
> 
> The whole thing doesn't get enabled until something reads from /dev/vcsu for
> that console, but let's test this code first before enabling it widely.

Glad to see this. For the whole set you may add:

Acked-by: Nicolas Pitre <nico@linaro.org>


> Diffstat:
>  drivers/tty/vt/selection.c | 48 +++++++++++++++++++++++++++++-------------------
>  drivers/tty/vt/vt.c        | 10 ++++++++++
>  include/linux/selection.h  |  1 +
>  3 files changed, 40 insertions(+), 19 deletions(-)
> 
> 
> -- 
> // If you believe in so-called "intellectual property", please immediately
> // cease using counterfeit alphabets.  Instead, contact the nearest temple
> // of Amon, whose priests will provide you with scribal services for all
> // your writing needs, for Reasonable And Non-Discriminatory prices.
> 
