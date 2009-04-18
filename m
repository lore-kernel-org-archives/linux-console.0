From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [console] CSI (128+27) vs BIG5 (and possibly others)
Date: Sat, 18 Apr 2009 23:06:38 +0200
Message-ID: <20090418210638.GU21409@const>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

Hello,

A chinese user reported that some characters don't show up fine on
its console.  This happens to be because character 128+27 is handled
specially by the linux Console.  I believe the same issues can happen
with other characters sets.  Since linux' terminfo makes applications
use \E[ anyway, would it be ok to add an option to disable the 128+27
handling?

Samuel
