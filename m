From: =?UTF-8?B?6YOt5pmT5bOw?= <lamuguo@gmail.com>
Subject: Different scan code behavior in X and console
Date: Sat, 14 Jan 2012 16:52:58 -0800
Message-ID: <CANupJ5S5C1Wp-LnzF4LCVQaSb_ye5sBbENFS0Ut_UqfMwhFTFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=e89a8f3ba119e0bbf604b686847a
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=0g++r6oY/YFcIiizS+O/HxquLzPCM+EHtzEcuQxmhiA=;
        b=MnNf6YvMXxNz/su452KhY4h0soJYyh+YLgSL7ibnroZCQK3sc91w2L8kI88NZuhAE3
         83RAXlTHLjnfDR5QzU07DB2gHvrj9lki7aKWPLMPOcoMgqVhGolEhph0mhPkuxdqPJQB
         2YtrAx2HgVbTZ1aTao9MWrptF4MPQJpw/7YvM=
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
To: linux-console@vger.kernel.org

--e89a8f3ba119e0bbf604b686847a
Content-Type: text/plain; charset=ISO-8859-1

Hi there,

Sorry to bother. Not sure whether it is correct to post this question
to the mail list, but can't find a suitable linux console user mail
list for discussing this. If you have good mail list to suggest,
please help me to forward. Thanks!

The question is: I tried to make my emacs have the same key response
on both X and console (ssh pts). However, I can't find scan code for
"Ctrl-PageDown" in console mode. I attached the code for testing the
scan code, and below is different behavior in X and console:

============= X ===========
Press a Key 338   // Just type <PageDown>
Press a Key 27
Press a Key 91
Press a Key 54
Press a Key 59
Press a Key 53
Press a Key 126  // 6-chars for <Ctrl-PageDown>
============ Console =========
Press a Key 338  // Same for <PageDown>
Press a Key         // No response for <Ctrl-PageDown>

Any idea on this? Greatly appreciate your replies, your suggested
readings, and so on!

Best Regards,
Lamu Guo

=============Below is text of the code, for easily reading to skip
attachment=================

#include <stdlib.h>
#include <ctype.h>
#include <curses.h>

int main(void)
{
  WINDOW *_window = initscr();
  int _rows;
  int _cols;

  cbreak();

  /* Accept all keys */
  keypad(_window, true);

  /* Don't echo things that are typed */
  noecho();

  /* Get the screen dimensions */
  getmaxyx(_window, _rows, _cols);

  /* Don't display cursor */
  curs_set(0);

  for (;;)
  {
    printw("Press a Key ");
    refresh();
    int key = wgetch(_window);
    printw("%d \n", key);
  }

  endwin();

  return 0;
}

--e89a8f3ba119e0bbf604b686847a
Content-Type: text/x-csrc; charset=US-ASCII; name="curin2.c"
Content-Disposition: attachment; filename="curin2.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gxfcnt6k0

I2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8Y3R5cGUuaD4KI2luY2x1ZGUgPGN1cnNlcy5o
PgoKaW50IG1haW4odm9pZCkKewogIFdJTkRPVyAqX3dpbmRvdyA9IGluaXRzY3IoKTsKICBpbnQg
X3Jvd3M7CiAgaW50IF9jb2xzOwoKICBjYnJlYWsoKTsKCiAgLyogQWNjZXB0IGFsbCBrZXlzICov
CiAga2V5cGFkKF93aW5kb3csIHRydWUpOwoKICAvKiBEb24ndCBlY2hvIHRoaW5ncyB0aGF0IGFy
ZSB0eXBlZCAqLwogIG5vZWNobygpOwoKICAvKiBHZXQgdGhlIHNjcmVlbiBkaW1lbnNpb25zICov
CiAgZ2V0bWF4eXgoX3dpbmRvdywgX3Jvd3MsIF9jb2xzKTsKCiAgLyogRG9uJ3QgZGlzcGxheSBj
dXJzb3IgKi8KICBjdXJzX3NldCgwKTsKCiAgZm9yICg7OykKICB7CiAgICBwcmludHcoIlByZXNz
IGEgS2V5ICIpOwogICAgcmVmcmVzaCgpOwogICAgaW50IGtleSA9IHdnZXRjaChfd2luZG93KTsK
ICAgIHByaW50dygiJWQgXG4iLCBrZXkpOwogIH0KCiAgZW5kd2luKCk7CgogIHJldHVybiAwOwp9
Cg==
--e89a8f3ba119e0bbf604b686847a--
