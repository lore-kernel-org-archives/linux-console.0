From: Mike Castle <dalgoda@ix.netcom.com>
Subject: Re: using grep with both -l and -n
Date: Thu, 19 Feb 2004 19:04:50 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <20040220030450.GI345@thune.mrc-home.com>
References: <c13irp$6lf$1@sea.gmane.org>
Reply-To: Mike Castle <dalgoda@ix.netcom.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c13irp$6lf$1@sea.gmane.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Holle <jeff.holle@verizon.net>
Cc: linux-console@vger.kernel.org

On Thu, Feb 19, 2004 at 04:00:07PM -0800, Jeffrey Holle wrote:
> The reason I ask is I'm using grep to generate .gdbinit files.  the 
> syntax that -n emits is right on, except for the extra stuff that is 
> normally suppressed by -l.

Would this work for you:
awk '{print $1}'

> The second question is there a way to defeat the default behavior of not 
> including the filename when -n is used and only one file is included in 
> the search?  In this case, it prints just the lineno.

Add /dev/null to the list of files.

mrc
-- 
     Mike Castle      dalgoda@ix.netcom.com      www.netcom.com/~dalgoda/
    We are all of us living in the shadow of Manhattan.  -- Watchmen
fatal ("You are in a maze of twisty compiler features, all different"); -- gcc
