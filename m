From: Alexey Gladkov <gladkov.alexey@gmail.com>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 04:55:39 +0300
Message-ID: <4CF3081B.9090307@gmail.com>
References: <1290941875.13526.15.camel@cai.gentoo> <73BC440E-833E-4E1B-ACCC-5D68BAB89D83@mit.edu> <1290951770.13526.18.camel@cai.gentoo> <AANLkTimQDWHo4-8-H+5bB_uzrgzU=gqbDBuerq983moR@mail.gmail.com> <20101129020610.7ea7c79e.lisa@ltmnet.com> <1290961207.13526.31.camel@cai.gentoo> <20101128194624.GP2767@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20101128194624.GP2767@thunk.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ted Ts'o <tytso@mit.edu>, Microcai <microcai@fedoraproject.org>, Lisa Milne <lisa@ltmnet.com>, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-kernel@vger.kernel.org, linux-console@v

28.11.2010 22:46, Ted Ts'o wrote:
> How many people do regular login, development, reading e-mail, etc.,
> on the console?  Very few!

Once I broke the euro symbol in the kbd keymaps and got a kick in the
ass very quickly :). It means that users continue to use the console
quite active.

Another example: I keep getting a new keymaps and console fonts for
each new kbd release.

Maybe not a lot of console users, but more of them than you think.

> If the answer is because you hate X, as
> you've already pointed out, we already have fbterm.  Where is it
> written that we need to have a full unicode-capable console system?

fbterm =E2=80=8Ecan't help in all cases. For example: we have a limitat=
ion
NR_KEYS, which makes it impossible to use keycode > 256 in keymaps.
I've already received several complaints about it.

--=20
Rgrds, legion

--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
