From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/3] vt: avoid a VLA in the unicode screen scroll
 function
Date: Sat, 21 Jul 2018 09:20:43 +0200
Message-ID: <20180721072043.GA26449@kroah.com>
References: <20180718010242.5254-1-nicolas.pitre@linaro.org>
 <20180718010242.5254-2-nicolas.pitre@linaro.org>
 <20180718014813.ygcbgqxk4yo3ydbl@angband.pl>
 <nycvar.YSQ.7.76.1807172155070.11681@knanqh.ubzr>
 <nycvar.YSQ.7.76.1807182353560.2327@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1807182353560.2327@knanqh.ubzr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Adam Borowski <kilobyte@angband.pl>, Kees Cook <keescook@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Thu, Jul 19, 2018 at 12:05:25AM -0400, Nicolas Pitre wrote:
> 
> The nr argument is typically small: most often nr == 1. However this
> could be abused with a very large explicit scroll in a resized screen.
> Make the code scroll lines by performing an array rotation operation to
> avoid the need for a large temporary space.
> 
> Requested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Adam Borowski <kilobyte@angband.pl>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

I've now applied this v2 of the patch, thanks for this.

greg k-h
