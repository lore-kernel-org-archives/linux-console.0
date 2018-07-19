From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 1/3] vt: avoid a VLA in the unicode screen scroll
 function
Date: Thu, 19 Jul 2018 00:05:25 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1807182353560.2327@knanqh.ubzr>
References: <20180718010242.5254-1-nicolas.pitre@linaro.org> <20180718010242.5254-2-nicolas.pitre@linaro.org> <20180718014813.ygcbgqxk4yo3ydbl@angband.pl> <nycvar.YSQ.7.76.1807172155070.11681@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=9L1c2SXSe9w4RAXutcBV4JB61x4zaXaUcgisK6i0cp4=;
        b=Pw4VVdBupRZ4fQdV7oOoQ5W+HbEZfyQ9oH8NVMUIdrQsU16kgRSjUGxjyDSmcLIbut
         N9wabmtH1uTe9aeKrsbwVSQYrlT/6rC+VwBM0uicacMsa+902aaESJp1miBVzIgUaWPs
         rWHkgHohlCYls1rwU1etNGieXb2SQrWSoyp/E=
In-Reply-To: <nycvar.YSQ.7.76.1807172155070.11681@knanqh.ubzr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Borowski <kilobyte@angband.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

On Tue, 17 Jul 2018, Nicolas Pitre wrote:

> But still, if nr > 2 that means you need a temporary storage because the 
> destination memory has to be preserved before the source memory can be 
> moved there, and that destination memory content cannot be stored in the 
> vacated source memory until the source content is moved.

OK I'm an idiot.

After looking in the literature, I found out that there is indeed a 
better way to do this. So here's an updated patch:

----- >8

Subject: [PATCH v2 1/3] vt: avoid a VLA in the unicode screen scroll function

The nr argument is typically small: most often nr == 1. However this
could be abused with a very large explicit scroll in a resized screen.
Make the code scroll lines by performing an array rotation operation to
avoid the need for a large temporary space.

Requested-by: Kees Cook <keescook@chromium.org>
Suggested-by: Adam Borowski <kilobyte@angband.pl>
Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 2d14bb195d..d527184579 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -104,6 +104,7 @@
 #include <linux/kdb.h>
 #include <linux/ctype.h>
 #include <linux/bsearch.h>
+#include <linux/gcd.h>
 
 #define MAX_NR_CON_DRIVER 16
 
@@ -432,20 +433,29 @@ static void vc_uniscr_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 	struct uni_screen *uniscr = get_vc_uniscr(vc);
 
 	if (uniscr) {
-		unsigned int s, d, rescue, clear;
-		char32_t *save[nr];
-
-		s = clear = t;
-		d = t + nr;
-		rescue = b - nr;
-		if (dir == SM_UP) {
-			swap(s, d);
-			swap(clear, rescue);
+		unsigned int i, j, k, sz, d, clear;
+
+		sz = b - t;
+		clear = b - nr;
+		d = nr;
+		if (dir == SM_DOWN) {
+			clear = t;
+			d = sz - nr;
+		}
+		for (i = 0; i < gcd(d, sz); i++) {
+			char32_t *tmp = uniscr->lines[t + i];
+			j = i;
+			while (1) {
+				k = j + d;
+				if (k >= sz)
+					k -= sz;
+				if (k == i)
+					break;
+				uniscr->lines[t + j] = uniscr->lines[t + k];
+				j = k;
+			}
+			uniscr->lines[t + j] = tmp;
 		}
-		memcpy(save, uniscr->lines + rescue, nr * sizeof(*save));
-		memmove(uniscr->lines + d, uniscr->lines + s,
-			(b - t - nr) * sizeof(*uniscr->lines));
-		memcpy(uniscr->lines + clear, save, nr * sizeof(*save));
 		vc_uniscr_clear_lines(vc, clear, nr);
 	}
 }

