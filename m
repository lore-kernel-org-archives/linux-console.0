From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 2/3] vt: coherence validation code for the unicode screen buffer
Date: Tue, 17 Jul 2018 21:02:41 -0400
Message-ID: <20180718010242.5254-3-nicolas.pitre@linaro.org>
References: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=Z9a3
        /MBdtj9jXUeSkq/yeCQ5zso=; b=DETh6RmjmbiGozGx70xavXS/vISp7hoKMcdN
        SSwgrzVOGCWo7CcZ5AWuKRsm2iJhxFx9v6fMgndBJB/ez/WFVXMQkxjiRrLKLgN0
        aYPxt/w8MmjkxHZrv2uAthC8oSsILwzvJwzNd2Xtq0E4ow0oXgQ0myQ0veEf1xxV
        o/0aRKc=
In-Reply-To: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Adam Borowski <kilobyte@angband.pl>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Make sure the unicode screen buffer matches the video screen content.
This is provided for debugging convenience and disabled by default.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 drivers/tty/vt/vt.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 03e79f7787..331f175265 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -328,6 +328,8 @@ void schedule_console_callback(void)
 #define get_vc_uniscr(vc) vc->vc_uni_screen
 #endif
 
+#define VC_UNI_SCREEN_DEBUG 0
+
 typedef uint32_t char32_t;
 
 /*
@@ -571,6 +573,42 @@ void vc_uniscr_copy_line(struct vc_data *vc, void *dest, int viewed,
 	}
 }
 
+/* this is for validation and debugging only */
+static void vc_uniscr_debug_check(struct vc_data *vc)
+{
+	struct uni_screen *uniscr = get_vc_uniscr(vc);
+	unsigned short *p;
+	int x, y, mask;
+
+	if (!VC_UNI_SCREEN_DEBUG || !uniscr)
+		return;
+
+	WARN_CONSOLE_UNLOCKED();
+
+	/*
+	 * Make sure our unicode screen translates into the same glyphs
+	 * as the actual screen. This is brutal indeed.
+	 */
+	p = (unsigned short *)vc->vc_origin;
+	mask = vc->vc_hi_font_mask | 0xff;
+	for (y = 0; y < vc->vc_rows; y++) {
+		char32_t *line = uniscr->lines[y];
+		for (x = 0; x < vc->vc_cols; x++) {
+			u16 glyph = scr_readw(p++) & mask;
+			char32_t uc = line[x];
+			int tc = conv_uni_to_pc(vc, uc);
+			if (tc == -4)
+				tc = conv_uni_to_pc(vc, 0xfffd);
+			if (tc == -4)
+				tc = conv_uni_to_pc(vc, '?');
+			if (tc != glyph)
+				pr_err_ratelimited(
+					"%s: mismatch at %d,%d: glyph=%#x tc=%#x\n",
+					__func__, x, y, glyph, tc);
+		}
+	}
+}
+
 
 static void con_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 		enum con_scroll dir, unsigned int nr)
@@ -2719,6 +2757,7 @@ static int do_con_write(struct tty_struct *tty, const unsigned char *buf, int co
 		do_con_trol(tty, vc, orig);
 	}
 	con_flush(vc, draw_from, draw_to, &draw_x);
+	vc_uniscr_debug_check(vc);
 	console_conditional_schedule();
 	console_unlock();
 	notify_update(vc);
-- 
2.17.1

