From: Mike Castle <dalgoda@ix.netcom.com>
Subject: Re: feeding a script from standard input
Date: Wed, 28 Jan 2004 23:30:16 -0800
Sender: linux-console-owner@vger.kernel.org
Message-ID: <20040129073016.GA370@thune.mrc-home.com>
References: <bv4v6h$rlc$1@sea.gmane.org> <20040128140536.GW8401@lug-owl.de> <bv96ha$88v$1@sea.gmane.org>
Reply-To: Mike Castle <dalgoda@ix.netcom.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bv96ha$88v$1@sea.gmane.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Holle <jeff.holle@verizon.net>
Cc: linux-console@vger.kernel.org

On Wed, Jan 28, 2004 at 12:34:17PM -0800, Jeffrey Holle wrote:
> Thanks for this, works without the quotes!


Better to use "$@".

Otherwise if you do something like  *.foo and any of those names has spaces
in it, it would fail.  Only "$@" will get that case right.

Even the people who designed that feature call it magic.

mrc
-- 
     Mike Castle      dalgoda@ix.netcom.com      www.netcom.com/~dalgoda/
    We are all of us living in the shadow of Manhattan.  -- Watchmen
fatal ("You are in a maze of twisty compiler features, all different"); -- gcc
