From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 1/3] vt: avoid a VLA in the unicode screen scroll function
Date: Tue, 17 Jul 2018 21:02:40 -0400
Message-ID: <20180718010242.5254-2-nicolas.pitre@linaro.org>
References: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=9hsx
        isrz4BLrEl8XObgHlrjSsws=; b=OzW4KCOdmo8spVgkr75GOZKgdUx6eIiYKmH3
        zTfQOCQjHPvlrAynzpeqMU76Bj31mXV6xXZQ8dx6CvlVBTZnfsQX57WH6dFlZLKA
        Z9lBv9FuVIQwhWDTes27bk8dcG0wbYnZnDIFb01+OfLSWBQGMUpZymdYl7fC8/fG
        XBp/uds=
In-Reply-To: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Adam Borowski <kilobyte@angband.pl>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

The nr argument is typically small: most often nr == 1. However this
could be abused with a very large explicit scroll in a resized screen.
Make the code scroll lines one at a time in all cases to avoid the VLA.
Anything smarter is most likely not warranted here.

Requested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 drivers/tty/vt/vt.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 2d14bb195d..03e79f7787 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -433,20 +433,22 @@ static void vc_uniscr_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 
 	if (uniscr) {
 		unsigned int s, d, rescue, clear;
-		char32_t *save[nr];
 
 		s = clear = t;
-		d = t + nr;
-		rescue = b - nr;
+		d = t + 1;
+		rescue = b - 1;
 		if (dir == SM_UP) {
 			swap(s, d);
 			swap(clear, rescue);
 		}
-		memcpy(save, uniscr->lines + rescue, nr * sizeof(*save));
-		memmove(uniscr->lines + d, uniscr->lines + s,
-			(b - t - nr) * sizeof(*uniscr->lines));
-		memcpy(uniscr->lines + clear, save, nr * sizeof(*save));
-		vc_uniscr_clear_lines(vc, clear, nr);
+		while (nr--) {
+			char32_t *tmp;
+			tmp = uniscr->lines[rescue];
+			memmove(uniscr->lines + d, uniscr->lines + s,
+				(b - t - 1) * sizeof(*uniscr->lines));
+			uniscr->lines[clear] = tmp;
+			vc_uniscr_clear_lines(vc, clear, 1);
+		}
 	}
 }
 
-- 
2.17.1

