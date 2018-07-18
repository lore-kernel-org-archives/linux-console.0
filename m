From: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH 1/3] vt: don't reinvent min()
Date: Wed, 18 Jul 2018 04:10:42 +0200
Message-ID: <20180718021044.32611-1-kilobyte@angband.pl>
References: <20180718020604.3u25omf5fxqvsy3q@angband.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718020604.3u25omf5fxqvsy3q@angband.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org
Cc: Adam Borowski <kilobyte@angband.pl>

All the helper function saved us was a cast.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/tty/vt/selection.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
index 90ea1cc52b7a..34e7110f310d 100644
--- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -116,12 +116,6 @@ static inline int atedge(const int p, int size_row)
 	return (!(p % size_row)	|| !((p + 2) % size_row));
 }
 
-/* constrain v such that v <= u */
-static inline unsigned short limit(const unsigned short v, const unsigned short u)
-{
-	return (v > u) ? u : v;
-}
-
 /* stores the char in UTF8 and returns the number of bytes used (1-3) */
 static int store_utf8(u16 c, char *p)
 {
@@ -167,10 +161,10 @@ int set_selection(const struct tiocl_selection __user *sel, struct tty_struct *t
 	if (copy_from_user(&v, sel, sizeof(*sel)))
 		return -EFAULT;
 
-	v.xs = limit(v.xs - 1, vc->vc_cols - 1);
-	v.ys = limit(v.ys - 1, vc->vc_rows - 1);
-	v.xe = limit(v.xe - 1, vc->vc_cols - 1);
-	v.ye = limit(v.ye - 1, vc->vc_rows - 1);
+	v.xs = min_t(u16, v.xs - 1, vc->vc_cols - 1);
+	v.ys = min_t(u16, v.ys - 1, vc->vc_rows - 1);
+	v.xe = min_t(u16, v.xe - 1, vc->vc_cols - 1);
+	v.ye = min_t(u16, v.ye - 1, vc->vc_rows - 1);
 	ps = v.ys * vc->vc_size_row + (v.xs << 1);
 	pe = v.ye * vc->vc_size_row + (v.xe << 1);
 
-- 
2.18.0

