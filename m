From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [console] CSI (128+27) vs BIG5 (and possibly others)
Date: Mon, 20 Apr 2009 11:29:37 +0100
Message-ID: <20090420112937.78ec67d5@lxorguk.ukuu.org.uk>
References: <20090418210638.GU21409@const>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20090418210638.GU21409@const>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Sat, 18 Apr 2009 23:06:38 +0200
Samuel Thibault <samuel.thibault@ens-lyon.org> wrote:

> Hello,
> 
> A chinese user reported that some characters don't show up fine on
> its console.  This happens to be because character 128+27 is handled
> specially by the linux Console.  I believe the same issues can happen
> with other characters sets.  Since linux' terminfo makes applications
> use \E[ anyway, would it be ok to add an option to disable the 128+27
> handling?

I'm reluctant to do so because its extra complication we don't need (at
least nobody has needed for over fifteen years), it's bound to confuse
some other application, and given almost everyone has already gone UTF-8
it's really debating a corner case only relevant to the past anyway.

Alan
