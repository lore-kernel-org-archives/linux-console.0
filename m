From: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH 1/6] vt: drop unused struct vt_struct
Date: Wed, 18 Jul 2018 05:03:22 +0200
Message-ID: <20180718030327.579-1-kilobyte@angband.pl>
References: <20180718030152.kdq53mwpdfusvwl5@angband.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718030152.kdq53mwpdfusvwl5@angband.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-console@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Adam Borowski <kilobyte@angband.pl>

Hasn't been ever used within historic (ie, git) times.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 include/linux/console_struct.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/console_struct.h b/include/linux/console_struct.h
index 2c8d3239899b..fea64f2692a0 100644
--- a/include/linux/console_struct.h
+++ b/include/linux/console_struct.h
@@ -17,7 +17,6 @@
 #include <linux/vt.h>
 #include <linux/workqueue.h>
 
-struct vt_struct;
 struct uni_pagedir;
 struct uni_screen;
 
@@ -150,7 +149,7 @@ struct vc {
 	struct vc_data *d;
 	struct work_struct SAK_work;
 
-	/* might add  scrmem, vt_struct, kbd  at some time,
+	/* might add  scrmem, kbd  at some time,
 	   to have everything in one place - the disadvantage
 	   would be that vc_cons etc can no longer be static */
 };
-- 
2.18.0

