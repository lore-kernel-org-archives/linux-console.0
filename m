From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
Subject: AltGr leaks keypresses to VT on which X is running
Date: Wed, 26 Apr 2017 16:50:43 +0200
Message-ID: <20170426165043.6f33563c@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=PajSDClUKMPXU0ottbYBE/VEhxhWscKRg1kIM8ijPIo=;
        b=jS50m7xfqNcI34jIcWMDDg83fdeYr/nCJ1xjZizMm2c08fjJOpe9HWwrIq2PkePoxd
         l4yR1Y5VCM24TX7nUQSmE9H///lEFo1NrituEy4JfX/uoEHSoZi0ANuDWw0LmSaHPsBa
         HC4qOzoBS7O3srlbZFauoSID2aJmsd/WgZ78/KRw4grF6YzvVb9eOastwqRI4Qj1P0NS
         AbFlrrIAuNWB4gqKika3P6eViRUMHrHFAqs2fUbZGIY5ZEPS1v2UwCBYjTLsRy4zIY+d
         iu8YAoqS1AQdDZXFk6Ijr0cSqxraR5XFTCutSCMldg0jKNk6CGwh9fVh4kNmwdIgPHrD
         H3SA==
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-console@vger.kernel.org

Hi,

I recently observed this odd behavior:

I login as root on tty3 and run

loadkeys pl # like US QWERTY but AltGr changes a->=C4=85 c->=C4=87 etc.
echo        # only typed, not actually executed with ENTER

Now the last line shows the incomplete command:

$ echo=20

Then I login on tty1 and run

Xorg :0 vt3

which displays Xorg on vt3. Inside Xorg, while holding AltGr, I hit
every letter in order: qwerty...asdf...zxc..

Then I kill Xorg and switch to vt3. Now the last line shows:

$ echo =C4=99=C4=85=C5=9B=C5=82=C5=BC=C5=BA=C5=84

These are all AltGr-generated Polish letters _except_ =C3=B3 (AltGr+o).
No idea what's so special about =C3=B3. Pressing ENTER runs echo which
really prints this string.

Similar thing happens with German ('de') console layout. X layout seems
irrelevant.

It only happens if I first hold AltGr and then press a letter, not the
other way around.

Inside Xorg, all keys are processed correctly.

I'm not sure if it's a kernel bug, X bug or something "expected"?

Thanks,
Michal
