From: Eric Lammerts <eric@lammerts.org>
Subject: Re: Q: Howto access the keyboard in a linux system without a graphics
 card ?
Date: Mon, 26 Aug 2002 22:34:08 +0200 (CEST)
Sender: linux-console-owner@vger.kernel.org
Message-ID: <49196.7170419686$1030394565@news.gmane.org>
References: <200208260943.LAA25845@correo.e-technik.uni-ulm.de>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <200208260943.LAA25845@correo.e-technik.uni-ulm.de>
List-Id: <linux-console.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kai-Boris Schad <kschad@ebs.e-technik.uni-ulm.de>
Cc: linux-console@vger.kernel.org, linux-kernel@vger.kernel.org


On Mon, 26 Aug 2002, Kai-Boris Schad wrote:
> I'm trying to set up a small embedded system for gps receiving with a linux
> system.  I want to have the system working without a graphics card - wich
> works well. The Problem I have at the moment is to access the keyboard
> without a graphics card, because the console driver does not start then (
> Also a redirect doesn't work then :-( )
> Is there a way to access the keyboard in this case by a user program ?
> The system recognises the keyboard ( I think Kernel and init) and reacts if
> ctrl-alt-del is pressed.

What would probably work, is to add funkey support to your kernel
(http://rick.vanrein.org/linux/funkey/), define all keys of your
keyboard to be funkeys, and read them from /dev/funkey.

Eric

