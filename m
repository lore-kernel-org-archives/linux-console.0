From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [PATCH 6/7] [v2] tty/powerpc: introduce the ePAPR embedded
 hypervisor byte channel driver
Date: Sun, 3 Jul 2011 01:43:52 +0000
Message-ID: <CAOZdJXVyujA0fsnvYnCcqDYhmgYMk0DwBTh-wEkFN4fCDVYdcA@mail.gmail.com>
References: <1305830092-20104-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1305830092-20104-1-git-send-email-timur@freescale.com>
Content-Language: en-US
Content-ID: <BA00853FE71E9D4987D023849E367C2D@freescale.net>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "greg@kroah.com" <greg@kroah.com>
Cc: Gala Kumar-B11780 <B11780@freescale.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "akpm@kernel.org" <akpm@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-console@vger.kernel.org" <linux-console@vger.kernel.org>, "alan@lxorguk.ukuu.org.uk" <alan@lxorguk.ukuu.org.uk>, "arnd@arndb.de" <arnd@arndb.de>

On Thu, May 19, 2011 at 1:34 PM, Timur Tabi <timur@freescale.com> wrote=
:
> The ePAPR embedded hypervisor specification provides an API for "byte
> channels", which are serial-like virtual devices for sending and rece=
iving
> streams of bytes. =A0This driver provides Linux kernel support for by=
te
> channels via three distinct interfaces:
>
> 1) An early-console (udbg) driver. =A0This provides early console out=
put
> through a byte channel. =A0The byte channel handle must be specified =
in a
> Kconfig option.
>
> 2) A normal console driver. =A0Output is sent to the byte channel des=
ignated
> for stdout in the device tree. =A0The console driver is for handling =
kernel
> printk calls.
>
> 3) A tty driver, which is used to handle user-space input and output.=
 =A0The
> byte channel used for the console is designated as the default tty.
>
> Signed-off-by: Timur Tabi <timur@freescale.com>

Greg, would you please pick up this patch for 3.1?  Patches 1-5 are
already queued through the PowerPC tree.

Thank you.

The patch is available here if you need to download it:
http://patchwork.ozlabs.org/patch/96443/

--=20
Timur Tabi
Linux kernel developer at Freescale
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
