From: Jeffrey Holle <jeff.holle@verizon.net>
Subject: Re: encapulating a find function in a script
Date: Fri, 16 Jan 2004 13:09:43 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <bu9k3v$nul$1@sea.gmane.org>
References: <200401150034.i0F0Y1x17029@trumpet.radonc.washington.edu> <bu4s3j$atl$1@sea.gmane.org>
Reply-To: jeff.holle@verizon.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <bu4s3j$atl$1@sea.gmane.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-console@vger.kernel.org

Got both original script and the suggested speed enhanced script to work 
by putting a double double quote around the second parameter reference, 
like ""$2"".
This was necessary to allow this parameter to be something like "*.cpp".
Without this treatment, *.cpp was expanded to the cpp files that 
happened to be in my current directory.
I'm using Mandrake 9.1 linux and employing the bash command shell.

Do other linux/unix oses have this strange behavior?

Jeffrey Holle wrote:
> No joy.
> The problem appears to be the '*' character.
> If I substitute an actual cpp filename, the script works.  However it 
> not very useful this way.
> 
> BobGian@U.Washington.edu wrote:
> 
>>> I'm having a problem with a simple script I'm trying to develop.
>>>
>>> Its name is fgrep and its text is:
>>>
>>>        #!/bin/bash
>>>        find $1 -name $2 -exec grep -H $3 '{}' ';'
>>>
>>> I want to use it like "dgrep 'directory' 'file pattern' 'match text'.
>>>
>>> It doesn't match anything because of the $2 parameter.  If I replace
>>> "$2" with "*.cpp", it works.
>>>
>>> Can anybody tell me what is wrong and how to fix it?
>>
>>
>>
>> Try putting double-quotes around the parameters, like:
>>
>>      find $1 -name "$2" -exec grep -H "$3" '{}' ';'
>>
>> This works for me in a similar script, at least in the csh shell.
>>
>>  -Bob Giansiracusa
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-console" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-console" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


