From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 16:53:25 +0800
Message-ID: <1291020805.9785.0.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <1290954545.13526.27.camel@cai.gentoo>
	 <20101128191152.GV10602@const.famille.thibault.fr>
	 <1290993006.877.0.camel@cai.gentoo>
	 <20101129081639.GA5142@const.bordeaux.inria.fr>
	 <AANLkTinmdRjEkmywaMevN5_A=2N8_pBsOAJj8PoAaznz@mail.gmail.com>
	 <20101129082711.GB5142@const.bordeaux.inria.fr>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=eX3uCuecPoNiyYkdpBM1EvcxXiDalA+T9HNuDzD2twI=;
        b=az08CNnZE/2Fob6TcEOlUy7OgpU0UT8rTfdwKLXj56K95FDkEfyEJXFtt5sQkwSQOd
         OrRk+1+e1cbd0UMcTxZQx2bWv+5FdOXXynUfJuPAhbnlJbbnAVuSkrbEbUGKsRHhYEZQ
         c9tJYvkKH1pPceO1fgfhza9o7UZBtksCgt5O0=
In-Reply-To: <20101129082711.GB5142@const.bordeaux.inria.fr>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 09:27 +0100=EF=BC=8CSamuel Thiba=
ult=E5=86=99=E9=81=93=EF=BC=9A
> microcai, le Mon 29 Nov 2010 16:20:11 +0800, a =C3=A9crit :
> > > But isn't that basically what you are describing?
> > >
> > > (i.e. what's the use of using a pts and /dev/fb, if not for a use=
rlevel
> > > terminal to actually do the work?)
> > >
> >=20
> > ok, try run zhcon on pts.  can you do that ?
>=20
> zhcon _provides_ a pts, that's what I mean.

So you agree zhcon can't run on pts.
Then there's dozens of zhcon.


--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
