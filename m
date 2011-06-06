From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] [v2] drivers/misc: introduce Freescale hypervisor management driver
Date: Mon, 6 Jun 2011 21:48:56 +0200
Message-ID: <201106062148.57165.arnd@arndb.de>
References: <1306953337-15698-1-git-send-email-timur@freescale.com> <201106061753.10154.arnd@arndb.de> <20110606131516.69b9f361@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <20110606131516.69b9f361@schlenkerla.am.freescale.net>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Scott Wood <scottwood@freescale.com>
Cc: Timur Tabi <timur@freescale.com>, kumar.gala@freescale.com, linux-kernel@vger.kernel.org, akpm@kernel.org, linux-console@vger.kernel.org, greg@kroah.com, linuxppc-dev@lists.ozlabs.org

On Monday 06 June 2011 20:15:16 Scott Wood wrote:
> On Mon, 6 Jun 2011 17:53:09 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:

> > > > > You can't delete anything. 
> > > > 
> > > > rm, rmdir
> > > > 
> > > > > You can't create empty nodes.
> > > > 
> > > > mkdir
> > > 
> > > I know how to operate a filesystem.  You can't do these operations *on
> > > another guest's device tree through the hv interface*.
> > 
> > Why not?
> 
> Because the hypervisor does not support it.  It provides only getprop and
> setprop.  I think you took my "you can't do that" statements to be a
> statement about limitations of using a filesystem interfcae -- quite the
> opposite, I was saying the hv functionality is too limited to support a
> filesystem interface with normal semantics.

Ok, sorry for the confusion on my part. It makes a lot more sense now.

> > > And what would be the benefit of this major restructuring and added
> > > complexity?
> > 
> > I think it would be a slightly better abstraction, and the complexity
> > is not as big as you make it sound. I'm mainly countering your statement
> > that it would be a bad interface or that would not possible to do.
> > 
> > I'm not that opposed to having an ioctl interface for your hypervisor
> > interface, but I am opposed to making design choices based on
> > a bad representations of facts or not having considered the options
> > that other people suggest.
> 
> I don't really see how a filesystem is a better abstraction for a wrapper
> around a procedural interface.  A somewhat better argument is that ioctls
> are a pain, and Linux doesn't have a better way to expose a procedural
> interface, that doesn't require a wrapper program -- though as the wrapper
> already exists, and the fs interface would probably be sufficiently awkward
> that people would still use a wrapper, that doesn't buy us too much either.
> 
> This is not being proposed as any sort of standard kernel API, just a way
> for userspace to get access to implementation-specific hcalls.
> Implementation-specific backdoor is practically the definition of ioctl. :-)
> 
> I would be interested to see a concrete proposal for what this would look
> like as a filesystem, though, based on the actual operations that are
> available.  How would you deal with getting all the parameters in,
> performing the operation, and getting the results back?  What about when
> multiple processes are doing this at the same time?  What would the memcpy
> hcall look like?

In fs/libfs.c, we have support for "simple transaction files", where you
write input parameters into a file and then read it back to get the
results. They are very rarely used, but can serve as a way to replace ioctls
with file operations where that makes sense.

For an inter-partition memcpy, a better interface might be a pipe
representation: You have a namespace that is shared between two
partitions, so each side can create directory entries with arbitrary
names in one of the subdirectories of the file system. Then you can
open the file for reading on one side and writing on the other side
and when both sides have started the respective operation, the hypervisor
will copy data. The possible ways to use that functionality are countless.

Similarly, you can mmap a file to get inter-partition shared memory.

	Arnd
