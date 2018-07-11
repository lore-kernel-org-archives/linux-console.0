From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/3] vt: preserve unicode values corresponding to
 screen characters
Date: Wed, 11 Jul 2018 11:18:48 +0200
Message-ID: <20180711091848.GA2889@kroah.com>
References: <20180627035642.8561-1-nicolas.pitre@linaro.org>
 <20180627035642.8561-2-nicolas.pitre@linaro.org>
 <CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Adam Borowski <kilobyte@angband.pl>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, LKML <linux-kernel@vger.kernel.org>, linux-console@vger.kernel.org

On Tue, Jul 10, 2018 at 05:52:01PM -0700, Kees Cook wrote:
> On Tue, Jun 26, 2018 at 8:56 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> > The vt code translates UTF-8 strings into glyph index values and stores
> > those glyph values directly in the screen buffer. Because there can only
> > be at most 512 glyphs, it is impossible to represent most unicode
> > characters, in which case a default glyph (often '?') is displayed
> > instead. The original unicode value is then lost.
> >
> > This patch implements the basic screen buffer handling to preserve unicode
> > values alongside corresponding display glyphs.  It is not activated by
> > default, meaning that people not relying on that functionality won't get
> > the implied overhead.
> >
> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
> > Tested-by: Dave Mielke <Dave@mielke.cc>
> > Acked-by: Adam Borowski <kilobyte@angband.pl>
> > ---
> >  drivers/tty/vt/vt.c            | 220 +++++++++++++++++++++++++++++++--
> >  include/linux/console_struct.h |   2 +
> >  2 files changed, 211 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> > index 1eb1a376a0..7b636638b3 100644
> > --- a/drivers/tty/vt/vt.c
> > +++ b/drivers/tty/vt/vt.c
> > [...]
> > +static void vc_uniscr_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
> > +                            enum con_scroll dir, unsigned int nr)
> > +{
> > +       struct uni_screen *uniscr = get_vc_uniscr(vc);
> > +
> > +       if (uniscr) {
> > +               unsigned int s, d, rescue, clear;
> > +               char32_t *save[nr];
> 
> Can you adjust this to avoid the VLA here? I've almost gotten all VLAs
> removed from the kernel[1], and this is introducing a new one. :)

This is already in my tree, sorry :(

greg k-h
