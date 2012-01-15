From: =?UTF-8?B?6YOt5pmT5bOw?= <lamuguo@gmail.com>
Subject: Re: Different scan code behavior in X and console
Date: Sat, 14 Jan 2012 23:49:31 -0800
Message-ID: <CANupJ5SxawoQCFZ2suXjG8UPKUVcQt9QGf+ELQhbs5ps22mOxw@mail.gmail.com>
References: <CANupJ5S5C1Wp-LnzF4LCVQaSb_ye5sBbENFS0Ut_UqfMwhFTFg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=2zdMMB82stSObOL2r5BGvQkYm/3tVAVIhcs2MYmw1FM=;
        b=DUIPwYHQfynTJXyBL2sd45eGbo+B8jd2X+3Cm22SJPjEHe4az63Rm/aZMKJ6ijELR7
         L8ZYzzWKaRGfyf/KwDolkISx1eumhKkobdGGdGIBF+lZWNup6p25lrtRDUuMNdJ2U7Ld
         /qGYP2Wys4Ns0bMkEFpJ+VQwHmzyheTgwQ80E=
In-Reply-To: <CANupJ5S5C1Wp-LnzF4LCVQaSb_ye5sBbENFS0Ut_UqfMwhFTFg@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-console@vger.kernel.org

OK, I got it. Ctrl-PageDown is remapped by Mac and Windows, it works in=
 Linux.

Please skip this problem, it doesn't related to Linux.

On Sat, Jan 14, 2012 at 4:52 PM, =E9=83=AD=E6=99=93=E5=B3=B0 <lamuguo@g=
mail.com> wrote:
> Hi there,
>
> Sorry to bother. Not sure whether it is correct to post this question
> to the mail list, but can't find a suitable linux console user mail
> list for discussing this. If you have good mail list to suggest,
> please help me to forward. Thanks!
>
> The question is: I tried to make my emacs have the same key response
> on both X and console (ssh pts). However, I can't find scan code for
> "Ctrl-PageDown" in console mode. I attached the code for testing the
> scan code, and below is different behavior in X and console:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D X =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> Press a Key 338 =C2=A0 // Just type <PageDown>
> Press a Key 27
> Press a Key 91
> Press a Key 54
> Press a Key 59
> Press a Key 53
> Press a Key 126 =C2=A0// 6-chars for <Ctrl-PageDown>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Console =3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> Press a Key 338 =C2=A0// Same for <PageDown>
> Press a Key =C2=A0 =C2=A0 =C2=A0 =C2=A0 // No response for <Ctrl-Page=
Down>
>
> Any idea on this? Greatly appreciate your replies, your suggested
> readings, and so on!
>
> Best Regards,
> Lamu Guo
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DBelow is text of the code, for=
 easily reading to skip
> attachment=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> #include <stdlib.h>
> #include <ctype.h>
> #include <curses.h>
>
> int main(void)
> {
> =C2=A0WINDOW *_window =3D initscr();
> =C2=A0int _rows;
> =C2=A0int _cols;
>
> =C2=A0cbreak();
>
> =C2=A0/* Accept all keys */
> =C2=A0keypad(_window, true);
>
> =C2=A0/* Don't echo things that are typed */
> =C2=A0noecho();
>
> =C2=A0/* Get the screen dimensions */
> =C2=A0getmaxyx(_window, _rows, _cols);
>
> =C2=A0/* Don't display cursor */
> =C2=A0curs_set(0);
>
> =C2=A0for (;;)
> =C2=A0{
> =C2=A0 =C2=A0printw("Press a Key ");
> =C2=A0 =C2=A0refresh();
> =C2=A0 =C2=A0int key =3D wgetch(_window);
> =C2=A0 =C2=A0printw("%d \n", key);
> =C2=A0}
>
> =C2=A0endwin();
>
> =C2=A0return 0;
> }
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
