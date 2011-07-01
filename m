From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [PATCH 7/7] [v6] drivers/virt: introduce Freescale hypervisor
 management driver
Date: Fri, 1 Jul 2011 01:18:15 +0000
Message-ID: <BANLkTi=3r=UQYJVqRLRe-eu7rdkXQS-ESQ@mail.gmail.com>
References: <1307652726-4356-1-git-send-email-timur@freescale.com>
	<201106092304.55479.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <201106092304.55479.arnd@arndb.de>
Content-Language: en-US
Content-ID: <4EA51EC6BB80F340A5CB3FBBFBD06B1C@freescale.net>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "alan@lxorguk.ukuu.org.uk" <alan@lxorguk.ukuu.org.uk>, Gala Kumar-B11780 <B11780@freescale.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "greg@kroah.com" <greg@kroah.com>, "akpm@kernel.org" <akpm@kernel.org>, "cmetcalf@tilera.com" <cmetcalf@tilera.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "dsaxena@linaro.org" <dsaxena@linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-console@vger.kernel.org" <linux-console@vger.kernel.org>

On Thu, Jun 9, 2011 at 4:04 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 09 June 2011 22:52:06 Timur Tabi wrote:
>> Add the drivers/virt directory, which houses drivers that support
>> virtualization environments, and add the Freescale hypervisor management
>> driver.
....
>>
>> Signed-off-by: Timur Tabi <timur@freescale.com>
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

So I've made the changes that people have asked for, and Arnd has
acked this driver.  Who's going to pick it up?  Who will be the
maintainer for drivers/virt?  I'd really like to see this driver in
3.1, and there's not much time left.

-- 
Timur Tabi
Linux kernel developer at Freescale
