From: crocket <crockabiscuit@gmail.com>
Subject: us.map from kbd maps Right Alt to AltGr and Shift+Tab to Alt+Tab.
Date: Sat, 1 Feb 2020 09:21:41 +0900
Message-ID: <CAL0=0H3WQBWjvFqukfb+S6M9C3eeiKkOGSxGwPCmfmH02XJO=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Udfi63YfCrtAr7scyz/PAaRY9UA5vKGyv2EMHZxkkNQ=;
        b=cXh3pk+YWZN+MREPZgAGgix9BRWXLbyJ5pSeZROjudlk/uXuAAOfGlHx7qOR2aBEzl
         mewZit+BTR8GlUPja8wWgz0AXR5MzGwVH8P3zeZRF9YepeIUlWcGLY+vY4nNUXA74iSb
         PP7OfnFS7R2Z2lbUklG0DajTD+Ujf3qEmbfwWlUSeac4DosmTgOL+mAHmiSCuNfMddpo
         CQ543HttDRlxqx3q2bRTXuSomDaa3oaItRq7KTON++ZGIvGX3u2PjGFX2fgaRz+yY9UO
         jzuOC2n2sEHGKk5PJXFRXPSFDX8nL9G0ZuIPFCBk//BYpCbiG5cg7MRZlcXCBtoS3NFZ
         V71g==
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org

* I have never seen a modern US layout keyboard that has AltGr at the
position of Right Alt. Also, using emacs ergonomically requires using
two alt keys. Sometimes, I use emacs on linux console.
* In us.map, Shift+Tab is mapped to Alt+Tab. I see no good reason to
map Shift+Tab to Alt+Tab unless the keymap was neglected after someone
tested it with an esoteric keyboard or in an esoteric environment.

For now, I use my own keymap that inherits us.map and
linux-with-two-alt-keys and maps shift+tab to shift+tab and alt+tab to
alt+tab.

I propose mapping Right Alt to Alt and Shift+Tab to Shift+Tab in
us.map or a modern variant of us.map.
