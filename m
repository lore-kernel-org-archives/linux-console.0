From: Jeffrey Holle <jeff.holle@verizon.net>
Subject: feeding a script from standard input
Date: Mon, 26 Jan 2004 22:04:16 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <bv4v6h$rlc$1@sea.gmane.org>
Reply-To: jeff.holle@verizon.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-console@vger.kernel.org

I have a script, call it genpyste that looks like this:

	#!/bin/sh
	pyste --out=. --multiple --module=mymodule Parameter.pyste

The problem with it is that this is just a start of it.
When I'm done, there will need to be about 30 parameters like 
Parameter.pyste.

I'm wondering if I can do something like this from the command line:

	ls *.pyste | ./genpyste

What, if anything, can be done to the genpyste script to work like this?


