From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [console] CSI (128+27) vs BIG5 (and possibly others)
Date: Mon, 20 Apr 2009 22:37:48 +0200
Message-ID: <20090420203748.GK5253@const.famille.thibault.fr>
References: <20090418210638.GU21409@const> <20090420112937.78ec67d5@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090420112937.78ec67d5@lxorguk.ukuu.org.uk>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Hello,

Alan Cox, le Mon 20 Apr 2009 11:29:37 +0100, a =E9crit :
> On Sat, 18 Apr 2009 23:06:38 +0200
> Samuel Thibault <samuel.thibault@ens-lyon.org> wrote:
> > A chinese user reported that some characters don't show up fine on
> > its console.  This happens to be because character 128+27 is handle=
d
> > specially by the linux Console.  I believe the same issues can happ=
en
> > with other characters sets.  Since linux' terminfo makes applicatio=
ns
> > use \E[ anyway, would it be ok to add an option to disable the 128+=
27
> > handling?
>=20
> I'm reluctant to do so because its extra complication we don't need (=
at
> least nobody has needed for over fifteen years),

This has been unseen for years because there haven't been chinese blind
users reporting it sofar, there's only one who has showed up relatively
recently on the brltty mailing list.

Let me explain a bit more: sighted chinese users wouldn't use the plain
linux console, as the 512-glyphs limitation doesn't permit to display
kanjis, so they use things like zhcon or just Xorg, which do not use
vt.c's code.  Blind chinese users, however, need their screen reader
to be able to know what's on the screen.  What zhcon displays on the
screen is however not available to the reader as it's just an matrix
internal to zhcon, so these user have to either use Xorg (which is far
from easy), or just use the plain console in 1:1 mapping mode and not
care about the glyphs that get rendered by the video board, while the
screen reader, however, can in that case correctly interpret BIG5.

> it's bound to confuse some other application,

Well, concerning _displaying_ text on the screen, applications don't
care, only the kernel does.  And as I raised, because of the linux
terminfo entry, applications are not supposed to emit CSI through
128+\E, but \E[.  Concerning typing text, yes that might confuse layers
that would interpret 128+\E as being CSI.  These would need the same
kind of option (which could be automatically enabled in BIG5 locales).
The fact that zh_TW BIG5 is in my /etc/locale.gen actually tells me tha=
t
for now we really have a bug that chinese people just haven't taken the
time to raise.

> and given almost everyone has already gone UTF-8 it's really debating
> a corner case only relevant to the past anyway.

I would tend to agree, except that in the case at stake (a blind chines=
e
user), UTF-8 just can not be used, because /dev/vcsa does not provide
the unicode characters that the linux kernel tries to show on the scree=
n
when the font doesn't have enough glyphs to actually show it. That's no=
t
a problem for most languages which can cope with the 512 glyphs limit,
but it's one for chinese.  On the other hand, using the 8bit 1:1 mappin=
g
just works, except the CSI issue.

Yes, the /dev/vcsa interface should ideally be rethought, but it's more
than just defining a new interface, since the kernel itself uses the VG=
A
representation... I haven't been able to take the time to fix that yet
of course...

Samuel
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
