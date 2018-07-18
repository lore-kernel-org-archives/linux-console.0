From: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH 3/3] vt: selection: take screen contents from uniscr if available
Date: Wed, 18 Jul 2018 04:10:44 +0200
Message-ID: <20180718021044.32611-3-kilobyte@angband.pl>
References: <20180718020604.3u25omf5fxqvsy3q@angband.pl>
 <20180718021044.32611-1-kilobyte@angband.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718021044.32611-1-kilobyte@angband.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org
Cc: Adam Borowski <kilobyte@angband.pl>

This preserves whatever was written even if we can't currently display the
given glyph.  Mouse paste won't corrupt any character of wcwidth() == 1
anymore.

Note that for now uniscr doesn't get allocated until something reads
/dev/vcsuN for that console, making this code dormant for most users.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/tty/vt/selection.c | 11 +++++++----
 drivers/tty/vt/vt.c        | 10 ++++++++++
 include/linux/selection.h  |  1 +
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
index 69ca337d3220..07496c711d7d 100644
--- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -57,11 +57,13 @@ static inline void highlight_pointer(const int where)
 	complement_pos(sel_cons, where);
 }
 
-static u16
+static u32
 sel_pos(int n)
 {
+	if (use_unicode)
+		return screen_glyph_unicode(sel_cons, n / 2);
 	return inverse_translate(sel_cons, screen_glyph(sel_cons, n),
-				use_unicode);
+				0);
 }
 
 /**
@@ -90,7 +92,8 @@ static u32 inwordLut[]={
   0x07FFFFFE, /* lowercase         */
 };
 
-static inline int inword(const u16 c) {
+static inline int inword(const u32 c)
+{
 	return c > 0x7f || (( inwordLut[c>>5] >> (c & 0x1F) ) & 1);
 }
 
@@ -167,7 +170,7 @@ int set_selection(const struct tiocl_selection __user *sel, struct tty_struct *t
 	struct tiocl_selection v;
 	char *bp, *obp;
 	int i, ps, pe, multiplier;
-	u16 c;
+	u32 c;
 	int mode;
 
 	poke_blanked_console();
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 7fcb0ff2dccf..19da4c0b4b8e 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4545,6 +4545,16 @@ u16 screen_glyph(struct vc_data *vc, int offset)
 }
 EXPORT_SYMBOL_GPL(screen_glyph);
 
+u32 screen_glyph_unicode(struct vc_data *vc, int n)
+{
+	struct uni_screen *uniscr = get_vc_uniscr(vc);
+
+	if (uniscr)
+		return uniscr->lines[n / vc->vc_cols][n % vc->vc_cols];
+	return inverse_translate(vc, screen_glyph(vc, n * 2), 1);
+}
+EXPORT_SYMBOL_GPL(screen_glyph_unicode);
+
 /* used by vcs - note the word offset */
 unsigned short *screen_pos(struct vc_data *vc, int w_offset, int viewed)
 {
diff --git a/include/linux/selection.h b/include/linux/selection.h
index 067d2e99c79f..a8f5b97b216f 100644
--- a/include/linux/selection.h
+++ b/include/linux/selection.h
@@ -32,6 +32,7 @@ extern unsigned char default_blu[];
 
 extern unsigned short *screen_pos(struct vc_data *vc, int w_offset, int viewed);
 extern u16 screen_glyph(struct vc_data *vc, int offset);
+extern u32 screen_glyph_unicode(struct vc_data *vc, int offset);
 extern void complement_pos(struct vc_data *vc, int offset);
 extern void invert_screen(struct vc_data *vc, int offset, int count, int shift);
 
-- 
2.18.0

