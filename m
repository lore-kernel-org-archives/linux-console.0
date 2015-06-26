From: Renaud Barbier <renaud.barbier@ge.com>
Subject: ttySx probing
Date: Fri, 26 Jun 2015 14:44:22 +0100
Message-ID: <558D5736.2080904@ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-console@vger.kernel.org

Hello,
I have a Freescale P1014 custom board with the UARTs connected as follo=
ws:
UART0 -> BMM (Board management device connected to sensors) ttyS0 11520=
0
bauds
UART1 -> Not used. Disable in the device tree.
UART2 -> Console. ttyS1 - 9600 bauds
UART3 -> Not used. ttyS2

I am using Linux 3.14
The bootargs specifices console=3DttyS1,9600n8
I have two issues:

When booting a few lines of garbage characters are printed when ttyS0 i=
s
probed.
serial=C2=AAr=C3=92=C3=92=C2=A2=C3=91=C3=A5M=C3=85=C3=91yS0 at MMIO 0xf=
fe04500 (irq =3D 42, base_baud =3D 20833333)
is a 165
=C3=91=C3=9155%=3D=C3=81=C3=A1=C3=A1=C3=81=C3=91=C3=9D=C3=81=C3=81=C3=91=
=C2=A1=C2=A5=C3=89=C3=85=C3=89=C3=B5=C3=91=C3=89=C2=B1=C3=B5=C2=B1
=C3=8D=C3=8D}=C2=BD=C2=B9=C3=8D=C3=8D=C2=BD=C2=B9=C3=8D=C3=8D=C2=BD=C2=B1=
m=C3=95=C3=95=C3=91=C2=B9=C2=B9 loaded
=C2=B15)=C2=BD=C2=BD=C3=91=C2=BD=C2=B9=C3=8D=C3=8D=C2=BD=C2=B1m=C3=95=C3=
=95=C3=8D=C3=8D
5)=C2=BD=C2=BD=C3=91=C3=91
=2E..
Later the system reached the prompt.

These type of character also appears when setting UART0 to  9600/115200
bauds in the boot loader or not programming the speed at  all.

This does not happen when  UART0 is disabled in the device tree.

I do not understand why Linux would attempt to use ttyS0 when the
console is specified as ttyS1. Is there a way to prevent this behaviour=
?


Next, if I do not program  a baud rate in UART0 from the boot loader an=
d
use for instance the command stty -F /dev/ttyS0. There is an interrupt
flood and Linux hangs. The same happen when using the tools accessing
the BMM. No character seems to be transmitted or received.
Note that I need to spent for time gathering data on this issue.


I am looking for a way to solve the first issue. I was thinking to get
ttyS1 (UART2) to be probed first and see whether that would prevent
these characters from being printed or any other possible solution to
test. Though, I am  not sure how this can be accomplished after looking
at boot argument controlling console access or changing the device tree=
=2E

I would appreciate any suggestions.

Cheers,
Renaud

--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
