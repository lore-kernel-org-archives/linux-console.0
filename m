From: Timur Tabi <timur@freescale.com>
Subject: Question about 'device' field of struct console
Date: Mon, 25 Oct 2010 13:23:30 -0500
Message-ID: <4CC5CB22.3080807@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org

I'm trying to write a console and TTY driver that's not based on a serial port,
and I'm confused by the "device' field of 'struct console'.  I found this text
in http://www.linux.it/~rubini/docs/sercons/sercons.html:

"The purpose of the UDP console device is sending kernel messages through the
network. Unlike serial or vt consoles, which are associated to real tty devices,
this console has no tty associated, and that's why the device function is not
defined.

In a real console device, the device function is used to return the device
number associated to this console as a kdev_t value. Only one serial port can be
elected as a console, for example, and the device function defined by the serial
driver is used to tell the caller which one is. The function is used in
drivers/char/tty_io.c to redirect any access to /dev/console. Thus, a process
that opens /dev/console will actually open a different device, provided at least
one of the active console drivers has a device function and the device returned
is known to the tty layer. "

I don't really understand this.  What is a "real tty device"?  What am I missing
if I don't have a real TTY device?

Using other drivers as an example, I can fill the 'device' field with a pointer
to this function ehv_bc_console_device():

static struct tty_driver *ehv_bc_driver;

static struct tty_driver *ehv_bc_console_device(struct console *c, int *index)
{
	*index = c->index;

	return ehv_bc_driver;
}

This is what other drivers do, although I don't really understand what it's
doing.  However, I can't figure out how to initialize ehv_bc_driver.  I can
allocate one like this:

	ehv_bc_driver = alloc_tty_driver(1);
	if (!ehv_bc_driver) {
		printk(KERN_INFO "%s:%u\n", __func__, __LINE__);
		return -ENOMEM;
	}

But the problem is that the subsequent call to tty_register_driver() causes a
kernel panic in kobj_map().  I *think* this is because I'm calling
tty_register_driver() inside my console_init() function, which is too early.  If
so, then I have a catch-22.

Can anyone shed some light on this?  There doesn't seem to be any good
documentation on writing a console *and* a TTY driver.

-- 
Timur Tabi
Linux kernel developer at Freescale

