From: Harald Dunkel <harald.dunkel@aixigo.de>
Subject: Re: wishlist: vnc framebuffer device?
Date: Mon, 18 Jun 2012 08:59:51 +0200
Message-ID: <4FDED1E7.6020001@aixigo.de>
References: <4FDC6874.4070106@afaics.de> <CAFLxGvxpXBgOH=rhNUdE2FN=mm90sX4-Atwc4k-VrSxoAVZh9A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <CAFLxGvxpXBgOH=rhNUdE2FN=mm90sX4-Atwc4k-VrSxoAVZh9A@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Cc: Harald Dunkel <harri@afaics.de>, Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

Hi Richard,

On 06/17/12 12:13, richard -rw- weinberger wrote:
> 
> What about a VNC server which exports a framebuffer device?
> Like: http://code.google.com/p/android-vnc
> 
> No need to implement VNC in kernel space.
> 

If it can run in user space, then thats fine with me. But I
would guess the pseudo framebuffer device itself (without the
networking, authentication and encryption stuff) has to
reside in the kernel.

It is very important to me to get access to the VNC console
very early in the boot procedure, e.g. if there is a fsck
asking for help, or if a badly configured root device drops
me on busybox.

For qemu/kvm hosts (and others) it is very convenient to
access the console via VNC. For "real" hosts I am restricted
to SOL or some remote management hardware module providing
a web interface.

It would be very nice to get an improvement here.


Regards

Harri
