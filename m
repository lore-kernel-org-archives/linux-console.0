From: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH 1/3] vt: avoid a VLA in the unicode screen scroll function
Date: Wed, 18 Jul 2018 03:48:13 +0200
Message-ID: <20180718014813.ygcbgqxk4yo3ydbl@angband.pl>
References: <20180718010242.5254-1-nicolas.pitre@linaro.org>
 <20180718010242.5254-2-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180718010242.5254-2-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Tue, Jul 17, 2018 at 09:02:40PM -0400, Nicolas Pitre wrote:
> The nr argument is typically small: most often nr =3D=3D 1. However this
> could be abused with a very large explicit scroll in a resized screen.
> Make the code scroll lines one at a time in all cases to avoid the VLA.
> Anything smarter is most likely not warranted here.

Even though nr can be 32767 at most, your new version is O(nr*nr) for no
reason.  Instead of O(n) memory or O(n=B2) time, a variant of the original
that copies values one at a time would be shorter and faster.

> Requested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  drivers/tty/vt/vt.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 2d14bb195d..03e79f7787 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -433,20 +433,22 @@ static void vc_uniscr_scroll(struct vc_data *vc, un=
signed int t, unsigned int b,
> =20
>  	if (uniscr) {
>  		unsigned int s, d, rescue, clear;
> -		char32_t *save[nr];
> =20
>  		s =3D clear =3D t;
> -		d =3D t + nr;
> -		rescue =3D b - nr;
> +		d =3D t + 1;
> +		rescue =3D b - 1;
>  		if (dir =3D=3D SM_UP) {
>  			swap(s, d);
>  			swap(clear, rescue);
>  		}
> -		memcpy(save, uniscr->lines + rescue, nr * sizeof(*save));
> -		memmove(uniscr->lines + d, uniscr->lines + s,
> -			(b - t - nr) * sizeof(*uniscr->lines));
> -		memcpy(uniscr->lines + clear, save, nr * sizeof(*save));
> -		vc_uniscr_clear_lines(vc, clear, nr);
> +		while (nr--) {
> +			char32_t *tmp;
> +			tmp =3D uniscr->lines[rescue];
> +			memmove(uniscr->lines + d, uniscr->lines + s,
> +				(b - t - 1) * sizeof(*uniscr->lines));
> +			uniscr->lines[clear] =3D tmp;
> +			vc_uniscr_clear_lines(vc, clear, 1);
> +		}
>  	}
>  }

What the function does is rotating an array (slice [t..b) here), by nr if
SM_DOWN or by -nr ie (b - t - nr) if SM_UP.  A nice problem that almost eve=
ry
"code interview questions" book includes :)

Please say if you don't have time for such games, I've just refreshed what's
a good answer. :=FE


Meow.
--=20
// If you believe in so-called "intellectual property", please immediately
// cease using counterfeit alphabets.  Instead, contact the nearest temple
// of Amon, whose priests will provide you with scribal services for all
// your writing needs, for Reasonable And Non-Discriminatory prices.
