From: Dirk Mueller <dmueller@suse.com>
Subject: [PATCH] Skip setfont/getfont calls when card is already in graphics mode
Date: Wed,  4 Oct 2017 11:43:21 +0200
Message-ID: <20171004094321.21150-1-dmueller@suse.com>
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org
Cc: Dirk Mueller <dmueller@suse.com>, Hannes Reinecke <hare@suse.de>

The patch prevents setfont from accessing vga registers on the card when
the card is in graphics mode KD_GRAPHICS as we assume, that someone else (ie.
the Xserver) is in charge of the HW in which case accessing the vga registers
may (at best) have no effect (not even the desired one) or (at worst) interfer
with settings the graphics driver has made.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/video/console/vgacon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 445b1dc5d441..1d948b159a05 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -1259,7 +1259,7 @@ static int vgacon_font_set(struct vc_data *c, struct console_font *font, unsigne
 	unsigned charcount = font->charcount;
 	int rc;
 
-	if (vga_video_type < VIDEO_TYPE_EGAM)
+	if (vga_video_type < VIDEO_TYPE_EGAM || vga_is_gfx)
 		return -EINVAL;
 
 	if (font->width != VGA_FONTWIDTH ||
@@ -1277,7 +1277,7 @@ static int vgacon_font_set(struct vc_data *c, struct console_font *font, unsigne
 
 static int vgacon_font_get(struct vc_data *c, struct console_font *font)
 {
-	if (vga_video_type < VIDEO_TYPE_EGAM)
+	if (vga_video_type < VIDEO_TYPE_EGAM || vga_is_gfx)
 		return -EINVAL;
 
 	font->width = VGA_FONTWIDTH;
-- 
2.14.1

