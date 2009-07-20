From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: inotify on /dev/vcsa?
Date: Tue, 21 Jul 2009 01:55:14 +0200
Message-ID: <20090720235514.GT5397@const.famille.thibault.fr>
References: <20090720234618.GR5397@const.famille.thibault.fr> <20090721005108.574d5145@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090721005108.574d5145@lxorguk.ukuu.org.uk>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Alan Cox, le Tue 21 Jul 2009 00:51:08 +0100, a =E9crit :
> I would have thought poll() would have been cleaner. Or perhaps exten=
ding
> the VT event interface I added to the vt drivers in the current patch=
es
> pending for 2.6.32 - poll support would probably be a bit lighter as
> you'd just need to do something like
>=20
> 	event_count++;
> 	wake_up(&vcsa_event_wait);
>=20
> and check for a count change

Sounds like a good plan indeed.

Samuel
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
