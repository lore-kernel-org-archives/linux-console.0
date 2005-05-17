From: <cutaway@bellsouth.net>
Subject: Re: VT102 emulation code observations -- vt.c  (in older kernels console.c)
Date: Tue, 17 May 2005 03:13:16 -0400
Message-ID: <000801c55ab0$0421e000$2800000a@pc365dualp2>
References: <00b301c55a9a$ce7e6320$2800000a@pc365dualp2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org

CORRECTION: There's a typo in original post.

> #define CURRENT_VCON_DATA_PTR &vc_cons[currcons].d

should be:

#define CURRENT_VCON_DATA_PTR vc_cons[currcons].d

"d" is a pointer to the vcon structure, not the structure itself.  

