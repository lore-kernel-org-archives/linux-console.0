From: Jeffrey Holle <jeff.holle@verizon.net>
Subject: Re: encapulating a find function in a script
Date: Wed, 14 Jan 2004 17:55:41 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <bu4s3j$atl$1@sea.gmane.org>
References: <200401150034.i0F0Y1x17029@trumpet.radonc.washington.edu>
Reply-To: jeff.holle@verizon.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <200401150034.i0F0Y1x17029@trumpet.radonc.washington.edu>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-console@vger.kernel.org

No joy.
The problem appears to be the '*' character.
If I substitute an actual cpp filename, the script works.  However it 
not very useful this way.

BobGian@U.Washington.edu wrote:
>>I'm having a problem with a simple script I'm trying to develop.
>>
>>Its name is fgrep and its text is:
>>
>>        #!/bin/bash
>>        find $1 -name $2 -exec grep -H $3 '{}' ';'
>>
>>I want to use it like "dgrep 'directory' 'file pattern' 'match text'.
>>
>>It doesn't match anything because of the $2 parameter.  If I replace
>>"$2" with "*.cpp", it works.
>>
>>Can anybody tell me what is wrong and how to fix it?
> 
> 
> Try putting double-quotes around the parameters, like:
> 
> 	 find $1 -name "$2" -exec grep -H "$3" '{}' ';'
> 
> This works for me in a similar script, at least in the csh shell.
> 
>  -Bob Giansiracusa
> -
> To unsubscribe from this list: send the line "unsubscribe linux-console" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


