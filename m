From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 0/3] follow-up to the unicode vt console series
Date: Wed, 18 Jul 2018 07:04:56 -0700
Message-ID: <CAGXu5jLkgA2gLPM3cMwvTgGcBR3MBRHtJjO-EsTgpz5uqgHsaw@mail.gmail.com>
References: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=U79FpdumweQiMrF6riph6zIi5Efas9Ebp7IPIgE3Wew=;
        b=XJgKN2C4rTY9xF5BjY/iLYYUmaUZ5oCUf4ssKEuxisbtxPs1Husn5q1MSJ1oGUGept
         tTrDV7ZaB6HBfNEIIq6Fhudv80u0Wwb9jYtxRooPu2V+afbEczYcBh+1VnfsxMsj/fJY
         eAai2SLCovL7v7mXo1zAbRvd1g533OwDYpFKkAZmOoCC4F5YAVPSitnBLQZJWDKFrQiR
         TeIfKrP6b10j1DGpt78CFMsYt8ZKTPJJesaKp2aqvjUPAdEtwEj9T/TIXj+H2UrhmxAZ
         83Psd8tv/Shw5+EjvYiXwXMwcpL8bMKWiwrT4SSt7td5ezwg64N9j6ZJ2kIZKwnDfu5r
         dhsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=U79FpdumweQiMrF6riph6zIi5Efas9Ebp7IPIgE3Wew=;
        b=FpJ85PMnHphtC8L44697N1/+GVEFhK6s4Srb+ICsQm6aD+awHly7gFvK28lslw6CPP
         4usT7HxmDXcRTx+KSBFLEtJiF6mevaL6D1BmhZavPN9LSd7pRSOyqLqGyb3phQPTEs2c
         bgVdUP+Xi1Ihwii2JVK4ORzXhhq9EVAHJpZp8=
In-Reply-To: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Adam Borowski <kilobyte@angband.pl>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, LKML <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

Hi Nicolas,

On Tue, Jul 17, 2018 at 6:02 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> This is a follow-up series with 3 patches in response to the following
> messages respectively:
>
> http://lkml.kernel.org/r/20180628123803.GA22045@kroah.com
>
> http://lkml.kernel.org/r/CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com
>
> http://lkml.kernel.org/r/CAMuHMdUmC+uiKTEMotB83A86E1wEYrNF2qPf3kDACaW27D_NbA@mail.gmail.com
>
> Those patches were tested on top of previous patches already in tty-next.
> Please include in tty-next before next merge window.
>
> Patch #1 was posted before. Only difference is that it now uses rate
> limited printing.
>
> Patch #2 is new, however it has been tested with the validation code
> provided by patch #1. This also fixes a security issue.
>
> Patch #3 is new and trivial.
>
> Diffstat:
>
>  Documentation/admin-guide/devices.txt | 16 +++++---
>  drivers/tty/vt/vt.c                   | 57 +++++++++++++++++++++++++----
>  2 files changed, 59 insertions(+), 14 deletions(-)

Thanks for fixing the VLA! :)

-Kees

-- 
Kees Cook
Pixel Security
