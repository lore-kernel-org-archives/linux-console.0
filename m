From: Jeffrey Holle <jeff.holle@verizon.net>
Subject: encapulating a find function in a script
Date: Wed, 14 Jan 2004 16:19:02 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <bu4met$1la$1@sea.gmane.org>
Reply-To: jeff.holle@verizon.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-console@vger.kernel.org

I'm having a problem with a simple script I'm trying to develop.

Its name is fgrep and its text is:

	#!/bin/bash
	find $1 -name $2 -exec grep -H $3 '{}' ';'

I want to use it like "dgrep 'directory' 'file pattern' 'match text'.

It doesn't match anything because of the $2 parameter.  If I replace 
"$2" with "*.cpp", it works.

Can anybody tell me what is wrong and how to fix it?


