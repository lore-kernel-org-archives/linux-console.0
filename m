From: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: setsid2(sid) proposal - assign current process to existing
 session
Date: Fri, 14 Aug 2020 13:33:36 +0200
Message-ID: <20200814113336.v45vdkos25m4utjc@wittgenstein>
References: <ecede52e-1f5d-8357-37f8-948456688862@doubly.so>
Mime-Version: 1.0
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ecede52e-1f5d-8357-37f8-948456688862-QazNQ5YByqdhl2p70BpVqQ@public.gmane.org>
Sender: linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devin Bayer <dev-QazNQ5YByqdhl2p70BpVqQ@public.gmane.org>
Cc: linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-console-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Aug 14, 2020 at 01:09:54PM +0200, Devin Bayer wrote:
> Hello,

Hey Devin,

> 
> I'm wondering about the possibility of introducing a new system call for
> moving a process to an existing session. If `sid` is an existing session
> with the same owner as the current process, one could call:
> 
> 	setsid2(sid)
> 
> This would have similar behavior to setpgid(), and would probably
> effectively call setpgid() internally too.

Honestly, there are already so many transitioning rules between process
groups and session groups (like that a process group leader can't create
new sessions and subsequently also shouldn't be able to move between
sessions and if you move between process groups they both must be in the
same session) I'm really no keen on introducing yet more transitioning
rules.

Also, session ids and process group ids are racy enough as it is and
introduce edge-cases that are annoying in userspace especially when
signaling process groups. I'm not a fan of introducing even more
racyness.

> 
> The use case is for something like `flatpak-spawn --host`, which allows you
> to launch a program in an outer namespace from an inner namespace. It
> behaves as a child of the caller but is actually a child of an external
> daemon.
> 
> It works by connecting stdin/out/err to those of the caller, for example a
> PTY for xterm running in the inner namespace. This works fine for
> non-interactive programs, but it's impossible for the spawned task to share
> the controlling TTY with the shell running in xterm.
> 
> I can't see where the problems are, though I'm surprised such functionally
> doesn't yet exist. Because it deals with such basic concepts, I'm wondering
> if such a change will even be considered.
> 
> There is a workaround; one can create a new PTY on the host and copy the I/O
> streams manually. Not ideal, but okay.

The solution you mentioned is basically the standard way of dealing with
similar problems in every container runtime and in various other places
in userspace and given that it's not that hard to implement this seems
fine.

Thanks!
Christian
