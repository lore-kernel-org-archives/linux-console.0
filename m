From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 1/3] vt: preserve unicode values corresponding to
 screen characters
Date: Wed, 11 Jul 2018 13:40:18 -0700
Message-ID: <CAGXu5jKfHOmDHAO726KTNP4CY_Q=g7HN3zy2hqUA5ZBZMu=Vhg@mail.gmail.com>
References: <20180627035642.8561-1-nicolas.pitre@linaro.org>
 <20180627035642.8561-2-nicolas.pitre@linaro.org> <CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com>
 <79334C7E-6E76-4B5C-9A32-C6DA40D8E88E@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ZWoXq84yc8740yqKuwyM4w8PxMWYeQjSfFe+f8Ci3XY=;
        b=CwmUnUF64zcSw7oWQpP1hgA+fHBcLsFEg4YGXcIMKVRIhPpg8ThelIxaRn3lgfeiC5
         +xsle5RiBU+pTYphECU/pBBDLL/CDahMjgUEAnzR1dkSNZZbT5B9bkcDbS77uMgPMUAI
         K1G0YPE/+imhrYm2Fgt8dcyTjNJLIDln85VJ1AwLcEE3v1nUCTWoqTWVOTCyJJ4ci2Ap
         eVeBDoSvBTBv2/5na/x1jiGtLlW0LEjnZoDNyPJolbHFP7gSnMvcJ0BnMwJBYopwYm9v
         rXq001xGCLrTHkavn3VsMSl7K+GJbBh+eQCBKAFAHEibmiC9a2ysg6cFQtkHD8cqroGD
         j9ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ZWoXq84yc8740yqKuwyM4w8PxMWYeQjSfFe+f8Ci3XY=;
        b=i6GJDPoDCNI/MFon+KRh20wpgxJNApXanbnfL+u3nCJLg+1vYSRnUd6kEgbq8xMvvt
         I5G1K9xR9IUbEG5iH8BUC8bSAFz8Bjyg/tb7F/E4ffXWKxFosSg2Fn5g21uC+r8EnCLM
         1Ogf9aky3LbFU5Pr8txOBL1+EQ7AOlsbEsvbc=
In-Reply-To: <79334C7E-6E76-4B5C-9A32-C6DA40D8E88E@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Adam Borowski <kilobyte@angband.pl>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, LKML <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

On Tue, Jul 10, 2018 at 8:39 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> I am on vacation away from an actual keyboard until next week. Will look at it then.

Awesome; thanks!

-Kees

-- 
Kees Cook
Pixel Security
