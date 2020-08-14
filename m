From: Devin Bayer <dev-QazNQ5YByqdhl2p70BpVqQ@public.gmane.org>
Subject: setsid2(sid) proposal - assign current process to existing session
Date: Fri, 14 Aug 2020 13:09:54 +0200
Message-ID: <ecede52e-1f5d-8357-37f8-948456688862@doubly.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
        t=1597403396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=URVnzukKS+P2nWYrtw5dp7rwGBO9XtEHJXqL8SP6zO8=;
        b=FKJp/2f7zJR5l/5hiMOgulaPaejhBMwSGqCGG3tB/vy9BI7AaTwJCLW/G7iq5trV1RbL7+
        SiDgA2cy2JUPu4tE7UNG5jjCenGCxflGrIg+4HTWPGI+BcfpWN/mbDBAhSwMJk02wUygoU
        dVfoI4CU/keOwYWY1tDlVEVSCtdD8PE2IghtWo8W8+HxH7beNIlz556k4j3GeOspP1ecjR
        tqKixfrfSmApcozVqeBhBLtxha3RNtJAeCp3uqUyChI+t36Vz5HDSXlDPXBUZGofyLD2aH
        0FjbCJoRhwTCm/CDP3Gtk0iIrsmjYHpaJqDZr9aRbZIRfmpQDCkma9qwOklnLA==
Content-Language: en-US
Sender: linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-console-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

I'm wondering about the possibility of introducing a new system call for 
moving a process to an existing session. If `sid` is an existing session 
with the same owner as the current process, one could call:

	setsid2(sid)

This would have similar behavior to setpgid(), and would probably 
effectively call setpgid() internally too.

The use case is for something like `flatpak-spawn --host`, which allows 
you to launch a program in an outer namespace from an inner namespace. 
It behaves as a child of the caller but is actually a child of an 
external daemon.

It works by connecting stdin/out/err to those of the caller, for example 
a PTY for xterm running in the inner namespace. This works fine for 
non-interactive programs, but it's impossible for the spawned task to 
share the controlling TTY with the shell running in xterm.

I can't see where the problems are, though I'm surprised such 
functionally doesn't yet exist. Because it deals with such basic 
concepts, I'm wondering if such a change will even be considered.

There is a workaround; one can create a new PTY on the host and copy the 
I/O streams manually. Not ideal, but okay.

Any comments welcome.

Cheers
~ dev
