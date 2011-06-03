From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor management driver
Date: Fri, 3 Jun 2011 17:17:59 +0200
Message-ID: <201106031717.59927.arnd@arndb.de>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106012340.14237.arnd@arndb.de> <4DE8F347.9060104@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DE8F347.9060104@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Timur Tabi <timur@freescale.com>
Cc: kumar.gala@freescale.com, benh@kernel.crashing.org, greg@kroah.com, akpm@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Friday 03 June 2011, Timur Tabi wrote:
> Arnd Bergmann wrote:
> > For an ioctl, please follow the normal pattern of defining a separate
> > structure for each case, no union.
> > 
> > You can use a void __user * in the common ioctl function, and pass that
> > to the typed argument list in the specific functions.
> 
> I have a GPL question.  This header file is currently licensed under the  GPL v2
> only.  Does that mean that any application that includes this header file so
> that it can talk to the driver/hypervisor also needs to be licensed under the GPL?

If you have a license question, ask your lawyer.

Common answers that you would hear are:

* User space interfaces of the kernel are excluded from the License by the
  "normal system call" exception in linux/COPYING.

* If the header files only contain interfaces but no code, they are not
  copyrighted.

* If you want to ship a copy of the file with a user space application source,
  but have to make it available under multiple licenses to do that, e.g. dual
  GPL/BSD.

	Arnd
