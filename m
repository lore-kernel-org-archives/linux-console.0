From: "BRAGA, Bruno" <bruno.braga@gmail.com>
Subject: Re: Updates on "mv", "cp" commands
Date: Sun, 1 Nov 2009 20:47:21 +0900
Message-ID: <86ca47940911010347v235b0642q140e50489c7c8259@mail.gmail.com>
References: <86ca47940910310550s87a6140s377a3d752979037@mail.gmail.com> 
	<86ca47940910311730ta75d2f3p56c3e65699c94696@mail.gmail.com> 
	<87y6mq64wn.fsf@erwin.mina86.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=ZtPq8Ns2FZwnzBMub73BZ34mWD4BELaMnI3ANp8d8DE=;
        b=W93TOzVZPeY0XaLrY4G8LZZBZ3BRMQaBIje7DtWXekbNFsmKs/gsuvlf0wpA4WXNak
         AbR0ZUNdRAPWVrgNL9qxDY5IlfQ92iJC70QTqyl4Me4qD2OjLKjn0HpUvApg/IxOL5cs
         DUZecUUI95MqRL57qCP4eQyFnArk1KQ5OSMvM=
In-Reply-To: <87y6mq64wn.fsf@erwin.mina86.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Nazarewicz <mina86@tlen.pl>
Cc: linux-console@vger.kernel.org

Thanks for the reply Michal.

I will look into that (I found the source in GNU's source code, but I
am still kinda lost on to whom should I ask stuff, lol). i will let
you know if/when I get things done with the team there.

Cheers,

******************************
Braga, Bruno
http://www.brunobraga.net
bruno.braga@gmail.com
*******************************

"The future belongs to people who see possibilities before they become
obvious!." -- Ted Levitt



2009/11/1 Michal Nazarewicz <mina86@tlen.pl>:
> "BRAGA, Bruno" <bruno.braga@gmail.com> writes:
>> I don't know if that's the place to post this question, but I am sur=
e
>> someone here will be able to give me hints on how to proceed.
>>
>> I would like to propose and patch improvements on the "mv" (move) an=
d
>> "cp" (copy) commands, by adding options for progress information.
>
> That's something I was wondering about some time ago myself.
>
>> The idea is that any GUI actions already do it graphically, and othe=
r
>> CLI applications, such as "rsync", have this as an extended option
>> "--progress". This is handy for large files processing, for instance=
=2E
>>
>> I looked for the code in the kernel source but I did not find any. I
>> could find some sources on the GNU OS, but I am not sure if that's t=
he
>> right place (probably not).
>
> You won't find any sources of cp or mv in Linux source code because c=
p
> and mv commands are user space and as such they are not part of Linux
> per se.
>
> If you are using some kind of GNU/Linux distribution the place to loo=
k
> is GNU coreutils package. =A0Consult gnu.org webpage for it's source =
code
> and information how to submit patches.
>
> --
> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
> =A0.o. | Liege of Serenly Enlightened Majesty of =A0 =A0 =A0o' \,=3D.=
/ `o
> =A0..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0 (o o)
> =A0ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--
>
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
