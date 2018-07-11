From: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v3 1/3] vt: preserve unicode values corresponding to
 screen characters
Date: Wed, 11 Jul 2018 23:29:04 +0200
Message-ID: <20180711212904.pvvgedidavvwfaca@angband.pl>
References: <20180627035642.8561-1-nicolas.pitre@linaro.org>
 <20180627035642.8561-2-nicolas.pitre@linaro.org>
 <CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com>
 <20180711091848.GA2889@kroah.com>
 <CAGXu5j+3M6go8HZRC0=ZW8v6_qkFKuLE_cQGta7tnG6t+SBnxA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGXu5j+3M6go8HZRC0=ZW8v6_qkFKuLE_cQGta7tnG6t+SBnxA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, LKML <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

On Wed, Jul 11, 2018 at 01:39:56PM -0700, Kees Cook wrote:
> On Wed, Jul 11, 2018 at 2:18 AM, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jul 10, 2018 at 05:52:01PM -0700, Kees Cook wrote:
> >> On Tue, Jun 26, 2018 at 8:56 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> >> > +++ b/drivers/tty/vt/vt.c
> >> > [...]
> >> > +static void vc_uniscr_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
> >> > +                            enum con_scroll dir, unsigned int nr)
> >> > +{
> >> > +       struct uni_screen *uniscr = get_vc_uniscr(vc);
> >> > +
> >> > +       if (uniscr) {
> >> > +               unsigned int s, d, rescue, clear;
> >> > +               char32_t *save[nr];
> >>
> >> Can you adjust this to avoid the VLA here? I've almost gotten all VLAs
> >> removed from the kernel[1], and this is introducing a new one. :)
> >
> Yup, that's fine. (It's how I noticed it: linux-next VLA build tests.)
> I'm just hoping it can get solved before the merge window opens. :)

This one is actually nasty: max console height is 32767, if you resize it
that big then issue a large scroll request, boom it goes.

> There are still a bunch of VLAs I'm chipping away at, but this was a
> newly added one, so I was hoping Nicolas (when he's back from
> vacation) will have ideas on how to best avoid it.

Nicolas: what about just moving line pointers one at a time?  Rotating an
array slice in-place isn't that slow -- and optimizing that much when
reasonable sizes don't exceed 100ish (depending on how good your eyes are)
is quite ridiculous.  Thanks to your change, we don't need to move actual
contents, just line pointers -- that's fast enough.


Meow!
-- 
// If you believe in so-called "intellectual property", please immediately
// cease using counterfeit alphabets.  Instead, contact the nearest temple
// of Amon, whose priests will provide you with scribal services for all
// your writing needs, for Reasonable And Non-Discriminatory prices.
