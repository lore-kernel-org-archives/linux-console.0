From: Mike Castle <dalgoda@ix.netcom.com>
Subject: Re: encapulating a find function in a script
Date: Wed, 14 Jan 2004 17:00:47 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <20040115010046.GD15245@thune.mrc-home.com>
References: <200401150034.i0F0Y1x17029@trumpet.radonc.washington.edu>
Reply-To: Mike Castle <dalgoda@ix.netcom.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200401150034.i0F0Y1x17029@trumpet.radonc.washington.edu>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: BobGian@U.Washington.edu
Cc: jeff.holle@verizon.net, linux-console@vger.kernel.org

On Wed, Jan 14, 2004 at 04:34:01PM -0800, BobGian@U.Washington.edu wrote:
> Try putting double-quotes around the parameters, like:
> 
> 	 find $1 -name "$2" -exec grep -H "$3" '{}' ';'
> 
> This works for me in a similar script, at least in the csh shell.

You may also find that using xargs instead of -exec is much faster (fewer
fork/execs).

Something like:

find "$1" -name "$2" -print0 | xargs -0 grep -H "$3"

mrc
-- 
     Mike Castle      dalgoda@ix.netcom.com      www.netcom.com/~dalgoda/
    We are all of us living in the shadow of Manhattan.  -- Watchmen
fatal ("You are in a maze of twisty compiler features, all different"); -- gcc
