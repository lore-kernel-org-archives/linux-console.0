From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 10:48:53 +0800
Message-ID: <1290998933.877.24.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu>
	 <1290951770.13526.18.camel@cai.gentoo>
	 <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com>
	 <1290954545.13526.27.camel@cai.gentoo>
	 <20101128191152.GV10602@const.famille.thibault.fr>
	 <1290993006.877.0.camel@cai.gentoo>
	 <20101129024918.GA5218@cr0.nay.redhat.com>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=48lSt1NyXsHzvXefkUWWaqcN7uBmCJxX13EUloRJdhU=;
        b=LXTyq1287ULfF2K/JAvcj6ouOheRXW3zNF6e4ofVGrfpyMJWd5gOFibq+eIbbAU4cS
         5UgXoz0sVYu01DtG9HNJiFJvL5/SNb8IjMADyfoIFdKchMKoq44GCn/m0vcJfaA0SieE
         pSGIYTvJi6bArMNZ+ixxb+Nxq6of3k+fNKhWw=
In-Reply-To: <20101129024918.GA5218@cr0.nay.redhat.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Theodore Tso <tytso@mit.edu>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 10:49 +0800=EF=BC=8CAm=C3=A9rico=
 Wang=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Nov 29, 2010 at 09:10:06AM +0800, Microcai wrote:
> >=E5=9C=A8 2010-11-28=E6=97=A5=E7=9A=84 20:11 +0100=EF=BC=8CSamuel Th=
ibault=E5=86=99=E9=81=93=EF=BC=9A
> >> Microcai, le Sun 28 Nov 2010 22:29:05 +0800, a =C3=A9crit :
> >> > So, here is the design according to your description  ..=20
> >> >=20
> >> > JUST export /dev/fb and /dev/pts and /dev/console
> >> > The kernel use /dev/console, but invisible.=20
> >> > The rest of the world uses /dev/pts
> >> >=20
> >> > Make init using /dev/fb to display boot message, and agetty runs
> >> > on /dev/pts
> >>=20
> >> Errr, but that already exists, that's fbterm...
> >>=20
> >> Samuel
> >
> >Every time someone try to implement something , some other guy will =
jump
> >out and say, that already exist, in user-space ..... blablablabla
> >
>=20
> Remember, remember, kernel provides a mechanism, not a policy.
> (From this point, auto-groups *does* break it.)

YES, but handle UNICODE font is a policy????????




--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
