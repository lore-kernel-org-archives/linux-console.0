From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [PATCH] [v3] tty/powerpc: introduce the ePAPR embedded
 hypervisor byte channel driver
Date: Fri, 22 Jul 2011 19:00:40 +0000
Message-ID: <CAOZdJXVD6=UizQjgNK-rJm2hDpZG+Gupo6+M3wW-VS7O1rTo_Q@mail.gmail.com>
References: <1310169972-13756-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <1310169972-13756-1-git-send-email-timur@freescale.com>
Content-Language: en-US
Content-ID: <45E7DC55A0B7F24986E4B3504547FDD2@freescale.net>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "greg@kroah.com" <greg@kroah.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-console@vger.kernel.org" <linux-console@vger.kernel.org>

On Fri, Jul 8, 2011 at 7:06 PM, Timur Tabi <timur@freescale.com> wrote:
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
> ---

Greg,

I just want to make sure you haven't forgotten this patch.  Will you
be picking it up for 3.1?

--=20
Timur Tabi
Linux kernel developer at Freescale
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
