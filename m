From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH] Please revert console ASCII glyph 1:1 mapping
Date: Sat, 18 Apr 2009 22:17:17 +0200
Message-ID: <20090418201717.GL21409__4099.83588983795$1240088298$gmane$org@const>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, torvalds@osdl.org, stable@kernel.org

This reverts commit 1c55f187 (console ASCII glyph 1:1 mapping):  Ingo
was assuming that reverting to 1:1 mapping for chars >= 128 was not
useful, but it happens to be: due to the limitations of the Linux
console, when a blind user wants to read BIG5 on it, he has no other
way than loading a font without SFM and let the 1:1 mapping permit the
screen reader to get the BIG5 encoding.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

reverted:
--- b/drivers/char/vt.c
+++ a/drivers/char/vt.c
@@ -2274,7 +2274,7 @@
 				    continue; /* nothing to display */
 				}
 				/* Glyph not found */
+				if ((!(vc->vc_utf && !vc->vc_disp_ctrl) || c < 128) && !(c & ~charmask)) {
-				if ((!(vc->vc_utf && !vc->vc_disp_ctrl) && c < 128) && !(c & ~charmask)) {
 				    /* In legacy mode use the glyph we get by a 1:1 mapping.
 				       This would make absolutely no sense with Unicode in mind,
 				       but do this for ASCII characters since a font may lack
