From: Florian Klien <florian@klien.cx>
Subject: Re: How to merge stdout and stderr
Date: Sun, 30 Sep 2007 11:27:29 +0200
Message-ID: <6D57C579-6E0E-4E73-8C5F-66399E14A068@klien.cx>
References: <fdmo9p$a4k$1@sea.gmane.org>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <fdmo9p$a4k$1@sea.gmane.org>
Sender: linux-console-owner@vger.kernel.org
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jeffreyholle@bellsouth.net, linux-console@vger.kernel.org

On 30.09.2007, at 01:48, Jeffrey Holle wrote:
> I'm using bash on Ubuntu Linux.
>
> I've forgotten the syntax on how to do this:
>   rcsdiff somefile 1&2> result
>
> Can somebody tell me how to do this?

depends on what you want to do.

redirect sterr to stdin:
try 2>&1

redirect stin to sterr:
try 1>&2

hth
florian
-- 
Florian Klien
student of Telematics
"Facts are meaningless. You could use facts to prove anything
  that's even remotely true!", Homer Simpson



