From: =?ISO-8859-1?Q?S=E9bastien_Lefebvre?= <sebastien.lefebvre@free.fr>
Subject: Software switch from /dev/tty1 to /dev/tty2
Date: Mon, 23 Feb 2004 09:56:03 +0100
Sender: linux-console-owner@vger.kernel.org
Message-ID: <c1cf73$db4$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-console@vger.kernel.org

Hi !

Does anyone know how to switch from /dev/tty1 to /dev/tty2 with Bash ?
Here is my setup, this could give you other ideas for alternative=20
solutions :


I boot using a full screen framebuffer on /dev/tty1
The "active" console is /dev/tty2 (which receives the boot logs).
Then, using /etc/init.d, I launch a script (as I defined CONSOLE and=20
console to /dev/tty1 in lilo.conf, every output is still displayed on=20
/dev/tty2).

Then, I could either :

-Display a message on /dev/tty1 (this requires to clear the framebuffer=
,=20
how to do that ?)

or

-switch to console /dev/tty1 within my script.

Thanks  a lot for any idea,

S=E9bastien


-
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
