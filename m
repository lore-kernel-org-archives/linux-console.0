From: Kai-Boris Schad <kschad@ebs.e-technik.uni-ulm.de>
Subject: Q: Howto access the keyboard in a linux system without a graphics card ?
Date: Mon, 26 Aug 2002 11:43:14 +0200
Sender: linux-console-owner@vger.kernel.org
Message-ID: <200208260943.LAA25845@correo.e-technik.uni-ulm.de>
Reply-To: kschad@ebs.e-technik.uni-ulm.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org, linux-kernel@vger.kernel.org

Hi !

I'm trying to set up a small embedded system for gps receiving with a linux 
system.  I want to have the system working without a graphics card - wich 
works well. The Problem I have at the moment is to access the keyboard 
without a graphics card, because the console driver does not start then ( 
Also a redirect doesn't work then :-( ) 
Is there a way to access the keyboard in this case by a user program ?
The system recognises the keyboard ( I think Kernel and init) and reacts if 
ctrl-alt-del is pressed.

Thanks for your help !

Kai

-- 
Kai-Boris Schad 
University of Ulm, Germany
Dept. of Electron Devices and Circuits
Integrated Circuits in Communications
Albert Einstein Allee 45
89069 ULM

http://www.uni-ulm.de/icic
email:kschad@ebs.e-technik.uni-ulm.de
phone +49/731/50-31581  fax +49/731/50-31599
