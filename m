From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v3 3/3] vt: unicode fallback for scrollback
Date: Tue, 26 Jun 2018 23:56:42 -0400
Message-ID: <20180627035642.8561-4-nicolas.pitre@linaro.org>
References: <20180627035642.8561-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=ABWv
        dJzh4qOnthHLY9zePogflFs=; b=PYLJBPNlfai7KssOzRHPYcJfQBVDiZhw8ixP
        V4DlhF0kYRvQ3a+qOcJkSX8877QcPFaytdovukSsurXR47P2VIPx14OgthBY+0JD
        StPALUs/NqF5v0hOARORmN8AesL9xaGExaJgOYm6yoBpOa+dN0PWqGIx0SMq0ldS
        344f6jM=
In-Reply-To: <20180627035642.8561-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Adam Borowski <kilobyte@angband.pl>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

There is currently no provision for scrollback content in the core code,
leaving that to backend video drivers where this can be highly optimized.
There is currently no common method for those drivers to tell the core
what part of the scrollback is actually displayed and what size the
scrollback buffer is either. Because of that, the unicode screen buffer
has no provision for any scrollback.

At least we can provide backtranslated glyph values when the scrollback
is active which should be plenty good enough for now.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Tested-by: Dave Mielke <Dave@mielke.cc>
Acked-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/tty/vt/vc_screen.c |  3 ++-
 drivers/tty/vt/vt.c        | 31 +++++++++++++++++++++++++++++--
 include/linux/selection.h  |  2 +-
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/vt/vc_screen.c b/drivers/tty/vt/vc_screen.c
index 9c44252e52..2384ea85ff 100644
--- a/drivers/tty/vt/vc_screen.c
+++ b/drivers/tty/vt/vc_screen.c
@@ -311,7 +311,8 @@ vcs_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 			do {
 				if (nr > this_round/4)
 					nr = this_round/4;
-				vc_uniscr_copy_line(vc, con_buf0, row, col, nr);
+				vc_uniscr_copy_line(vc, con_buf0, viewed,
+						    row, col, nr);
 				con_buf0 += nr * 4;
 				this_round -= nr * 4;
 				row++;
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 062ce6be79..2d14bb195d 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -533,13 +533,40 @@ int vc_uniscr_check(struct vc_data *vc)
  * This must be preceded by a successful call to vc_uniscr_check() once
  * the console lock has been taken.
  */
-void vc_uniscr_copy_line(struct vc_data *vc, void *dest,
+void vc_uniscr_copy_line(struct vc_data *vc, void *dest, int viewed,
 			 unsigned int row, unsigned int col, unsigned int nr)
 {
 	struct uni_screen *uniscr = get_vc_uniscr(vc);
+	int offset = row * vc->vc_size_row + col * 2;
+	unsigned long pos;
 
 	BUG_ON(!uniscr);
-	memcpy(dest, &uniscr->lines[row][col], nr * sizeof(char32_t));
+
+	pos = (unsigned long)screenpos(vc, offset, viewed);
+	if (pos >= vc->vc_origin && pos < vc->vc_scr_end) {
+		/*
+		 * Desired position falls in the main screen buffer.
+		 * However the actual row/col might be different if
+		 * scrollback is active.
+		 */
+		row = (pos - vc->vc_origin) / vc->vc_size_row;
+		col = ((pos - vc->vc_origin) % vc->vc_size_row) / 2;
+		memcpy(dest, &uniscr->lines[row][col], nr * sizeof(char32_t));
+	} else {
+		/*
+		 * Scrollback is active. For now let's simply backtranslate
+		 * the screen glyphs until the unicode screen buffer does
+		 * synchronize with console display drivers for a scrollback
+		 * buffer of its own.
+		 */
+		u16 *p = (u16 *)pos;
+		int mask = vc->vc_hi_font_mask | 0xff;
+		char32_t *uni_buf = dest;
+		while (nr--) {
+			u16 glyph = scr_readw(p++) & mask;
+			*uni_buf++ = inverse_translate(vc, glyph, true);
+		}
+	}
 }
 
 
diff --git a/include/linux/selection.h b/include/linux/selection.h
index 2b34df9f1e..067d2e99c7 100644
--- a/include/linux/selection.h
+++ b/include/linux/selection.h
@@ -43,7 +43,7 @@ extern void vcs_scr_writew(struct vc_data *vc, u16 val, u16 *org);
 extern void vcs_scr_updated(struct vc_data *vc);
 
 extern int vc_uniscr_check(struct vc_data *vc);
-extern void vc_uniscr_copy_line(struct vc_data *vc, void *dest,
+extern void vc_uniscr_copy_line(struct vc_data *vc, void *dest, int viewed,
 				unsigned int row, unsigned int col,
 				unsigned int nr);
 
-- 
2.17.1

