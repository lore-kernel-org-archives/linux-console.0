From: Jeffrey Holle <jeff.holle@verizon.net>
Subject: using grep with both -l and -n
Date: Thu, 19 Feb 2004 16:00:07 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <c13irp$6lf$1@sea.gmane.org>
Reply-To: jeff.holle@verizon.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-console@vger.kernel.org

I've actually got two questions about grep.

First, can the -l, which just prints the matching filenames, and -n, 
which includes the matched line number using the syntax 
"filename:lineno", be combined to affect.

What I find is that adding -n makes inclusion of -l a noop.

The reason I ask is I'm using grep to generate .gdbinit files.  the 
syntax that -n emits is right on, except for the extra stuff that is 
normally suppressed by -l.

The second question is there a way to defeat the default behavior of not 
including the filename when -n is used and only one file is included in 
the search?  In this case, it prints just the lineno.


