From: Microcai <microcai@fedoraproject.org>
Subject: Re: [PATCH 1/2] Kernel fbcon UNICODE font support
Date: Fri, 26 Nov 2010 19:53:41 +0800
Message-ID: <1290772421.6087.11.camel@cai.gentoo>
References: <1290765760.6087.3.camel@cai.gentoo>
	 <20101126100915.66112ee7@lxorguk.ukuu.org.uk>
	 <AANLkTi=gUrUZv=3=tEhyjtWfwhADLU5heo7+DYTQboQv@mail.gmail.com>
	 <20101126104121.043cd9fb@lxorguk.ukuu.org.uk>
	 <AANLkTi=T7pfTP0xHmGqLCSj_8vq_kRijCp5NF+VeBz_f@mail.gmail.com>
	 <20101126104818.1e8f6511@lxorguk.ukuu.org.uk>
	 <AANLkTimThFn2c4V3MGmyQESxPYW8Fan3+S92zb4xBdnH@mail.gmail.com>
	 <AANLkTikCgLPgnBVHWW=g=4n8zFjkiikQ6P3S4gDL9X0=@mail.gmail.com>
	 <20101126114205.4fbefa54@pyx>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=THZSapz4cThJWMel+dgR1vVmA+RRo51D2NiY+LVBQqc=;
        b=iPCv8tUd3q85ywM00tc+5ycF9l4GdCUW68/2gsc6ZL+nYzOQpb+S/7BnUtUzyXUBxg
         gljNfiPGVhDHGF+SUaKyxNbQ22kJaC2tw+StctU0U6s4cozM63DdhVx7amRrLxp50ACQ
         99FrEG2kYSncUYFmTCK+eh1gyBJY7l++rnbHw=
In-Reply-To: <20101126114205.4fbefa54@pyx>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-console@vger.kernel.org

=E5=9C=A8 2010-11-26=E4=BA=94=E7=9A=84 11:42 +0000=EF=BC=8CAlan Cox=E5=86=
=99=E9=81=93=EF=BC=9A
> > There is lots of  program want to open framebuffer , but how can yo=
u
> > make it run if the framebuffer is already taken by fbterm ?
>=20
> Use a different virtual frame buffer, or write software to multiplex
> the
> use of it, you know like say X does...=20

Well, then different virtual frame buffer will not have fbterm running =
,
how do you see UNICODE output?

--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
