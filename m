From: jb999@gmx.de
Subject: Half-bright (dim) and underline color
Date: Fri, 3 Jul 2020 19:44:59 +0200
Message-ID: <trinity-b2827e7b-d9c3-4737-b22c-39ce0985c6a3-1593798299489@3c-app-gmx-bs32>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1593798299;
        bh=V0998wtMFBoqgTjD95JZoj5109iymIr0CNd1BYoMgvE=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=QUyhv5AaMjBWG1xlxcyu+1trTePqxk/JmtoHWsA/J/FyilbMfrO/UeujtEcHPKX6k
         KrzhUsV7mumWBqK7YLSZTtj3NvG9y5AtR32oaOUzXSRImqg6xuixhtyl0G/o6nuEVC
         FHQX7iSoU/8ag/x4yTsedw+1+fr3vUPFzT174p7w=
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org

The linux consoles on two machines behave differently.

On machine #1 I can't set the colors independently. Both colors are the same and when changing one of them, the other changes, too.

On machine #2 both colors are independent.

Since machine #1 has an older kernel than #2, was there a kernel change sometime?

Both machines use fbcon (inteldrmfb).
