From: jb999@gmx.de
Subject: Re: Half-bright (dim) and underline color
Date: Fri, 3 Jul 2020 20:08:30 +0200
Message-ID: <trinity-f6304c55-853f-4b9e-b4bf-3ffd14ab67ab-1593799710636@3c-app-gmx-bs32>
References: <trinity-b2827e7b-d9c3-4737-b22c-39ce0985c6a3-1593798299489@3c-app-gmx-bs32>
Mime-Version: 1.0
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1593799710;
        bh=8fQT3zDy7L0YFBQVgP7T7brTaJzT2HUBbjl5j8MSHA8=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=PSKl4SIE0HVhSPaPfyOO9jE/Ws1pD7du633d+Ulzsk3Yqgqf6IgIkaC5Y8uuebOLT
         V7vu2ye+3uqQlG3MyrUCOzMHnUljm4RgMh0vc/mtiJEEbCvMulyOvPfpMuT8cBQkUr
         V0LQHrDSbjzMJlwsXWLYkPttYnxiKSceSLcC2tXQ=
In-Reply-To: <trinity-b2827e7b-d9c3-4737-b22c-39ce0985c6a3-1593798299489@3c-app-gmx-bs32>
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-console@vger.kernel.org

Already found it: commit 1c65a879cc494af8bf20eb47996e751034a53199.
