From: Jeffrey Holle <jeff.holle@verizon.net>
Subject: In a bash script, how to provide std input?
Date: Fri, 23 Jul 2004 02:55:52 -0400
Sender: linux-console-owner@vger.kernel.org
Message-ID: <cds1da$j0k$1@sea.gmane.org>
Reply-To: jeff.holle@verizon.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-console@vger.kernel.org

I'm attempting to write a script that will update from a CVS data source.

It looks like:
    cvs -d .... login anoncvs
'anoncvs' is the required password.

When I run it, cvs asks for the password instead of getting it from this 
script.

How do I fix this?

