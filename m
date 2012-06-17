From: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: wishlist: vnc framebuffer device?
Date: Sun, 17 Jun 2012 12:13:06 +0200
Message-ID: <CAFLxGvxpXBgOH=rhNUdE2FN=mm90sX4-Atwc4k-VrSxoAVZh9A@mail.gmail.com>
References: <4FDC6874.4070106@afaics.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=9E/aLZxhPBIJD3QFzhuzv6vUoeCfG3G+3r44TvKb2qw=;
        b=qWsOV51BxaAbjVUYtIjy/DtZPE3PbUAsKpr/g9nPNu7hqBDa3Ok1OicHMo57f7PxHY
         BAPdiMaJ/GejMdz5P24XprsnsylhGP2Wj7ZegvRFYGGeTlynItQzoZ0ZVUZJlNtc6fZZ
         o1M9OpPYdPRsQX+6JwLI86+nTPydRIhfVV2f7Nw2qTSH5Z/vowucKA8zQAq3Fk8i8Z/n
         fl0Vr2VEj5MMMxqNeB+0wC8f8uCOYj7D1Su9y4qUcPp5jKpYE5ExTPQfxbb7Q/RrElwu
         dNt6tiUSLpSXHXIDKxNSLNKoFKJiEjMx4aswuUrprHvl6CkS7jXeCzuxnXQ+lWRpU7TE
         8zbQ==
In-Reply-To: <4FDC6874.4070106@afaics.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Dunkel <harri@afaics.de>
Cc: Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

On Sat, Jun 16, 2012 at 1:05 PM, Harald Dunkel <harri@afaics.de> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi folks,
>
> To make a headless system "less headless", would it be possible
> to integrate a vnc framebuffer device into the kernel?

What about a VNC server which exports a framebuffer device?
Like: http://code.google.com/p/android-vnc

No need to implement VNC in kernel space.

-- 
Thanks,
//richard
