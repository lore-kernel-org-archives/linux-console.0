From: Mike Castle <dalgoda@ix.netcom.com>
Subject: Re: encapulating a find function in a script
Date: Fri, 16 Jan 2004 12:09:37 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <20040116200937.GL15245@thune.mrc-home.com>
References: <200401161953.i0GJrnb28511@trumpet.radonc.washington.edu>
Reply-To: Mike Castle <dalgoda@ix.netcom.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200401161953.i0GJrnb28511@trumpet.radonc.washington.edu>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: BobGian@U.Washington.edu
Cc: dalgoda@ix.netcom.com, linux-console@vger.kernel.org, jeff.holle@verizon.net

On Fri, Jan 16, 2004 at 11:53:49AM -0800, BobGian@U.Washington.edu wrote:
> > You may also find that using xargs instead of -exec is much faster
> > (fewer fork/execs).
> >
> > Something like:
> >
> > find "$1" -name "$2" -print0 | xargs -0 grep -H "$3"
> >
> > mrc
> > --
> 
> Thanks!  Tried it - works great.  Runs two or three times as fast
> and with half as many page faults.

Just remember that the -print0 and -0 are GNU extensions.  If you work on
other OS's, you may need to look at going back to -exec, or see if they
offer any similar extensions.

mrc
-- 
     Mike Castle      dalgoda@ix.netcom.com      www.netcom.com/~dalgoda/
    We are all of us living in the shadow of Manhattan.  -- Watchmen
fatal ("You are in a maze of twisty compiler features, all different"); -- gcc
