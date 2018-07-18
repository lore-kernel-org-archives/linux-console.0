From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 0/3] follow-up to the unicode vt console series
Date: Tue, 17 Jul 2018 21:02:39 -0400
Message-ID: <20180718010242.5254-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id; s=sasl; bh=Rbka8ryH74ZZL1F+agpjxcFWEp8
        =; b=Qut8+Nmq4iD6BsVh5LU9uNR7+f5sgKePmjimk3L4J1SMYB0yYuW88xyidwY
        6ZZWXcYuu+l+A1EjgfyM8QL3ugOO/J8gWB/+CX8pSMOq7s8RVen/8Yez9323ikyx
        rITm0nteP6zU+feUARMRQI6wVhX0pS1xyYau2yL/TYB35GZc=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Adam Borowski <kilobyte@angband.pl>, Dave Mielke <Dave@mielke.cc>, Samuel Thibault <samuel.thibault@ens-lyon.org>, linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

This is a follow-up series with 3 patches in response to the following
messages respectively:

http://lkml.kernel.org/r/20180628123803.GA22045@kroah.com

http://lkml.kernel.org/r/CAGXu5j+KLvJ-n_QRrfq15E8iO_rqfpp+K7PDAZHZMHcemy9y7g@mail.gmail.com

http://lkml.kernel.org/r/CAMuHMdUmC+uiKTEMotB83A86E1wEYrNF2qPf3kDACaW27D_NbA@mail.gmail.com

Those patches were tested on top of previous patches already in tty-next.
Please include in tty-next before next merge window.

Patch #1 was posted before. Only difference is that it now uses rate
limited printing.

Patch #2 is new, however it has been tested with the validation code
provided by patch #1. This also fixes a security issue.

Patch #3 is new and trivial.

Diffstat:

 Documentation/admin-guide/devices.txt | 16 +++++---
 drivers/tty/vt/vt.c                   | 57 +++++++++++++++++++++++++----
 2 files changed, 59 insertions(+), 14 deletions(-)

