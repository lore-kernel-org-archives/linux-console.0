From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Mon, 29 Nov 2010 09:52:19 +0100
Message-ID: <20101129085219.GL5142@const.bordeaux.inria.fr>
References: <AANLkTi=T7pfTP0xHmGqLCSj_8vq_kRijCp5NF+VeBz_f@mail.gmail.com> <20101126104818.1e8f6511@lxorguk.ukuu.org.uk> <AANLkTimThFn2c4V3MGmyQESxPYW8Fan3+S92zb4xBdnH@mail.gmail.com> <AANLkTikCgLPgnBVHWW=g=4n8zFjkiikQ6P3S4gDL9X0=@mail.gmail.com> <20101126114205.4fbefa54@pyx> <1290772421.6087.11.camel@cai.gentoo> <20101126232503.30cfe78b@pyx> <1290837149.677.4.camel@cai.gentoo> <20101127135330.5e32a45a@pyx> <AANLkTim-S7XcZgKHvGJMG-71B8-73aZ1AX5EFXefcW=w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTim-S7XcZgKHvGJMG-71B8-73aZ1AX5EFXefcW=w@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: microcai <microcai@fedoraproject.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-console@vger.kernel.org

microcai, le Mon 29 Nov 2010 09:42:30 +0800, a =E9crit :
> >> Well, if you have that time, please find out those softwares that =
need
> >> to rewrite, and, send patches to them. I'm sure they will just rep=
ly :
> >> why not handle UNICODE in kernel ?!
> >
> > Which has been answered, if you want to run multiple graphical apps=
 on a
> > framebuffer use a windowing system like everyone else does, and I w=
ould
> > imagine "use X" is what most of the software people would tell you.
>=20
> think of w3m. which runs on framebuffer, so ,fbterm is useless here.
> But w3m uses framebuffer to draw pictures, not characters.
> So, if you want nice output, enable UNICODE font in kernel will be th=
e
> best way rather than hacking into the w3m code.

Well, fbterm shouldn't prevent applications from being able to draw on
the console.  That's where the fix could go too (and it makes a lot of
sense).

> if you hack one w3m ,there will be another one that need this kinds o=
f hack ....
> implement it in kernel was/is/will be the best choice.

The kernel will never accept good enough support for all kind of unicod=
e
script.  Think of arabic ligatures, tibetan combinations, etc.  You
don't want to put a rendering engine for these in the kernel.  fbterm i=
s
there for that.

Samuel
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
