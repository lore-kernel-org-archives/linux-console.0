From: "Karthik Gopalakrishnan" <karthik.g.krishnan@gmail.com>
Subject: Re: MCA in console_init()
Date: Fri, 8 Dec 2006 03:24:40 +0530
Message-ID: <5e0a1fd80612071354jd1326f7rc8d111fcd753c471@mail.gmail.com>
References: <5e0a1fd80612071347u54f8e8d7lb53f5e933fb9e966@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <5e0a1fd80612071347u54f8e8d7lb53f5e933fb9e966@mail.gmail.com>
Content-Disposition: inline
Sender: linux-console-owner@vger.kernel.org
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-console@vger.kernel.org

Oops. Forgot to mention... This is on IA64. I am running v2.6.9.

On 12/8/06, Karthik Gopalakrishnan <karthik.g.krishnan@gmail.com> wrote:
> Hi Folks.
>
>     I am trying to debug an MCA that I hit during kernel bootup. I
> have isolated the problem to the while loop in the console_init()
> routine called as part of start_kernel(). The IIP obtained from the
> MCA Logs point to vgacon_startup(). I will be grateful if someone
> could tell me how execution lands up in vgacon_startup() from
> console_init() since I quite understand that part of code. Probably, a
> pointer to a suitable document will also do.
>
> Thanks & Regards,
> Karthik
>
