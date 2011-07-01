From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v6] drivers/virt: introduce Freescale hypervisor management driver
Date: Fri, 1 Jul 2011 19:12:49 +0200
Message-ID: <201107011912.50119.arnd@arndb.de>
References: <1307652726-4356-1-git-send-email-timur@freescale.com> <201106092304.55479.arnd@arndb.de> <BANLkTi=3r=UQYJVqRLRe-eu7rdkXQS-ESQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=3r=UQYJVqRLRe-eu7rdkXQS-ESQ@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Tabi Timur-B04825 <B04825@freescale.com>
Cc: "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "alan@lxorguk.ukuu.org.uk" <alan@lxorguk.ukuu.org.uk>, Gala Kumar-B11780 <B11780@freescale.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "greg@kroah.com" <greg@kroah.com>, "akpm@kernel.org" <akpm@kernel.org>, "cmetcalf@tilera.com" <cmetcalf@tilera.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "dsaxena@linaro.org" <dsaxena@linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-console@vger.kernel.org" <linux-console@vger.kernel.org>

On Friday 01 July 2011, Tabi Timur-B04825 wrote:
> On Thu, Jun 9, 2011 at 4:04 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thursday 09 June 2011 22:52:06 Timur Tabi wrote:
> >> Add the drivers/virt directory, which houses drivers that support
> >> virtualization environments, and add the Freescale hypervisor management
> >> driver.
> ....
> >>
> >> Signed-off-by: Timur Tabi <timur@freescale.com>
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> So I've made the changes that people have asked for, and Arnd has
> acked this driver.  Who's going to pick it up?  Who will be the
> maintainer for drivers/virt?  I'd really like to see this driver in
> 3.1, and there's not much time left.
> 
I'd say merge it  through the powerpc tree, and list yourself for
the driver, but not the entire directory.

	Arnd
