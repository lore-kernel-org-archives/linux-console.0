From: Microcai <microcai@fedoraproject.org>
Subject: Re: VT console need rewrite
Date: Mon, 29 Nov 2010 18:12:57 +0800
Message-ID: <1291025577.9785.7.camel@cai.gentoo>
References: <1290941875.13526.15.camel@cai.gentoo>
	 <87mxosla7p.fsf@basil.nowhere.org>
Reply-To: microcai@fedoraproject.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:subject:from:reply-to
         :to:cc:in-reply-to:references:content-type:organization:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=UDqyWOHn/XhRE/CVQ9MQij8ENUflNrVzb+TSe6JBElQ=;
        b=k5XQIdfTFJCdInKDP/6zWA5MLx5LL/g8fi5aJt7wyAu7DgkGhvozhp+oR7J4gi3MPH
         qEjhYPCK9cHrxl/47DTVxW37gasDGv1eGLHFpW6zMg3lOOQEsDPuXXOD+vhEcbjdEP1j
         bPCLuI0OOKfjhEPBsNvxjUVtxC5iGYP3GTaag=
In-Reply-To: <87mxosla7p.fsf@basil.nowhere.org>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, linux-console@vger.kernel.org

=E5=9C=A8 2010-11-29=E4=B8=80=E7=9A=84 11:01 +0100=EF=BC=8CAndi Kleen=E5=
=86=99=E9=81=93=EF=BC=9A

> To be honest I have doubts its worth it. This was discussed years and
> years ago and the conclusion back then that people who need unicode
> fonts should use them in X or another graphical console environment
> (there are plenty to chose from these days). Has this changed?
>=20
> -Andi
>=20

Yes, it change. Linux graphical stuck have changed a lot. With KMS,
console got a native resolution, and looks very nice.



--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
