From: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH 0/3] use unicode for vt mouse paste
Date: Wed, 18 Jul 2018 04:06:04 +0200
Message-ID: <20180718020604.3u25omf5fxqvsy3q@angband.pl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Hi!
Based on Nicolas' nice work (in tty-next), let's avoid corrupting characters
that have been copy+pasted via mouse selection.  The uniscr array holds
their original identity even if they got mangled by glyph conversion.
The glyph conversion lossily turns similar-looking characters into a
representation, and everyone else into a replacement character.

There's no proper handling for CJK (yet?) but anything of wcwidth()==1 will
work fine.

The whole thing doesn't get enabled until something reads from /dev/vcsu for
that console, but let's test this code first before enabling it widely.


Diffstat:
 drivers/tty/vt/selection.c | 48 +++++++++++++++++++++++++++++-------------------
 drivers/tty/vt/vt.c        | 10 ++++++++++
 include/linux/selection.h  |  1 +
 3 files changed, 40 insertions(+), 19 deletions(-)


-- 
// If you believe in so-called "intellectual property", please immediately
// cease using counterfeit alphabets.  Instead, contact the nearest temple
// of Amon, whose priests will provide you with scribal services for all
// your writing needs, for Reasonable And Non-Discriminatory prices.
