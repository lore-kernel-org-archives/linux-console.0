From: <cutaway@bellsouth.net>
Subject: QUESTION:  kernel/drivers/char/console_macros.h
Date: Tue, 17 May 2005 06:00:11 -0400
Message-ID: <000b01c55ac7$3a1e8e80$2800000a@pc365dualp2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org

#define vc_state ....

This particular macro happens to be the SAME NAME as the vconsole data
structure member it references.

This seems quite unhandy if you try to reference the vc_state member using a
pointer to a vconsole data structure like so:

struct vc_data *vcdp = vc_cons[currcons].d;

vcdp->vc_state = whatever...;

The macro will expand (because of course it has the same name and the
preprocessor doesn't know the difference) when what you really wanted was
the structure member.  Cryptic syntax errors result.

So... HERE IS THE QUESTION: was there some compelling reason this particular
macro should be this way, (rather than #define state ...) or was it just
some ages old typo that was never noticed?

Of course, if all you use is the macros to reference vconsole data, the
issue never surfaces - but the resultant code quality suffers when some
function has several macros in it that could benefit from caching a pointer
to the current vcon structure and using that.

