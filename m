From: BobGian@U.Washington.edu
Subject: Re: encapulating a find function in a script
Date: Fri, 16 Jan 2004 11:53:49 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <200401161953.i0GJrnb28511@trumpet.radonc.washington.edu>
Reply-To: BobGian@U.Washington.edu
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dalgoda@ix.netcom.com
Cc: linux-console@vger.kernel.org, jeff.holle@verizon.net

> You may also find that using xargs instead of -exec is much faster
> (fewer fork/execs).
>
> Something like:
>
> find "$1" -name "$2" -print0 | xargs -0 grep -H "$3"
>
> mrc
> --

Thanks!  Tried it - works great.  Runs two or three times as fast
and with half as many page faults.

 -Bob
