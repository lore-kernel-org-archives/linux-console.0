From: "BRAGA, Bruno" <bruno.braga@gmail.com>
Subject: Updates on "mv", "cp" commands
Date: Mon, 2 Nov 2009 16:39:50 +0900
Message-ID: <86ca47940911012339q1b74231bm37de37c64d4fbd82@mail.gmail.com>
References: <86ca47940910310550s87a6140s377a3d752979037@mail.gmail.com> 
	<86ca47940910311730ta75d2f3p56c3e65699c94696@mail.gmail.com> 
	<87y6mq64wn.fsf@erwin.mina86.com> <86ca47940911010347v235b0642q140e50489c7c8259@mail.gmail.com> 
	<20091102052640.GA4073@bio05.biowulf.net> <86ca47940911012308m391bada5n4e62a089e427812b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=JM64FIChdhtYw/8+U9fGx4F3Smlg06fJRCvtw0Ugtss=;
        b=UYrVSJsC4Kp3jaF+VpDbWytvIRVmIjM+brmDdS4Ahvi1SkRSjN2OwKrrSBAn+P3O4p
         aGumLi99g1PN1h0FxPdX32R3Gv0yQpe5D2EUfMwax54nCyIAlCMts2F+V/nUIkTIyDMc
         VPEUW/mzwuUOGLgtUhJgFOrUVmNUr2A9JM1os=
In-Reply-To: <86ca47940911012308m391bada5n4e62a089e427812b@mail.gmail.com>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-console@vger.kernel.org

Hi Renato,

thanks for the feedback.

In deed, I found some solutions such as wrapper scripts (the simplest
I saw using pv), and the aliases using rsync. For now, I will just
stick with the rsync aliases for simplicity.

pv solution:
pv big_file.tgz > /some_dir/sub_dir/big_file.tgz

aliases solution: (place on ~/.bashrc)
alias rscp=3D=E2=80=99rsync -aP =E2=80=93no-whole-file =E2=80=93inplace=
=E2=80=99
alias rsmv=3D=E2=80=99rscp =E2=80=93remove-source-files=E2=80=99

strace solution:

#!/bin/sh
cp_p()
{
   strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \

      | awk '{
        count +=3D $NF
            if (count % 10 =3D=3D 0) {
               percent =3D count / total_size * 100

               printf "%3d%% [", percent
               for (i=3D0;i<=3Dpercent;i++)
                  printf "=3D"
               printf ">"

               for (i=3Dpercent;i<100;i++)
                  printf " "
               printf "]\r"
            }
         }
         END { print "" }' total_size=3D$(stat -c '%s' "${1}") count=3D=
0
}

sources:
http://www.debianadmin.com/pv-pipe-viewer-shell-pipeline-element-to-met=
er-data-passing-through.html
http://chris-lamb.co.uk/2008/01/24/can-you-get-cp-to-give-a-progress-ba=
r-like-wget/

I placed this question under the GNU Coreutils mailing list, and got
lots of feedback too.

The discussion seems to be long, and getting kinda philosophic as
well. Let's see where this goes.
Here is another thread (old one) talking more about this:
https://bugzilla.redhat.com/show_bug.cgi?id=3D237553

thank you all for the help.

Bruno

On Mon, Nov 2, 2009 at 2:26 PM, Renato Callado Borges
<renato.oferenda@gmail.com> wrote:
>
> Hi Bruno!
>
> Wouldn't you prefer to build something on top of cp and mv, like a wr=
apper script? I did a sketch for such a wrapper for cp, tell me what yo=
u think.
>
> #!/bin/bash
>
> if [ ! -n "$2" ]; then
> =C2=A0 =C2=A0echo "Usage: $0 input_file output_file"
> fi
>
> LS_ALIAS=3D`alias | grep "ls=3D'" | cut -d "'" -f 2`
> if [ -n "$LS_ALIAS" ]; then
> =C2=A0 =C2=A0unalias ls
> fi
>
> SIZE1=3D`ls -l "$1" | cut -d " " -f 5`
> cp "$1" "$2" &
> sleep 1
> echo -n "Copying: $1 -> $2 ["
> tput sc
> SIZE2=3D`ls -l "$2" | cut -d " " -f 5`
> while [ $SIZE2 -lt $SIZE1 ]; do
> =C2=A0 =C2=A0PERCENTAGE=3D`echo "a=3D$SIZE2/$SIZE1;100*a" | bc -l | c=
ut -d "." -f 1`
> =C2=A0 =C2=A0tput rc
> =C2=A0 =C2=A0echo -n "$PERCENTAGE%]"
> =C2=A0 =C2=A0sleep 1
> =C2=A0 =C2=A0SIZE2=3D`ls -l $2 | cut -d " " -f 5`
> done
> echo " Done."
>
> if [ -n "$LS_ALIAS" ]; then
> =C2=A0 =C2=A0alias ls=3D"$LS_ALIAS"
> fi
>
> Be careful: this script might fail if cp has to overwrite files, and =
there are race conditions (that's the reason for the sleep outside the =
while loop).
>
> Cheers,
> Renato.
>
> On Sun, Nov 01, 2009 at 08:47:21PM +0900, BRAGA, Bruno wrote:
> > Thanks for the reply Michal.
> >
> > I will look into that (I found the source in GNU's source code, but=
 I
> > am still kinda lost on to whom should I ask stuff, lol). i will let
> > you know if/when I get things done with the team there.
> >
> > Cheers,
> >
> > Braga, Bruno
> >
> >
> >
> > 2009/11/1 Michal Nazarewicz <mina86@tlen.pl>:
> > > "BRAGA, Bruno" <bruno.braga@gmail.com> writes:
> > >> I don't know if that's the place to post this question, but I am=
 sure
> > >> someone here will be able to give me hints on how to proceed.
> > >>
> > >> I would like to propose and patch improvements on the "mv" (move=
) and
> > >> "cp" (copy) commands, by adding options for progress information=
=2E
> > >
> > > That's something I was wondering about some time ago myself.
> > >
> > >> The idea is that any GUI actions already do it graphically, and =
other
> > >> CLI applications, such as "rsync", have this as an extended opti=
on
> > >> "--progress". This is handy for large files processing, for inst=
ance.
> > >>
> > >> I looked for the code in the kernel source but I did not find an=
y. I
> > >> could find some sources on the GNU OS, but I am not sure if that=
's the
> > >> right place (probably not).
> > >
> > > You won't find any sources of cp or mv in Linux source code becau=
se cp
> > > and mv commands are user space and as such they are not part of L=
inux
> > > per se.
> > >
> > > If you are using some kind of GNU/Linux distribution the place to=
 look
> > > is GNU coreutils package. =C2=A0Consult gnu.org webpage for it's =
source code
> > > and information how to submit patches.
> > >
> > > --
> > > Best regards, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 _ =C2=A0 =C2=A0 _
> > > =C2=A0.o. | Liege of Serenly Enlightened Majesty of =C2=A0 =C2=A0=
 =C2=A0o' \,=3D./ `o
> > > =C2=A0..o | Computer Science, =C2=A0Michal "mina86" Nazarewicz =C2=
=A0 (o o)
> > > =C2=A0ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)-=
-Ooo--
> > >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-con=
sole" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.=
html
>
> --
> Renato =E5=AD=97. []'s, RCB.
--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
