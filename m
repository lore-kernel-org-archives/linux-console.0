From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 1/3] vt: avoid a VLA in the unicode screen scroll
 function
Date: Tue, 17 Jul 2018 22:54:23 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1807172155070.11681@knanqh.ubzr>
References: <20180718010242.5254-1-nicolas.pitre@linaro.org> <20180718010242.5254-2-nicolas.pitre@linaro.org> <20180718014813.ygcbgqxk4yo3ydbl@angband.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1964054974-1531882464=:11681"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=JUE43aCGdIvBQ3zJiGYOJqLCeUH9k/YrYqqRjecWfSQ=;
        b=bA6TluEr/cBsKQJg7YwhKngt98XnMDB0ed2pPyUGzDJm4Tpzwuoq3WYegklvJmZ3+5
         HrTGSHKT9+P00gtbUDB8/eaQVsd64vmTSEF22a0iG1EmG4jheimux9n0Gz9j1VGHniSA
         nw44IHZ1emDVZ69YrbDATdHvGRoybz1SrTw8o=
In-Reply-To: <20180718014813.ygcbgqxk4yo3ydbl@angband.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1964054974-1531882464=:11681
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Jul 2018, Adam Borowski wrote:

> On Tue, Jul 17, 2018 at 09:02:40PM -0400, Nicolas Pitre wrote:
> > The nr argument is typically small: most often nr =3D=3D 1. However this
> > could be abused with a very large explicit scroll in a resized screen.
> > Make the code scroll lines one at a time in all cases to avoid the VLA.
> > Anything smarter is most likely not warranted here.
>=20
> Even though nr can be 32767 at most, your new version is O(nr*nr) for no
> reason.  Instead of O(n) memory or O(n=B2) time, a variant of the original
> that copies values one at a time would be shorter and faster.

Well... even though nr _can_ be up to 32766 to be precise, it is most=20
likely to be just 1 in 99.9% of the cases. So in that case, you'll=20
execute the loop only once and the code is currently optimal with O(n).

If nr > 1 then the current cost is O(n*nr) where n is the height of the=20
scroll window i.e. relatively small in practice (typically between 25=20
and 60). There is no point optimizing for 32767 rows as that is rather=20
silly. If we had then the best solution would be a linked list rather=20
than an array.

But still, if nr > 2 that means you need a temporary storage because the=20
destination memory has to be preserved before the source memory can be=20
moved there, and that destination memory content cannot be stored in the=20
vacated source memory until the source content is moved. Copying values=20
one at a time cannot work because the destination memory, the source=20
memory, and the area where the previous content from the destination=20
memory will end up don't overlap most of the time.

That temporary storage was that VLA. We don't want VLAs. So how do we=20
efficiently allocate and deallocate memory for, say, 25 words? Maybe=20
that doesn't have to be efficient because that doesn't happen very often=20
as we said, at which point we can just do it in a loop with a one-line=20
increment instead, as this patch does.

If you still have a more clever way of doing this then please propose it=20
in code form (I'm genuinely curious of what you have in mind). But let's=20
get the baseline working in an obvious "correct" way first.

> > Requested-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
> > ---
> >  drivers/tty/vt/vt.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> > index 2d14bb195d..03e79f7787 100644
> > --- a/drivers/tty/vt/vt.c
> > +++ b/drivers/tty/vt/vt.c
> > @@ -433,20 +433,22 @@ static void vc_uniscr_scroll(struct vc_data *vc, =
unsigned int t, unsigned int b,
> > =20
> >  	if (uniscr) {
> >  		unsigned int s, d, rescue, clear;
> > -		char32_t *save[nr];
> > =20
> >  		s =3D clear =3D t;
> > -		d =3D t + nr;
> > -		rescue =3D b - nr;
> > +		d =3D t + 1;
> > +		rescue =3D b - 1;
> >  		if (dir =3D=3D SM_UP) {
> >  			swap(s, d);
> >  			swap(clear, rescue);
> >  		}
> > -		memcpy(save, uniscr->lines + rescue, nr * sizeof(*save));
> > -		memmove(uniscr->lines + d, uniscr->lines + s,
> > -			(b - t - nr) * sizeof(*uniscr->lines));
> > -		memcpy(uniscr->lines + clear, save, nr * sizeof(*save));
> > -		vc_uniscr_clear_lines(vc, clear, nr);
> > +		while (nr--) {
> > +			char32_t *tmp;
> > +			tmp =3D uniscr->lines[rescue];
> > +			memmove(uniscr->lines + d, uniscr->lines + s,
> > +				(b - t - 1) * sizeof(*uniscr->lines));
> > +			uniscr->lines[clear] =3D tmp;
> > +			vc_uniscr_clear_lines(vc, clear, 1);
> > +		}
> >  	}
> >  }
>=20
> What the function does is rotating an array (slice [t..b) here), by nr if
> SM_DOWN or by -nr ie (b - t - nr) if SM_UP.  A nice problem that almost e=
very
> "code interview questions" book includes :)
>=20
> Please say if you don't have time for such games, I've just refreshed wha=
t's
> a good answer. :=FE
>=20
>=20
> Meow.
> --=20
> // If you believe in so-called "intellectual property", please immediately
> // cease using counterfeit alphabets.  Instead, contact the nearest temple
> // of Amon, whose priests will provide you with scribal services for all
> // your writing needs, for Reasonable And Non-Discriminatory prices.
>=20
--8323328-1964054974-1531882464=:11681--
