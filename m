From: <cutaway@bellsouth.net>
Subject: VT102 emulation code observations -- vt.c  (in older kernels console.c)
Date: Tue, 17 May 2005 00:42:08 -0400
Message-ID: <00b301c55a9a$ce7e6320$2800000a@pc365dualp2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
Sender: linux-console-owner@vger.kernel.org
List-Id: <linux-console.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org

The DEC TE code seems not to to have changed a lot lately which would make
it a good candidate for some size/space performance work now that the basic
design has stabilized.  What I'm asking for here is some comments on some
preliminary discoveries I've made so far.

The vcon data structure access macros are killers on an x86 build, and
probably some others.  GCC isn't smart enough to do the proper block
analysis that would mitigate their widespread usage.  Local caching of
values and pointers to things these macros reference gives substantial
paybacks in code size and maybe some speed.

An example of this that had a nice payback is included below.  Proposed
alterations I've made are #ifdef'd in with #ifdef __TONYI__.  Commentary in
the code snip explains my thought process and suggestions for further
improvement in the case of these two example functions - save_cur() and
restore_cur().  In newer kernels this is in kernel/devices/char/vt.c  Older
kernels will have it in kernel/devices/char/console.c.  The same code snip
appear to have stayed substantially similar over time.

I have some other mods I've been prototyping up that cut the size of the
code in the x86 build by ~2K doing similar pointer/value caching but they're
not as concise as this example is.

Thoughts?

 Tony

-----------------cut here ----------------

static void save_cur(int currcons)
{
#ifdef __TONYI__
/*
  Generated x86 code for this routine was ~256 bytes.  There MUST be
  a better way that is less plump than that...

  The bit fields and macros are killers...

  SUGGESTION: move the working/saved bit sets to two seperate bitfield
  structures so they wind up in seperate word/dwords.  As it is now,
  they will BOTH be allocated into the same word/dword by most
  compilers and some truly horrible code will result when they are
  accessed together like they were.  Of course if they were just byte/int,
  rather than bit fields, this would not be an issue.

  Some #define magic on the macros and field names should
  be able to mask this sort of change so the rest of the source
  doesn't need any changes. ex:
  ------------------------------------------------------
  struct vc_data
      {
      blah, blah, blah...
      struct
           {
           int bf1:1;
           int bf2:1;
           int bf3:1;
           blah, blah, blah...
           } working;
      struct
           {
           int bf1:1;
           int bf2:1;
           int bf3:1;
           blah, blah, blah...
           } save;
      blah, blah, blah...
      }
  /* header macros would alter thusly accordingly */
  #define bf1   (vc_cons[currcons].d->working.bf1)
  #define s_bf1 (vc_cons[currcons].d->save.bf1)

  With seperate structs, these two routines degenerate
  into structure assignments which an ANSI compiler will
  know how to do efficiently. - ex.

  vcdp->save = vcdp->working;
  ------------------------------------------------------

  Caching a pointer to the vcon in question helps (now its under 200
  bytes).

  Total code savings between this routine and its mate below is ~230
  bytes by caching a pointer to the current vcon data structure.
*/
#define CURRENT_VCON_DATA_PTR &vc_cons[currcons].d

 struct vc_data *vcdp = CURRENT_VCON_DATA_PTR;

 vcdp->vc_saved_x     = vcdp->vc_x;
 vcdp->vc_saved_y     = vcdp->vc_y;
 vcdp->vc_s_intensity = vcdp->vc_intensity;
 vcdp->vc_s_underline = vcdp->vc_underline;
 vcdp->vc_s_blink     = vcdp->vc_blink;
 vcdp->vc_s_reverse   = vcdp->vc_reverse;
 vcdp->vc_s_charset   = vcdp->vc_charset;
 vcdp->vc_s_color     = vcdp->vc_color;
 vcdp->vc_saved_G0    = vcdp->vc_G0_charset;
 vcdp->vc_saved_G1    = vcdp->vc_G1_charset;
#else
 /* this is the original code */
 saved_x  = x;
 saved_y  = y;
 s_intensity = intensity;
 s_underline = underline;
 s_blink  = blink;
 s_reverse = reverse;
 s_charset = charset;
 s_color  = color;
 saved_G0 = G0_charset;
 saved_G1 = G1_charset;
#endif
}

static void restore_cur(int currcons)
{
#ifdef __TONYI__
 struct vc_data *vcdp = CURRENT_VCON_DATA_PTR;
 unsigned char cache_g0,cache_g1;
 unsigned int  cache_cset;

 gotoxy(currcons, vcdp->vc_saved_x, vcdp->vc_saved_y);
 vcdp->vc_intensity  = vcdp->vc_s_intensity;
 vcdp->vc_underline  = vcdp->vc_s_underline;
 vcdp->vc_blink      = vcdp->vc_s_blink;
 vcdp->vc_reverse    = vcdp->vc_s_reverse;
 vcdp->vc_color      = vcdp->vc_s_color;
 cache_g0   = vcdp->vc_G0_charset = vcdp->vc_saved_G0;
 cache_g1   = vcdp->vc_G1_charset = vcdp->vc_saved_G1;
 cache_cset = vcdp->vc_charset    = vcdp->vc_s_charset;
 translate = set_translate(cache_cset ? cache_g1 : cache_g0, currcons);
#else
 /* this is the original code */
 gotoxy(currcons,saved_x,saved_y);
 intensity = s_intensity;
 underline = s_underline;
 blink  = s_blink;
 reverse  = s_reverse;
 charset  = s_charset;
 color  = s_color;
 G0_charset = saved_G0;
 G1_charset = saved_G1;
 translate = set_translate(charset ? G1_charset : G0_charset,currcons);
#endif
 update_attr(currcons);
 need_wrap = 0;
}


