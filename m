From: "BRAGA, Bruno" <bruno.braga@gmail.com>
Subject: Updates on "mv", "cp" commands
Date: Sun, 1 Nov 2009 09:30:21 +0900
Message-ID: <86ca47940910311730ta75d2f3p56c3e65699c94696@mail.gmail.com>
References: <86ca47940910310550s87a6140s377a3d752979037@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:content-type;
        bh=WpkV2t2ZIihBFEUu1hOLTyRgAe30qrQrNvrTu0e5vc4=;
        b=KqBn/8UBVW9q91fPnO6BgMMX9kBc89xePT3TV9VqOOp9O6v1vqiB0TRcoaChATdls3
         rZ08unyiO7UI/VbekXGqgcR3QNkUxyGoAhIX0x8AX0We+iP5wX1kO3pY2RSS13U7TFyc
         EN7oQgLWuv5wGFesDDYYeuOhITccYBHLEYcdo=
In-Reply-To: <86ca47940910310550s87a6140s377a3d752979037@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org

Hi,

I don't know if that's the place to post this question, but I am sure
someone here will be able to give me hints on how to proceed.

I would like to propose and patch improvements on the "mv" (move) and
"cp" (copy) commands, by adding options for progress information.

The idea is that any GUI actions already do it graphically, and other
CLI applications, such as "rsync", have this as an extended option
"--progress". This is handy for large files processing, for instance.

I looked for the code in the kernel source but I did not find any. I
could find some sources on the GNU OS, but I am not sure if that's the
right place (probably not).

Can anyone give me a little help? Maybe this is even an old idea that
was discarded because of performance reasons, I don't know..

Thanks in advance,

Bruno
