From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 3/3] vt: add /dev/vcsu* to devices.txt
Date: Tue, 17 Jul 2018 21:02:42 -0400
Message-ID: <20180718010242.5254-4-nicolas.pitre@linaro.org>
References: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=msGo
        G7BxDRXFQvdEbTnebXwVP5E=; b=hk69AUoom8AvtyRNcbVhrmzdw+THwpg1tiZq
        iPdfrPHfdTQJ/Ma1q4Dap73ukiF12ALg0gjQFtm7UidQKTGMiPBtVMYdl8KbNv4+
        jwBDJLjJ90QAS2RKHA62qzNzoOLQk9OclpJQsRPtLiUwYwFuSYsImMrcDVdzCQ6D
        aatDXMo=
In-Reply-To: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Adam Borowski <kilobyte@angband.pl>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Also mention that the traditional devices provide glyph values whereas
/dev/vcsu* is unicode based.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 Documentation/admin-guide/devices.txt | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 4ec843123c..1649117e60 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -173,14 +173,18 @@
 		they are redirected through the parport multiplex layer.
 
    7 char	Virtual console capture devices
-		  0 = /dev/vcs		Current vc text contents
-		  1 = /dev/vcs1		tty1 text contents
+		  0 = /dev/vcs		Current vc text (glyph) contents
+		  1 = /dev/vcs1		tty1 text (glyph) contents
 		    ...
-		 63 = /dev/vcs63	tty63 text contents
-		128 = /dev/vcsa		Current vc text/attribute contents
-		129 = /dev/vcsa1	tty1 text/attribute contents
+		 63 = /dev/vcs63	tty63 text (glyph) contents
+		 64 = /dev/vcsu		Current vc text (unicode) contents
+		65 = /dev/vcsu1		tty1 text (unicode) contents
 		    ...
-		191 = /dev/vcsa63	tty63 text/attribute contents
+		127 = /dev/vcsu63	tty63 text (unicode) contents
+		128 = /dev/vcsa		Current vc text/attribute (glyph) contents
+		129 = /dev/vcsa1	tty1 text/attribute (glyph) contents
+		    ...
+		191 = /dev/vcsa63	tty63 text/attribute (glyph) contents
 
 		NOTE: These devices permit both read and write access.
 
-- 
2.17.1

