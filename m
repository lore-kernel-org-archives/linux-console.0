From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: VT console need rewrite
Date: Tue, 7 Dec 2010 12:37:10 -0800
Message-ID: <20101207123710.4d0e16af@jbarnes-desktop>
References: <1290941875.13526.15.camel@cai.gentoo>
	<87mxosla7p.fsf@basil.nowhere.org>
	<1291025577.9785.7.camel@cai.gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1291025577.9785.7.camel@cai.gentoo>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: microcai@fedoraproject.org
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Mon, 29 Nov 2010 18:12:57 +0800
Microcai <microcai@fedoraproject.org> wrote:

> =E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 11:01 +0100=EF=BC=8CAndi Kleen=
=E5=86=99=E9=81=93=EF=BC=9A
>=20
> > To be honest I have doubts its worth it. This was discussed years a=
nd
> > years ago and the conclusion back then that people who need unicode
> > fonts should use them in X or another graphical console environment
> > (there are plenty to chose from these days). Has this changed?
> >=20
> > -Andi
> >=20
>=20
> Yes, it change. Linux graphical stuck have changed a lot. With KMS,
> console got a native resolution, and looks very nice.

But really, keep this stuff out of the kernel.  Sure, the kernel can
provide memory and a framebuffer to draw in (subject to the constraints
Jerome already mentioned), but why try to deal with fancy input or font
handling there?  IMO the kernel console should be limited to printing
debug and error information; a separate userspace daemon should handle
input and console support.  It would be great to avoid the need for
CONFIG_VT entirely for the typical Linux system.

--=20
Jesse Barnes, Intel Open Source Technology Center
