From: Samuel Thibault <Samuel.Thibault@ens-lyon.fr>
Subject: Braille devices can't scrollback console
Date: Thu, 27 Mar 2003 11:30:53 +0100
Sender: linux-console-owner@vger.kernel.org
Message-ID: <20030327103053.GA974@bouh.residence.ens-lyon.fr>
Reply-To: Samuel Thibault <samuel.thibault@fnac.net>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dave@mielke.cc, shindere@ens-lyon.fr

Hello,

There is no way for a braille device driven by brltty (userland root-owned
daemon) to scrollback the virtual console, the only way is to use the pc
keyboard. A very simple TIOCLINUX ioctl meets this need (tested):

diff -urN linux/drivers/char/console.c linux-scrollioctl/drivers/char/console.c
--- linux/drivers/char/console.c	2003-03-27 10:55:43.000000000 +0100
+++ linux-scrollioctl/drivers/char/console.c	2003-03-27 11:04:31.000000000 +0100
@@ -2262,6 +2262,17 @@
 		case 12:	/* get fg_console */
 			ret = fg_console;
 			break;
+		case 13:	/* scroll console */
+			{
+				int lines;
+				if (get_user(lines, (char *)arg+1)) {
+					ret = -EFAULT;
+				} else {
+					scrollfront(lines);
+					ret = 0;
+				}
+			}
+			break;
 		default:
 			ret = -EINVAL;
 			break;

Regards,
Samuel Thibault
