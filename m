From: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH 2/3] vt: selection: handle storing of characters above U+FFFF
Date: Wed, 18 Jul 2018 04:10:43 +0200
Message-ID: <20180718021044.32611-2-kilobyte@angband.pl>
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

Those above U+10FFFF get replaced with U+FFFD.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/tty/vt/selection.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
index 34e7110f310d..69ca337d3220 100644
--- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -116,8 +116,8 @@ static inline int atedge(const int p, int size_row)
 	return (!(p % size_row)	|| !((p + 2) % size_row));
 }
 
-/* stores the char in UTF8 and returns the number of bytes used (1-3) */
-static int store_utf8(u16 c, char *p)
+/* stores the char in UTF8 and returns the number of bytes used (1-4) */
+static int store_utf8(u32 c, char *p)
 {
 	if (c < 0x80) {
 		/*  0******* */
@@ -128,13 +128,26 @@ static int store_utf8(u16 c, char *p)
 		p[0] = 0xc0 | (c >> 6);
 		p[1] = 0x80 | (c & 0x3f);
 		return 2;
-    	} else {
+	} else if (c < 0x10000) {
 		/* 1110**** 10****** 10****** */
 		p[0] = 0xe0 | (c >> 12);
 		p[1] = 0x80 | ((c >> 6) & 0x3f);
 		p[2] = 0x80 | (c & 0x3f);
 		return 3;
-    	}
+	} else if (c < 0x110000) {
+		/* 11110*** 10****** 10****** 10****** */
+		p[0] = 0xf0 | (c >> 18);
+		p[1] = 0x80 | ((c >> 12) & 0x3f);
+		p[2] = 0x80 | ((c >> 6) & 0x3f);
+		p[3] = 0x80 | (c & 0x3f);
+		return 4;
+	} else {
+		/* outside Unicode, replace with U+FFFD */
+		p[0] = 0xef;
+		p[1] = 0xbf;
+		p[2] = 0xbd;
+		return 3;
+	}
 }
 
 /**
@@ -273,7 +286,7 @@ int set_selection(const struct tiocl_selection __user *sel, struct tty_struct *t
 	sel_end = new_sel_end;
 
 	/* Allocate a new buffer before freeing the old one ... */
-	multiplier = use_unicode ? 3 : 1;  /* chars can take up to 3 bytes */
+	multiplier = use_unicode ? 4 : 1;  /* chars can take up to 4 bytes */
 	bp = kmalloc_array((sel_end - sel_start) / 2 + 1, multiplier,
 			   GFP_KERNEL);
 	if (!bp) {
-- 
2.18.0

