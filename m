From: Daniel Xu <dxu@dxuuu.xyz>
Subject: [PATCH] console: Update to reflect new default value
Date: Mon, 18 Sep 2017 22:21:25 -0700
Message-ID: <20170919052125.12396-1-dxu@dxuuu.xyz>
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
        :date:from:message-id:subject:to:x-me-sender:x-me-sender
        :x-sasl-enc:x-sasl-enc; s=fm1; bh=xwNqtmA49rQCrxnEeFW9cxzT+2797K
        +vOO/nyQd2Fek=; b=B6dCko7pG4Xeoogdcu4O+PCo/CFAlrCdXeFtb7HSkVfBxT
        lLgKR0eymn+/C4whYDVYrhp76IcdnX7AT7TtQY1xvpnSH3JnIzCbcMlrHIwhanED
        5iG24U9oNBuk8UHb/fZSX70lsXW5GhUbMEpab7h0bGKvOH7TIvjs340jj/c5ymRW
        0WY3R3bcwHm32v4Mx+2aotp659hZ+LoEUC5nN0oOViz8JFq1YFG1xdOvKkXRtsQ5
        Zptz6ttVhB+rcBQhzJNIaSM8RhDFh7iMZdrXTc/DrHkIT4rOWHcNd3ErOkTBNV2f
        mHmTcymap2h8l+ys2kCPSPOhLIjF7BWzVWddgzrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:message-id:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=xwNqtm
        A49rQCrxnEeFW9cxzT+2797K+vOO/nyQd2Fek=; b=k8FHTNOZg+jh2XwtmsDYCs
        vNc8BRQvHhKE5kgSgHrHUzj2lItL0eeHoMlAVxodi/3ckuodrIiNNJCBSLXHZUvb
        zMrxsNyX09Bzwm+RmjfFpkeMBFch4cBcKpLMQ9QCXnfIElVN+boNr6VxrCMuNSoi
        h5vRBj1QRfl+bvIv4SsS6AYjntBPnGfW3yCizLI3lEi0PgaDnunf82pQu9K81zR3
        nWfsTeWxQGhz8f0JfukUKkZNSo87Rn2U7d1dE4OdLeP8TLdetH6iU93wxhN9tgWr
        3u32f9vvSZPjfMd9fMlU+VtYdqY1StDNFFOj8n6Yc7ZsA+1dHzsnenP7YP4tMBYg
        ==
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-console@vger.kernel.org, tim.gardner@canonical.com, ManDay@openmail.cc, Daniel Xu <dxu@dxuuu.xyz>

The default value was changed from 10 minutes to disabled in commit
a4199f5eb8096d6.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9c171ce4190..01e336efd7dd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -641,8 +641,8 @@
 		For now, only VisioBraille is supported.
 
 	consoleblank=	[KNL] The console blank (screen saver) timeout in
-			seconds. Defaults to 10*60 = 10mins. A value of 0
-			disables the blank timer.
+			seconds. A value of 0 disables the blank timer.
+                       Defaults to 0.
 
 	coredump_filter=
 			[KNL] Change the default value for
-- 
2.14.1

