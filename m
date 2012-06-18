From: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: wishlist: vnc framebuffer device?
Date: Mon, 18 Jun 2012 10:13:42 +0200
Message-ID: <CAFLxGvzVOru0OAsXuwjoFT29f5Sqx1U2u-FMuJr-3TGdv-K7qw@mail.gmail.com>
References: <4FDC6874.4070106@afaics.de>
	<CAFLxGvxpXBgOH=rhNUdE2FN=mm90sX4-Atwc4k-VrSxoAVZh9A@mail.gmail.com>
	<4FDED1E7.6020001@aixigo.de>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=l28+N7HFG0q6e6rmwZZm+8Y/VqD1YsaVYHmGicmgnL4=;
        b=J2i9TqbJ65PT4XXnjzuVuJwoFVzj29SlUTx9P/a4rpjBkYMj5VVuwQjOS4ufBWJ9lk
         R7MLs30QbSvbfCGFv9/L5V0xwBvc/6dQKCyJON/LCaQExcM9M68kS0qFYudlLbjJAzI4
         rb05nWJV/RINOagJIhR6sdFoEmnU/D9GW0McmY1C+kemXtKRT0Fi5msgEka0I2rHl9MD
         vVfxNOoG1Xv+Y/9jOBvIr5MR2qAzJkgNv/qiIAQypq8hFfG6bNQs7sTj+4spXCydHfus
         6oguWelRskS2uKoHxKr909qyoLAP8l74ZuFXa3aKd/Qw06nxKobitjA3g/5ruibqeOwO
         I7aw==
In-Reply-To: <4FDED1E7.6020001@aixigo.de>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Dunkel <harald.dunkel@aixigo.de>
Cc: Harald Dunkel <harri@afaics.de>, Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

On Mon, Jun 18, 2012 at 8:59 AM, Harald Dunkel <harald.dunkel@aixigo.de> wrote:
> It is very important to me to get access to the VNC console
> very early in the boot procedure, e.g. if there is a fsck
> asking for help, or if a badly configured root device drops
> me on busybox.

Start the VNC server in your initrd and make sure that it gets
not killed... :-)

-- 
Thanks,
//richard
