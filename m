From: BobGian@U.Washington.edu
Subject: encapulating a find function in a script
Date: Wed, 14 Jan 2004 16:34:01 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <200401150034.i0F0Y1x17029@trumpet.radonc.washington.edu>
Reply-To: BobGian@U.Washington.edu
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeff.holle@verizon.net
Cc: linux-console@vger.kernel.org

> I'm having a problem with a simple script I'm trying to develop.
>
> Its name is fgrep and its text is:
>
>         #!/bin/bash
>         find $1 -name $2 -exec grep -H $3 '{}' ';'
>
> I want to use it like "dgrep 'directory' 'file pattern' 'match text'.
>
> It doesn't match anything because of the $2 parameter.  If I replace
> "$2" with "*.cpp", it works.
>
> Can anybody tell me what is wrong and how to fix it?

Try putting double-quotes around the parameters, like:

	 find $1 -name "$2" -exec grep -H "$3" '{}' ';'

This works for me in a similar script, at least in the csh shell.

 -Bob Giansiracusa
