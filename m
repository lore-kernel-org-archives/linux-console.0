From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v3 1/3] vt: preserve unicode values corresponding to screen characters
Date: Tue, 10 Jul 2018 23:39:39 -0400
Message-ID: <79334C7E-6E76-4B5C-9A32-C6DA40D8E88E@linaro.org>
References: <20180627035642.8561-1-nicolas.pitre@linaro.org> <20180627035642.8561-2-nicolas.pitre@linaro.org> <CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=uqioZc0ceXcuYNZ4LD2MS8V7oLz2TzNhftmFyS3N4jA=;
        b=U4U3DBvUu66xwjD4wOzhHVal+lGHNlJzfGHQmlXZHQd7orU78cAKUXni72iJrzYN/I
         ICJHSrTNzlF+8n6Pu0YJcYWpTAsvds+yFl0O/hf+Xy6E+b/KZrNPfJcIaZ0EEt+ty1gO
         KVfSYUr8ZsiYtxQeaL+9N586mPeA4MIWP6rvM=
In-Reply-To: <CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kees Cook <keescook@chromium.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Adam Borowski <kilobyte@angband.pl>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, LKML <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

I am on vacation away from an actual keyboard until next week. Will look at i=
t then.=20

> Le 10 juill. 2018 =C3=A0 20:52, Kees Cook <keescook@chromium.org> a =C3=A9=
crit :
>=20
>> On Tue, Jun 26, 2018 at 8:56 PM, Nicolas Pitre <nicolas.pitre@linaro.org>=
 wrote:
>> The vt code translates UTF-8 strings into glyph index values and stores
>> those glyph values directly in the screen buffer. Because there can only
>> be at most 512 glyphs, it is impossible to represent most unicode
>> characters, in which case a default glyph (often '?') is displayed
>> instead. The original unicode value is then lost.
>>=20
>> This patch implements the basic screen buffer handling to preserve unicod=
e
>> values alongside corresponding display glyphs.  It is not activated by
>> default, meaning that people not relying on that functionality won't get
>> the implied overhead.
>>=20
>> Signed-off-by: Nicolas Pitre <nico@linaro.org>
>> Tested-by: Dave Mielke <Dave@mielke.cc>
>> Acked-by: Adam Borowski <kilobyte@angband.pl>
>> ---
>> drivers/tty/vt/vt.c            | 220 +++++++++++++++++++++++++++++++--
>> include/linux/console_struct.h |   2 +
>> 2 files changed, 211 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
>> index 1eb1a376a0..7b636638b3 100644
>> --- a/drivers/tty/vt/vt.c
>> +++ b/drivers/tty/vt/vt.c
>> [...]
>> +static void vc_uniscr_scroll(struct vc_data *vc, unsigned int t, unsigne=
d int b,
>> +                            enum con_scroll dir, unsigned int nr)
>> +{
>> +       struct uni_screen *uniscr =3D get_vc_uniscr(vc);
>> +
>> +       if (uniscr) {
>> +               unsigned int s, d, rescue, clear;
>> +               char32_t *save[nr];
>=20
> Can you adjust this to avoid the VLA here? I've almost gotten all VLAs
> removed from the kernel[1], and this is introducing a new one. :)
>=20
> Thanks!
>=20
> -Kees
>=20
> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=3DqPXydA=
acU1RqZWA@mail.gmail.com
>=20
>> +
>> +               s =3D clear =3D t;
>> +               d =3D t + nr;
>> +               rescue =3D b - nr;
>> +               if (dir =3D=3D SM_UP) {
>> +                       swap(s, d);
>> +                       swap(clear, rescue);
>> +               }
>> +               memcpy(save, uniscr->lines + rescue, nr * sizeof(*save));=

>> +               memmove(uniscr->lines + d, uniscr->lines + s,
>> +                       (b - t - nr) * sizeof(*uniscr->lines));
>> +               memcpy(uniscr->lines + clear, save, nr * sizeof(*save));
>> +               vc_uniscr_clear_lines(vc, clear, nr);
>> +       }
>> +}
>=20
>=20
> --=20
> Kees Cook
> Pixel Security
