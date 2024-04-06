#!/bin/bash
#
# This file encrypted at Sun Apr  7 05:29:22 AM WIB 2024 by
# +------------------------------------------------------+
# | Author: Rerechan02                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/fn_project / Admin  @Rerechan02 |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/Rerechan02
# Sponsor this project:
# -  https://t.me/fn_project/245
# -  https://prof.rerechan02.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | hf:7V:oF:1n:07:QR:0V:9Y:wt:yc:6f:zF:O1:tC:TP:LY:JX:ZV:zu:iv:ej:4j:pm:cE:lu:tW:s1:cY:LZ:4W:Ds:Hy:vk:Mz:Pz:Qo:5R:Fw:Rt:P9:pU:j2:gY:u6:8l:Tm:un:kh:Ao:i8:Bl:cU:mQ:9B:4F:2g:Ot:Cz:mC:Rz:S5:AQ:aF:ji:L6:AI:Xt:CV:CZ:bd:gF:DB:dJ:DQ:g9:9R:0e:EL:DY:Ls:Wu:Pu:qY:bS:FA:xX:zk:tn:Jp:Sc:Id:vb:s6:K5:5W:wW:CG:tr:cX:TF:Oo:6I:px:8S:a9:Vm:dJ:Hr:et:lp:F8:nx:L6:E9:Nn:6B:kP:gl:4Y:rG:Uc:2F:N3:Kl:cN:fY:m0:2c:MN:Me:Jw:zr:XK:vb:sg:ug:t7:Ga:5j:tK:f8:aZ:uH:h5:xw:Ay:et:di:Z1:yV:45:iw:aE:Md:TX:yX:NN:1E:FD:FQ:qT:Qg:Ki:Jm:6Z:2K:Pz:RN:62:5z:Hh:wW:Qz:IN:W0:GS:D7:lc:qN:Ku:16:Dw:yR:iM:hF:KB:8G:Wa:Hc:dU:hU:zC:8G:H0:nH:Yd:UT:cS:QO:kS:TJ:In:1I:s7:16:qv:bO:MM:qw:P4:DR:J6:7K:q2:97:NT:ne:R8:SY:lu:mF:XQ:7I:57:b8:At:wa:Km:GO:am:4F:Ta:Qr:oa:EM:bx:fK:LX:fe:Qs:zO:LL:Ti:Eu:Lv:6x:BN:FW:iU:JH:lH:vt:rk:3T:jC:Da:cR:aB:bv:Qs:Q2:sL:GV:G3:vs:oA:kN:Il:Bq:d5:oJ:D8:9h:X3:HJ:fy:6l:be:7V:tB:8j:89:Iq:s6:HD:JG:Gl:Uy:pv:ft:Dh:42:ga:Ez:v1:84:EK:aS:uP:iY:hv:Eq:jE:U0:ia:Wy:rW:MG:eV:m9:lP:kP:fb:k1:5p:GC:Ra:HS:Ad:MC:0W:vv:CX:Ux:dB:th:Lx:tr:eB:R7:dM:rj:v0:94:6h:Mc:kh:s2:um:Jv:l8:bB:WG:H8:F7:0N:IW:Me:Gv:0q:GM:FG:3C:kQ:ON:PO:3a:pb:Ao:ml:IN:QM:EP:lJ:oX:EP:Tv:Fd:r8:9r:FZ:ob:oJ:ZR:xD:hE:cm:Ax:DK:Sk:it:od:Uy:AV:Iq:ie:4P:mN:6h:ZP:Ax:pF:qL:C0:A2:jf:zd:T2:di:HG:HY:Nj:Kp:WN:Ow:HR:3h:wo:Gt:Bi:Br:Ae:GI:6s:rc:vR:Ga:rl:OJ:CA:dZ:jj:cM:lN:Mg:ty:Kj:sm:Gz:zs:lA:Cf:j6:0f:Aa:Ao:mx:qy:SR:e8:Wn:e5:ct:GE:oh:Tl:Bn:RT:PZ:ko:GF:gE:wU:0n:S6:Rj:HT:KV:Q3:0S:jH:mx:Nv:Qr:E5:0s:U0:4Z:GU:gr:cB:HJ:33:I7:sN:RH:Qo:I1:nT:iJ:wd:KL:lQ:ZC:bE:4i:kI:RC:FA:zH:Ga:tT:Hq:8Q:0j:H6:Si:B8:Le:Aj:YW:ZB:zk:B5:o0:kN:Bv:pY:3l:QF:bZ:hE:ZN:6N:YI:Fp:zE:6T:ce:IJ:kk:L2:OS:Zr:Ef:tA:oZ:lX:PA:8N:XD:gC:fj:w2:Qk:bS:ts:kX:At:ol:UA:QT:pG:2w:QD:tX:ES:RN:g2:x0:ie:c4:AA:q7:xz:ns:XC:bo:Q3:rp:Hy:Rc:ue:g3:v1:8i:3p:eH:fI:Du:Zd:U0:Jz:WO:n8:NC:Ee:gT:aB:CT:jl:js:WI:ZH:G7:ci:MZ:nO:XT:Dk:EW:nN:N8:UL:wU:Ta:oy:Ky:Sp:jh:rY:nq:sm:W2:aS:Bk:S2:cI:iD:md:Aw:H2:og:70:xd:ZB:c4:k7:tv:uZ:of:Bi:Cv:L4:is:0m:xb:0w:0A:0i:qA:0W:ti:3k:Ye:cH:IR:hE:ur:ZK:H9:R0:rf:o1:xG:Jo:me:1d:61:Fc:rA:aa:Ka:Ub:p5:dv:Fk:tL:w0:z1:91:60:9G:P2:xC:oC:eh:Dk:7O:pT:m2:9B:Zu:w5:gz:mN:s0:eo:eN:PI:4D:1Y:1r:sE:CJ:Vp:Kd:kD:Hl:5r:K6:qg:T8:s2:eq:aJ:El:Hw:rC:G2:xQ:G8:co:5i:bK:FU:Xf:tM:sZ:u0:d1:rW:Ye:MQ:7T:MU:h3:cb:Az:ZJ:Kv:SY:X5:Et:5R:Iw:uU:ok:f9:b5:O0:vC:NR:yO:Ef:OD:YQ:8c:RB:jb:tF:Uw:v7:x1:Ir:2F:GZ:NI:Mq:di:Yv:wo:rC:q1:6S:HB:DR:9S:V5:6u:5i:qX:W0:e5:wg:p0:pb:ba:o1:yk:gL:DR:yS:Hq:Sp:Cx:QI:7w:cs:ug:3M:iA:6o:Wt:MM:aL:62:tz:iu:7A:Gq:mZ:Yb:68:0z:pZ:VH:Xb:5h:UZ:A2:6a:a2:5c:Db:DH:R9:5b:VH:n7:s9:ed:jr:HN:tC:VH:Hd:h5:9c:0f:EJ:u1:QD:KR:cv:Ye:yT:5Y:KT:oL:FA:uX:Hc:iH:jx:0C:DH:JE:DC:hb:TM:Oh:PY:hq:Ib:oP:M2:CQ:7w:OC:qv:lr:8s:RH:YQ:gH:IA:wm:Cp:KQ:XR:ur:Kr:Et:ez:7Y:if:0E:yi:og:tH:Fv:V3:d2:Da:Py:DW:GF:Ob:R7:FM:gY:2B:o4:lH:AN:wU:b0:de:6k:go:lD:Qy:kA:mP:Zy:QZ:1C:8p:93:Bi:BO:O7:Ps:Ur:m2:1F:LO:4R:Kt:WJ:PL:8p:16:wg:8w:uR:bt:b8:9K:Px:Ji:Tj:Wn:El:AE:cH:xU:19:SN:fs:rZ:mQ:vG:4b:t9:jd:kD:ep:u6:MQ:7Z:U8:vM:M2:qj:Yf:6I:hm:yQ:nk:6c:4J:Tu:Mg:Pk:Rv:3G:8Z:3z:zw:xU:aI:D6:wE:0a:Yu:Ou:ts:ln:oP:6G:je:RU:HU:ls:ET:qu:sB:WF:lh:vT:QE:hw:40:Ej:o4:7b:Nr:wN:6w:kH:x0:RU:uN:CW:eE:vb:8J:PS:S6:t5:IT:Ah:cH:lQ:eM:Yk:En:fD:qZ:V1:V2:xT:X0:xJ:qL:RJ:6h:qp:52:Zz:QC:vi:Yw:ik:NQ:El:Fm:VJ:RF:EM:oR:Ny:B4:Um:Vx:Ow:bn:vC:SH:St:i9:qF:cb:1D:LN:EC:dn:LX:SY:ML:GE:DY:WS:Wp:X5:bq:7C:nF:ve:Gf:9z:pP:la:TV:ZY:MW:iV:Ra:dB:3s:Qv:Xw:lK:5S:Cx:je:i5:bT:1S:NM:or:dh:qm:ZB:cc:DW:qW:OI:D7:te:vg:VB:0q:Sw:qs:Iw:P4:Wp:1t:Fa:e8:fZ:Bc:tt:SV:i8:RG:AI:zN:gl:Ao:r8:FS:Eb:5K:R8:HW:A5:le:sY:lN:lm:UL:hM:cZ:mX:Vx:61:Uk:yn:jS:69:2P:3a:f0:WJ:QV:3B:cx:19:z6:2t:A6:KO:MA:kP:dY:gy:4V:Ls:Lk:9D:i9:DB:5y:Sb:PJ:ZX:Eq:WF:Q1:73:VH:jb:Ra:dD:Xg:vZ:l6:lC:jQ:1c:c9:xD:R0:4y:Nm:h0:lF:07:K3:bQ:qt:us:wi:F1:e8:mq:m4:sq:q4:cc:jX:yO:8J:tb:MA:bA:cy:FQ:Wl:OR:QJ:IP:l1:qe:mV:HE:BF:uB:eU:WM:iG:Wq:Gh:pX:zf:3B:F3:Ip:ds:xN:1x:9a:VL:47:S4:qO:Zq:9a:SR:3D:hQ:Kh:wi:0H:hh:3d:VR:4T:7N:mL:TS:LT:Ts:IF:wn:4I:KN:dc:1J:4M:h5:FJ:j3:20:Lm:GE:GY:Gi:4p:Tj:Lc:rr:M1:pT:2J:Sk:MN:Lf:2v:mt:rn:Nf:nO:K0:S6:8Z:2r:zS:Wk:2t:S1:ps:cR:2p:ii:Im:Sw:40:l2:uS:gX:J4:Tr:Ht:br:Hv:S3:Fr:YP:IY:hc:Dy:sW:fw:xp:qm:Wg:uP:J4:VK:K4:VN:p6:DE:FY:4D:uL:BM:DH:IH:zt:6Y:Au:rA:I6:p4:ID:Ex:yZ:kh:Sx:zq:5l:hY:bN:wL:7j:gf:99:bO:rG:1O:Vc:gC:TE:Yy:4s:lu:f8:lZ:4c:ik:n0:rV:Aw:zY:X0:4A:fi:ht:CO:HY:ZA:2B:DA:ly:Kr:WD:xx:qT:Ho:22:qU:zF:Pw:2a:hk:6H:jU:BS:SB:h9:mi:tS:lz:Vi:iT:ie:3U:YW:ii:DX:yp:T2:2L:c4:tV:uN:HB:yT:0B:eT:tN:Vs:og:k4:cm:rK:oQ:JV:40:2z:Vd:H6:1e:Dx:gt:pe:6D:46:AS:qb:r4:B8:wR:of:pm:K3:D3:OU:nf:E6:Zg:aQ:Cr:Pf:pB:em:Dw:oQ:pp:Xp:NQ:zZ:b5:n4:Yi:Er:F8:Fc:Zr:cp:ev:Mj:j2:F1:gp:Sh:3q:v8:oC:SO:Er:ca:IZ:K4:T5:EQ:8x:ko:8r:3R:Cp:aO:7u:6r:BB:Un:Dq:00:2a:bd:FT:Zj:Aq:PZ:5b:TY:Ij:uq:3a:c3:Zg:Bo:en:ls:7I:6k:Wd:dX:Ra:ck:6R:VL:Nn:dH:9M:1v:OX:Fx:Kt:xi:9l:b0:kl:Zk:kU:LN:kX:gD:3Z:7e:4w:au:7d:v4:B1:cJ:WY:bE:Vj:j1:1W:X8:0e:LB:a6:7C:Rp:jy:0f:6f:hj:TK:oV:wy:G8:xS:h3:4a:qx:w6:TL:eZ:js:3e:oK:jy:LR:MK:st:WD:oe:NM:uW:B6:mQ:x5:CQ:r0:nD:Ry:qN:rz:VI:rh:zf:Nb:lo:5Q:Ez:Ve:TV:wB:ab:Ur:eV:q7:jM:0i:BN:0N:xR:oh:Ub:41:4T:x8:Z8:JK:Li:Oh:do:1K:av:oJ:hp:Dk:dI:sO:hs:4I:Vy:Lf:3S:AK:i8:jE:XC:vd:al:Iq:uv:Df:gA:tE:cy:We:Im:PO:PX:si:OU:Hc:oh:Zb:7p:36:1q:tj:uz:wH:yU:vq:vW:p0:Zp:n2:5v:WM:la:TV:Y5:sj:QN:MK:0e:wU:6f:KG:MS:aU:Fs:rh:Sl:PH:Gw:l3:kM:tX:RN:AH:o8:5B:Hr:lq:7I:Fq:KG:DN:Wx:Jq:wZ:rI:g5:hF:Ks:HG:NJ:to:x2:UG:sF:fO:BX:MD:MU:RK:PD:jn:aA:nK:3R:mi:WW:5c:G3:Cy:1y:yA:sZ:99:RS:4P:SU:uJ:mw:g3:qv:Ry:UL:Y6:NK:Ny:4m:PJ:uc:Dv:W9:jt:Dh:tM:mB:8m:Kj:pT:lr:4l:5D:3K:lQ:jL:Mr:WO:7c:Ya:Kf:gc:1D:XZ:7Z:vm:Gy:Hr:oF:uu:hp:8d:oZ:0z:qy:zZ:oV:kW:MP:EL:1W:PF:sY:3Z:T7:Fu:q9:lS:I6:Wd:cV:2P:sP:Pc:RJ:3i:Lq:QE:xR:Gg:eU:Rg:i6:Eq:fy:4D:xU:Kr:GK:6P:H4:N6:BR:XF:4n:8t:N3:GV:VS:vF:2u:AU:mr:LZ:d6:6O:Df:fK:PP:L4:4Q:Y9:g2:he:Ty:59:MO:sZ:G9:ql:Ob:6K:J0:HZ:Lw:JK:3u:qV:Q2:mW:jz:hh:9x:aM:T1:dN:hm:Rq:T4:yo:Tg:NY:7R:Lt:iE:0a:Av:ew:QU:2r:Nd:u0:UC:Go:KK:8v:MQ:LK:d7:6N:SE:3f:qo:VG:Hr:0L:mm:m4:Se:0l:tX:5E:45:ch:Fi:Q2:zr:15:66:oJ:AV:j1:X3:Wl:jF:3Z:yJ:5S:8Y:mh:O3:qn:m6:Ei:jW:Sp:Xu:tB:sR:Hj:TH:wl:hI:SC:DA:uE:5L:se:Pw:pP:ko:8r:S7:iu:G5:Sq:9L:Jy:Qr:50:Vm:IA:ih:YY:Gw:69:YR:47:Cj:aQ:iM:aE:lH:aF:eU:q7:vq:1V:sd:q6:Cp:ee:Fw:gW:tL:Sd:4M:zM:8V:Bu:NH:ND:8H:UW:El:4s:7u:0V:Rl:9d:n0:qp:Sk:zV:ni:85:7x:oq:JL:zX:OO:sP:jx:tL:yV:YF:Oj:Y7:Bd:mp:f0:8o:fV:PM:EX:lN:WT:f2:At:5i:V0:uh:yq:bh:pj:8i:5o:Ew:8p:Ak:Os:VV:CI:uZ:3d:Kk:GV:ci:Kf:Fb:S9:qU:DQ:6Q:4y:Ld:jB:YP:zn:pu:Rp:bh:zm:z5:rw:xv:po:xK:ls:6N:cx:M8:TM:Iu:aV:4x:7a:tX:Dk:lg:Dg:au:rl:dx:pJ:dq:ny:mu:C0:fd:02:Qk:4Q:sy:Rk:Ua:O2:4D:N2:84:Yi:fC:mO:4L:2W:y7:wj:YV:2t:8U:Er:Vn:Xf:QQ:sS:Ed:D0:Na:DZ:Ea:Ta:j6:rC:up:1a:Fb:CV:q6:0U:HY:0T:Kn:Qu:FZ:HE:xy:pl:Si:uT:id:bF:QP:QT:LT:CY:0k:iO:PS:uN:zd:AC:MB:tf:Q7:3a:Wf:Ed:Qi:9g:8q:y4:A9:x0:Em:fr:jg:Dy:Ue:Yf:ff:yo:VG:do:fs:TY:o6:eJ:NV:SP:9I:0F:mo:Ur:NT:Gp:GQ:CV:o1:H8:tl:ZW:I9:rf:aO:w4:sK:Vc:wA:5W:fR:WF:lp:x9:jN:93:lw:Rx:Gh:mz:n5:y9:9S:jA:8y:0s:CS:St:sl:Vm:82:Fm:qE:eM:0y:MW:Po:gf:ED:A5:1v:kR:ss:du:Z1:Mu:79:R1:Sa:0s:VI:8e:Lh:cJ:il:Y7:o0:6d:6U:Sj:xu:5h:4W:Es:3H:96:uT:cZ:aM:BK:Jw:ZO:Ks:3a:th:nR:tc:Sk:jD:9U:nR:tl:PH:ZS:9g:yU:nl:fW:jZ:Nm:4c:0i:eD:yU:I0:TC:Ms:1u:6Q:0G:HW:07:B8:wp:JK:9h:wN:8k:up:y4:zl:4d:P3:P7:wA:M9:4e:J9:kp:4N:QB:Oa:Tk:AJ:1L:uT:tl:DG:5O:dF:5a:Et:27:1T:2M:2b:FM:2S:Ot:Ah:Ik:wL:ua:5S:30:9T:Qe:M5:kL:MX:mr:Hg:3w:91:MN:Z8:Vy:e6:pE:FZ:XE:H0:T4:qZ:S3:kh:p9:EA:LK:SV:dF:9k:mg:kB:w4:ML:EH:5s:Es:4l:jw:gj:Fz:bK:pw:ET:qn:Gr:2M:6q:jm:YI:44:Wx:0K:VV:8Y:QP:TS:sI:zq:zJ:JA:tv:YI:Sc:Ra:fz:a8:t8:NN:ft:Xe:dd:9n:dh:RK:rl:hC:kd:n9:bd:WX:in:DG:Rn:Qm:Wb:BP:9t:8u:69:VM:df:F8:i7:E5:Fw:A8:sv:dz:Ew:JK:7j:FA:U6:Tj:x8:uA:Qb:cP:KC:rZ:DS:Xt:vM:rx:Ay:Ys:4w:Xv:hn:Mt:Cq:qT:NJ:WO:5x:ZZ:1V:R3:U5:bq:FM:MX:OG:3i:cQ:FX:jA:RS:zr:Bi:Wh:Ry:Ps:u9:UL:gL:dR:68:If:mg:Vz:ya:eH:sn:XK:0G:eK:T2:M4:Fl:i4:dg:vb:XS:29:8s:0e:Lr:WI:k4:m2:f0:Rt:ol:XG:qS:H7:FO:vd:TQ:sv:lZ:Dt:Uy:qt:TB:Af:aT:37:Di:B0:ki:yK:ZN:tN:6j:UN:TV:jt:Dm:33:sH:QF:Oz:Wv:PH:2b:yU:Ov:lQ:t6:7g:Wv:w4:tb:R6:qw:JC:08:1a:AF:AE:q3:Du:GH:sR:Pz:py:OK:48:hj:Tn:u3:Va:zF:TI:he:Dk:BK:Bp:86:dE:wY:1N:tE:Ev:EB:So:k4:Ef:9P:0e:Cf:8G:Fm:k5:tq:5D:vn:3T:6G:vS:Nc:RY:82:8N:2r:xN:KF:ff:dY:Fy:KI:gI:tg:tV:2i:bh:5K:Tq:p9:UD:B9:WH:VW:DT:D9:UN:uW:Mr:kB:zy:ow:ed:xx:kL:eO:Er:Up:tW:JS:Qx:hb:JF:Pb:QI:jX:sr:c0:2F:iB:S5:FL:10:0U:GR:0C:wz:AG:g0:mv:OT:KY:Ur:Gh:7m:Qt:tb:Qn:Xy:yR:SN:Xz:Ja:DG:OS:Fh:Xy:z8:lK:w4:hN:it:W0:sE:Uq:nc:aK:6p:6D:6e:lJ:aG:G3:Pb:mn:tW:EW:I2:3Q:A7:rA:Kf:Bs:K2:8z:xV:cD:HU:EG:Tr:Pb:B0:RB:qt:MZ:NY:AV:bZ:gT:7E:8G:KQ:1c:4B:yq:Gn:s1:IE:ws:Kb:U8:XD:T9:4t:41:E6:2C:gL:At:DO:Fx:lI:aA:hc:Y0:oZ:ZT:XZ:oH:aa:N5:Pl:Ix:Qz:7E:RM:9M:xK:TY:F5:nY:Hv:3G:7D:kx:rx:2K:pO:O5:tp:U9:Jp:f7:sD:Ut:gn:Wj:5r:IS:eV:Oe:MM:Tb:rn:nN:2P:PV:jg:5q:Su:uO:VB:vs:fx:r3:O1:Al:py:xr:RM:Nl:wI:0R:30:9g:HY:6d:x4:uF:PO:3h:qx:9m:e4:Eq:jt:lW:d1:GG:xH:Om:mJ:w1:Yb:Pe:nA:b6:Z8:4r:Ob:3a:c4:0o:LE:gk:tf:ZN:4c:R4:Qd:Lx:ju:GT:XN:dt:k4:yZ:V5:2m:L6:tC:9O:SK:Ds:Ky:f0:bg:AL:fg:aU:NF:vC:NG:Fw:wt:gG:b8:NC:ip:v2:OW:np:qR:cO:Hl:lj:g2:U0:a6:Xh:To:aB:HM:6Q:hp:MU:ya:Jm:RQ:Np:G3:Qn:wm:c0:1i:xv:uA:IK:Dz:Yp:bE:sH:2v:Np:80:Y3:2D:VX:bd:zh:Iu:es:wh:a7:TE:Vr:iH:vg:g5:jS:kG:Fn:Mk:78:lD:CB:Os:o9:M8:wk:w4:oL:61:Wa:eT:Fk:Ci:Xj:C7:sy:r7:rI:bF:JE:WT:ku:Ay:jc:wf:dG:po:ox:qU:A2:5W:B7:Fv:Li:Wg:B8:ED:Yr:ga:BM:PF:Ic:Gx:J2:NF:ZP:bO:Vs:Uj:W7:Cc:tw:Si:eN:wt:eh:T5:oT:b2:r8:VM:3W:ZH:Qs:xx:iU:fR:ky:OQ:rE:4O:y4:5T:LF:zM:S4:LI:8v:DN:fS:lw:V8:SZ:MS:GX:pK:fM:Dx:Lc:LM:5X:WI:yA:3u:hv:y7:Yz:q9:9u:a4:HF:6a:zh:3X:kP:7X:IZ:q5:7t:bP:jg:D9:bF:tt:8f:mN:Py:gQ:Id:Lx:NF:zt:kj:4N:IB:y0:Qi:VT:m8:xA:zq:Vk:IS:tm:Tp:eM:n8:Ur:hi:pg:pg:CF:FL:0H:Wn:R8:wy:Sz:FQ:I0:wU:dS:p1:Pz:w1:g5:zY:pC:Ph:Wq:kI:XB:v1:aE:60:Kz:3Y:OF:Gr:ll:my:un:xD:eU:ot:DA:X7:pD:Zw:Ss:5l:JH:nH:XJ:oZ:Vg:0r:Nw:o2:Q2:ba:Hz:uz:fb:JK:m7:Im:ra:n9:QE:M3:lQ:W5:2Z:js:cu:uV:FD:Ep:6z:uo:IF:8P:UQ:55:Jv:gW:LL:2A:dO:l6:uY:g6:G4:HL:fC:9H:3h:bw:xT:Ip:46:Bk:wU:H9:Wy:yc:W4:jA:Af:aD:0s:vq:Iw:tZ:p8:wu:N1:mz:wL:em:Eq:IQ:VQ:VY:pB:x0:Un:zB:DR:Ji:27:FL:MW:yD:ZR:0N:Ku:69:yr:eU:ms:Mf:oX:aP:YN:H3:Oe:N8:3M:vM:h3:yY:hc:Nj:0J:1W:VX:QA:lM:zI:n5:Qz:RL:S1:Fl:oA:Pi:ym:VT:CA:A8:OO:f8:Zh:zF:U2:pR:2u:GW:1a:2w:sl:tB:nY:sP:n4:pe:Jk:zj:KZ:EO:xo:jT:VW:Zt:iN:EK:J6:nb:76:md:ew:SP:Bk:t9:ma:mu:sf:gh:rT:zB:Wu:lL:n4:6j:TN:Jh:Oi:s7:SY:qN:mO:TT:fU:dF:U7:os:lk:ii:kK:pv:OW:6p:S8:rn:AW:LX:jE:va:d6:v1:vW:l9:kF:Sj:zT:8c:Wc:fc:aF:XG:Xk:Qn:NU:xZ:6Q:iY:fA:KB:Ve:3V:75:4n:mF:WS:U8:fD:F3:2F:x4:HM:BU:4O:RL:JS:aj:GT:cb:gA:Nm:C6:Jm:QR:0f:6o:5v:iX:hG:rq:S2:1t:QO:HC:Zo:Hq:3M:h5:vT:EX:l0:m5:Wz:mH:08:ja:We:Hc:Ud:9O:hM:86:Ic:AB:Sn:xv:oP:32:l2:x2:UR:IZ:XO:Zu:sq:td:Um:GB:Vi:60:GH:NR:oE:J9:dD:fX:Lz:6B:Xq:pu:Ft:Oo:ka:sG:um:u3:lH:ye:RG:Rn:Nc:fo:PH:4r:HA:1N:ef:Ec:83:7Q:CV:eM:de:pq:Er:6K:ku:pm:gc:9U:Jw:jt:zy:Mg:WW:iL:MV:7L:15:sw:LP:CM:3J:Vu:OG:Ry:4H:ij:0K:fr:XP:E7:2o:cL:wH:Vb:0t:SO:99:q6:GB:BY:DO:4V:3t:l3:Ci:06:Sd:wH:Z1:fJ:qs:Mw:Gp:UY:Dn:Hg:nQ:yg:6R:vz:8I:yz:Xv:jZ:dD:OS:Xp:G7:F4:Kw:en:JJ:7w:aK:pc:bj:vQ:zG:Oe:uH:xJ:z1:vU:nf:7x:gS:ID:K9:ka:ny:Rg:ri:tT:T9:2i:kd:a2:z8:7B:qE:km:MX:Uw:Aw:4n:oN:5E:Vi:zk:Jw:b9:vp:7d:Ge:jV:wR:dI:CV:AQ:ys:uS:sP:oc:kE:nx:7E:V5:Ul:nK:TF:5g:qR:UK:Aa:XB:K7:Hi:ZY:sR:U3:pI:PE:Sj:kl:EW:jq:Ou:fK:8p:BG:OM:Fg:7z:3L:7a:7K:zF:Co:wS:VX:Wf:pp:Sq:hi:5v:k8:4l:Pg:Pm:qn:Lp:Y0:Ot:5h:bN:VV:2j:Zy:c0:3p:lS:8o:gZ:n1:n5:tT:wK:1v:is:xu:3l:ub:u9:69:Hw:Hq:3w:0Q:7L:37:BC:gV:IX:oN:KQ:y1:E7:8d:Hl:fs:su:md:qK:uI:Mm:yE:xA:b9:vY:wz:GK:fP:fE:Ej:Tb:Eu:cp:85:5G:Ee:3t:6q:Io:kL:IY:CV:qA:eG:7O:Lg:2v:IY:2k:jj:Sc:Cs:3c:ai:kO:qJ:JE:HK:bQ:ot:yq:bV:ns:wv:N4:TU:Ri:Y0:Lt:bf:UE:Q2:Aw:19:8b:WA:qo:0s:gq:2E:vI:n6:F4:rS:ka:VW:rr:Cz:LL:3s:ri:Z0:L2:07:N1:Q3:rH:0P:T9:8J:Mu:eO:2p:bG:Za:rT:2M:zt:6c:V1:IR:Lh:dR:Rr:8Q:18:p4:HG:hK:tq:Kp:oz:Zz:EY:aq:Xs:Wo:VK:DE:wS:Vc:v6:IH:tR:hC:C9:wD:qe:2H:Ki:id:Og:Gs:wm:h8:GR:Xm:Qc:wk:Sw:Rr:wU:mC:VN:mO:B4:PO:zK:72:UH:Ni:Tl:2t:nf:UA:JK:OT:Xl:MA:O0:Ht:JO:Ya:Cr:xg:js:oH:fJ:xe:h4:zK:49:Rm:kE:Dy:Lp:7R:Jn:4J:ek:CJ:ZF:j7:rR:XW:XL:px:Mc:wj:Z0:A0:oN:ZI:Vf:uE:i4:fc:Mn:2k:7E:32:bu:kw:ze:WR:Hm:2l:mC:3X:c5:RU:te:I1:XT:sq:A3:6F:Lv:pj:aq:1t:j9:r2:Fj:mk:Jf:19:sw:RN:dF:HM:HO:sp:K9:DD:YC:wL:6N:Uv:Cl:Yh:Yg:0S:2e:9Q:yd:RV:VW:73:l7:jE:SM:SN:KM:zY:a9:Rs:5A:8I:uK:lJ:iF:O1:yf:04:nY:8X:X8:FU:Qq:CC:4U:ha:Fx:19:cR:ht:8B:TJ:33:SH:hi:nw:jh:EP:sY:wq:av:Fy:aR:Uj:WG:bP:Hy:j9:47:jD:pn:jW:21:Kd:om:X3:dI:CZ:yy:cq:Aq:Mf:3l:N0:UR:9q:QY:yx:Q0:3Y:xU:DJ:N6:Ij:wS:NZ:UD:gy:Nk:Dk:89:rz:Cu:RR:I1:hW:u6:6W:nM:0P:p2:m7:u5:zo:Ls:Yh:x6:3J:QJ:t8:yG:HL:Gf:XY:hJ:yK:U9:vh:Fy:HW:n6:bW:4D:6M:rM:ew:bX:mw:SN:FT:XV:1a:uv:I9:Ga:A5:ka:ra:at:au:be:03:eH:13:GO:Fv:B8:BU:qI:mm:yl:aQ:RW:06:Xd:pE:lL:6L:V7:Eg:5q:aB:w4:w4:c4:JX:Hn:fW:Mv:oF:XB:yi:gv:Py:9p:xX:Ee:Cz:L3:fN:f4:Uf:ca:0h:bg:SI:Ky:7G:BO:ya:PE:9c:Ew:4I:4U:sQ:rf:I7:Q0:Hm:Vn:wU:jl:fe:Nc:mU:XC:kC:eD:2D:NI:qr:Fu:1o:g6:bK:S5:eP:c0:eS:v6:Uu:FJ:Q2:uU:vp:uy:ue:oG:Gp:jL:yz:lw:2F:jU:VG:Mj:Yk:v8:il:Ob:H3:VX:xx:tl:sh:3p:Dy:Bg:az:ly:Fs:Jy:bJ:UC:QO:9d:6j:fP:Nx:lZ:it:n6:hK:Re:PX:sA:K3:DF:FW:Kj:ex:w7:m1:VE:mI:c8:7A:cI:6U:zo:6o:Er:iv:qZ:lm:cD:Gm:po:4M:RK:Id:7C:gX:ZS:oD:DQ:pL:3Q:7R:MN:lH:Nx:dC:qj:Kj:HD:zh:Fz:W6:Cq:1b:Ia:3l:O8:e6:8x:aj:a4:A7:zd:Gi:2o:uQ:CZ:3M:6z:gP:SD:6C:PJ:Uz:2n:sm:gM:5v:E9:l8:hd:oa:TL:wR:Em:oX:If:aS:2a:VI:TE:fn:AG:qa:5a:av:xb:0Z:nr:cx:Yz:vX:Nx:hb:83:eR:KB:2D:0h:CJ:Ic:n1:cR:Ut:OZ:2s:Nt:de:YZ:TI:LU:vx:B2:fz:MV:rS:S4:sh:gn:MQ:7n:Xq:Ai:0m:Eb:vG:4o:6Q:lL:a2:8Z:SP:Kh:T9:ZU:ep:ky:gc:KI:27:nC:uo:uT:Dd:2t:qV:cp:21:bN:a6:C1:W5:4n:ND:kw:s2:1y:Mk:fn:5q:Qb:7H:W3:WE:3C:gp:3v:mI:gg:PB:2W:E6:7z:IT:Il:lZ:nq:BH:0C:wc:nu:XE:1S:bN:WJ:JB:rl:AZ:xR:LG:3r:IE:Rz:os:BY:eK:GG:VC:jn:OP:p9:yX:6d:P2:xN:9D:Oj:Xl:WA:5L:SD:dF:PZ:vh:qP:Ee:EM:ZL:Ku:SX:63:mQ:B9:Re:KZ:bg:aE:cW:Ys:qH:z7:Iv:IG:Bh:7x:Ci:ll:1S:IN:8c:uB:bk:On:OJ:OV:lu:Ug:U8:3C:Q7:ck:Lk:Hs:Vy:mN:8P:9W:RO:9P:H2:Og:Gy:5W:Mw:UI:s3:ql:3J:hx:9G:H9:iB:tx:Sb:mi:8a:tK:ZF:wr:EC:r1:Cx:FH:47:wp:uq:MU:vR:P3:uO:X2:9y:2m:ah:Yu:Q4:4G:T0:8v:oF:oI:Dq:4s:kn:6H:gS:4h:4w:G0:90:IU:rb:9N:ax:cE:aD:mK:8w:hI:bj:AN:we:aL:va:Xu:7D:ZK:9P:fj:Un:AJ:YL:kj:UU:tL:KK:2z:tX:Vn:ne:MR:uV:Fg:YC:al:rn:5Y:F3:FL:h0:CR:16:09:q2:MW:EP:DE:Ca:uX:yW:bF:8T:qc:e0:rf:uF:lz:VU:6P:uA:cE:fD:mM:q7:g6:IC:2u:QF:TC:mg:CO:Gv:p6:Eb:MY:RI:8M:sr:rm:2Q:qV:Pi:sR:nS:BC:la:2B:ki:OK:WA:Wj:in:8w:MJ:3V:2L:yy:QA:l3:Yv:Dy:Ax:J0:kD:Uv:z4:9O:Jv:Zg:dj:tm:NX:3q:57:ty:lM:DV:cn:SC:Zg:TT:wr:XX:uv:Vf:Ft:Js:xg:6L:0U:fj:2t:X6:3d:6p:xW:NM:p1:d2:ID:cq:5d:uV:IL:fG:oM:SK:Eh:oT:SA:Od:au:dS:6y:mG:iw:Jn:9H:Rl:iy:9K:AR:X4:dN:xI:tC:lR:eK:ew:93:se:qk:LC:Tm:1I:zD:4S:eK:6v:Yq:Ha:8K:Eq:AN:Qy:Hl:TM:WO:do:ee:EL:QO:wL:bE:pa:UC:Gh:Uo:Pf:FK:p7:yu:BA:mZ:pb:ST:0f:Ln:wz:ve:bv:cE:UP:Yh:vq:ob:Bh:n0:8s:ML:d2:GP:1U:Nr:fC:L8:bJ:kM:Bf:2j:YO:Jl:p1:XG:Qy:yf:MM:RG:zV:zu:vQ:mu:2A:En:FO:wF:B7:qy:yn:Qu:BQ:UE:0Y:06:nX:MW:J7:2j:Js:Eo:CR:4s:b0:Rp:99:W7:su:vS:TN:w0:v1:U6:a0:cK:G0:8H:us:Yr:k0:G1:lx:SA:nB:vg:Ra:00:Dw:Zy:qT:O7:Wz:5n:RZ:u0:Rr:QB:Om:Bm:4y:wF:01:w5:vc:xy:bT:iw:Wb:ao:xS:oJ:ao:zC:Qo:Gc:IB:M8:1o:Lp:ur:pQ:NI:Q1:ju:er:vn:z8:Po:aj:Rj:Ay:yW:KI:HD:a6:dC:2a:ch:C9:0n:UW:yy:QO:iz:WP:mq:14:x2:M2:jT:Bv:wX:lf:ll:rm:mj:7t:iQ:0l:LO:ug:tH:6k:fn:qv:pV:BZ:45:wr:Ia:qQ:WB:f9:bP:mT:OP:P1:dN:Fy:0O:9s:GI:Mz:4B:8L:Sy:uQ:L0:k1:j0:0R:Xq:63:mw:Aw:0S:OO:cp:Mi:8W:U5:u2:ci:sC:9y:qM:HS:kt:Fz:f8:qW:KJ:qJ:AI:mq:xf:yl:au:Zq:9p:Bu:15:JO:Ms:1J:fq:cX:73:rz:Wf:Vp:Ex:Fw:5b:ma:Bx:DH:k7:0v:T6:Ct:6Z:Tr:zD:EJ:a8:Ys:MS:4q:7W:55:wa:MJ:jP:wW:zD:AR:i6:9p:LJ:sI:K9:05:ph:wZ:Z6:mn:D2:V4:Ux:l6:o0:kA:Vz:OG:PM:e4:MR:qk:ol:2O:Qc:Qk:FB:nF:E8:TC:sN:IX:Z1:59:rD:Q4:PP:hC:xR:AN:QT:Sb:wc:kz:cc:vn:S4:Jz:4D:cG:Pd:hG:gs:v1:w5:yO:5N:cU:5Q:N5:RF:Tb:Ay:S3:A5:Ve:wt:7y:zh:35:gx:Sv:Gs:ll:Hn:Iz:HU:ah:S7:bk:Bo:dS:n8:aT:H3:Na:s4:tY:O1:Rf:L9:YN:ce:Fh:6B:Xu:67:gi:yb:eq:qY:cC:zh:x3:nI:vx:2Q | Rerechan02 | hf:7V:oF:1n:07:QR:0V:9Y:wt:yc:6f:zF:O1:tC:TP:LY:JX:ZV:zu:iv:ej:4j:pm:cE:lu:tW:s1:cY:LZ:4W:Ds:Hy:vk:Mz:Pz:Qo:5R:Fw:Rt:P9:pU:j2:gY:u6:8l:Tm:un:kh:Ao:i8:Bl:cU:mQ:9B:4F:2g:Ot:Cz:mC:Rz:S5:AQ:aF:ji:L6:AI:Xt:CV:CZ:bd:gF:DB:dJ:DQ:g9:9R:0e:EL:DY:Ls:Wu:Pu:qY:bS:FA:xX:zk:tn:Jp:Sc:Id:vb:s6:K5:5W:wW:CG:tr:cX:TF:Oo:6I:px:8S:a9:Vm:dJ:Hr:et:lp:F8:nx:L6:E9:Nn:6B:kP:gl:4Y:rG:Uc:2F:N3:Kl:cN:fY:m0:2c:MN:Me:Jw:zr:XK:vb:sg:ug:t7:Ga:5j:tK:f8:aZ:uH:h5:xw:Ay:et:di:Z1:yV:45:iw:aE:Md:TX:yX:NN:1E:FD:FQ:qT:Qg:Ki:Jm:6Z:2K:Pz:RN:62:5z:Hh:wW:Qz:IN:W0:GS:D7:lc:qN:Ku:16:Dw:yR:iM:hF:KB:8G:Wa:Hc:dU:hU:zC:8G:H0:nH:Yd:UT:cS:QO:kS:TJ:In:1I:s7:16:qv:bO:MM:qw:P4:DR:J6:7K:q2:97:NT:ne:R8:SY:lu:mF:XQ:7I:57:b8:At:wa:Km:GO:am:4F:Ta:Qr:oa:EM:bx:fK:LX:fe:Qs:zO:LL:Ti:Eu:Lv:6x:BN:FW:iU:JH:lH:vt:rk:3T:jC:Da:cR:aB:bv:Qs:Q2:sL:GV:G3:vs:oA:kN:Il:Bq:d5:oJ:D8:9h:X3:HJ:fy:6l:be:7V:tB:8j:89:Iq:s6:HD:JG:Gl:Uy:pv:ft:Dh:42:ga:Ez:v1:84:EK:aS:uP:iY:hv:Eq:jE:U0:ia:Wy:rW:MG:eV:m9:lP:kP:fb:k1:5p:GC:Ra:HS:Ad:MC:0W:vv:CX:Ux:dB:th:Lx:tr:eB:R7:dM:rj:v0:94:6h:Mc:kh:s2:um:Jv:l8:bB:WG:H8:F7:0N:IW:Me:Gv:0q:GM:FG:3C:kQ:ON:PO:3a:pb:Ao:ml:IN:QM:EP:lJ:oX:EP:Tv:Fd:r8:9r:FZ:ob:oJ:ZR:xD:hE:cm:Ax:DK:Sk:it:od:Uy:AV:Iq:ie:4P:mN:6h:ZP:Ax:pF:qL:C0:A2:jf:zd:T2:di:HG:HY:Nj:Kp:WN:Ow:HR:3h:wo:Gt:Bi:Br:Ae:GI:6s:rc:vR:Ga:rl:OJ:CA:dZ:jj:cM:lN:Mg:ty:Kj:sm:Gz:zs:lA:Cf:j6:0f:Aa:Ao:mx:qy:SR:e8:Wn:e5:ct:GE:oh:Tl:Bn:RT:PZ:ko:GF:gE:wU:0n:S6:Rj:HT:KV:Q3:0S:jH:mx:Nv:Qr:E5:0s:U0:4Z:GU:gr:cB:HJ:33:I7:sN:RH:Qo:I1:nT:iJ:wd:KL:lQ:ZC:bE:4i:kI:RC:FA:zH:Ga:tT:Hq:8Q:0j:H6:Si:B8:Le:Aj:YW:ZB:zk:B5:o0:kN:Bv:pY:3l:QF:bZ:hE:ZN:6N:YI:Fp:zE:6T:ce:IJ:kk:L2:OS:Zr:Ef:tA:oZ:lX:PA:8N:XD:gC:fj:w2:Qk:bS:ts:kX:At:ol:UA:QT:pG:2w:QD:tX:ES:RN:g2:x0:ie:c4:AA:q7:xz:ns:XC:bo:Q3:rp:Hy:Rc:ue:g3:v1:8i:3p:eH:fI:Du:Zd:U0:Jz:WO:n8:NC:Ee:gT:aB:CT:jl:js:WI:ZH:G7:ci:MZ:nO:XT:Dk:EW:nN:N8:UL:wU:Ta:oy:Ky:Sp:jh:rY:nq:sm:W2:aS:Bk:S2:cI:iD:md:Aw:H2:og:70:xd:ZB:c4:k7:tv:uZ:of:Bi:Cv:L4:is:0m:xb:0w:0A:0i:qA:0W:ti:3k:Ye:cH:IR:hE:ur:ZK:H9:R0:rf:o1:xG:Jo:me:1d:61:Fc:rA:aa:Ka:Ub:p5:dv:Fk:tL:w0:z1:91:60:9G:P2:xC:oC:eh:Dk:7O:pT:m2:9B:Zu:w5:gz:mN:s0:eo:eN:PI:4D:1Y:1r:sE:CJ:Vp:Kd:kD:Hl:5r:K6:qg:T8:s2:eq:aJ:El:Hw:rC:G2:xQ:G8:co:5i:bK:FU:Xf:tM:sZ:u0:d1:rW:Ye:MQ:7T:MU:h3:cb:Az:ZJ:Kv:SY:X5:Et:5R:Iw:uU:ok:f9:b5:O0:vC:NR:yO:Ef:OD:YQ:8c:RB:jb:tF:Uw:v7:x1:Ir:2F:GZ:NI:Mq:di:Yv:wo:rC:q1:6S:HB:DR:9S:V5:6u:5i:qX:W0:e5:wg:p0:pb:ba:o1:yk:gL:DR:yS:Hq:Sp:Cx:QI:7w:cs:ug:3M:iA:6o:Wt:MM:aL:62:tz:iu:7A:Gq:mZ:Yb:68:0z:pZ:VH:Xb:5h:UZ:A2:6a:a2:5c:Db:DH:R9:5b:VH:n7:s9:ed:jr:HN:tC:VH:Hd:h5:9c:0f:EJ:u1:QD:KR:cv:Ye:yT:5Y:KT:oL:FA:uX:Hc:iH:jx:0C:DH:JE:DC:hb:TM:Oh:PY:hq:Ib:oP:M2:CQ:7w:OC:qv:lr:8s:RH:YQ:gH:IA:wm:Cp:KQ:XR:ur:Kr:Et:ez:7Y:if:0E:yi:og:tH:Fv:V3:d2:Da:Py:DW:GF:Ob:R7:FM:gY:2B:o4:lH:AN:wU:b0:de:6k:go:lD:Qy:kA:mP:Zy:QZ:1C:8p:93:Bi:BO:O7:Ps:Ur:m2:1F:LO:4R:Kt:WJ:PL:8p:16:wg:8w:uR:bt:b8:9K:Px:Ji:Tj:Wn:El:AE:cH:xU:19:SN:fs:rZ:mQ:vG:4b:t9:jd:kD:ep:u6:MQ:7Z:U8:vM:M2:qj:Yf:6I:hm:yQ:nk:6c:4J:Tu:Mg:Pk:Rv:3G:8Z:3z:zw:xU:aI:D6:wE:0a:Yu:Ou:ts:ln:oP:6G:je:RU:HU:ls:ET:qu:sB:WF:lh:vT:QE:hw:40:Ej:o4:7b:Nr:wN:6w:kH:x0:RU:uN:CW:eE:vb:8J:PS:S6:t5:IT:Ah:cH:lQ:eM:Yk:En:fD:qZ:V1:V2:xT:X0:xJ:qL:RJ:6h:qp:52:Zz:QC:vi:Yw:ik:NQ:El:Fm:VJ:RF:EM:oR:Ny:B4:Um:Vx:Ow:bn:vC:SH:St:i9:qF:cb:1D:LN:EC:dn:LX:SY:ML:GE:DY:WS:Wp:X5:bq:7C:nF:ve:Gf:9z:pP:la:TV:ZY:MW:iV:Ra:dB:3s:Qv:Xw:lK:5S:Cx:je:i5:bT:1S:NM:or:dh:qm:ZB:cc:DW:qW:OI:D7:te:vg:VB:0q:Sw:qs:Iw:P4:Wp:1t:Fa:e8:fZ:Bc:tt:SV:i8:RG:AI:zN:gl:Ao:r8:FS:Eb:5K:R8:HW:A5:le:sY:lN:lm:UL:hM:cZ:mX:Vx:61:Uk:yn:jS:69:2P:3a:f0:WJ:QV:3B:cx:19:z6:2t:A6:KO:MA:kP:dY:gy:4V:Ls:Lk:9D:i9:DB:5y:Sb:PJ:ZX:Eq:WF:Q1:73:VH:jb:Ra:dD:Xg:vZ:l6:lC:jQ:1c:c9:xD:R0:4y:Nm:h0:lF:07:K3:bQ:qt:us:wi:F1:e8:mq:m4:sq:q4:cc:jX:yO:8J:tb:MA:bA:cy:FQ:Wl:OR:QJ:IP:l1:qe:mV:HE:BF:uB:eU:WM:iG:Wq:Gh:pX:zf:3B:F3:Ip:ds:xN:1x:9a:VL:47:S4:qO:Zq:9a:SR:3D:hQ:Kh:wi:0H:hh:3d:VR:4T:7N:mL:TS:LT:Ts:IF:wn:4I:KN:dc:1J:4M:h5:FJ:j3:20:Lm:GE:GY:Gi:4p:Tj:Lc:rr:M1:pT:2J:Sk:MN:Lf:2v:mt:rn:Nf:nO:K0:S6:8Z:2r:zS:Wk:2t:S1:ps:cR:2p:ii:Im:Sw:40:l2:uS:gX:J4:Tr:Ht:br:Hv:S3:Fr:YP:IY:hc:Dy:sW:fw:xp:qm:Wg:uP:J4:VK:K4:VN:p6:DE:FY:4D:uL:BM:DH:IH:zt:6Y:Au:rA:I6:p4:ID:Ex:yZ:kh:Sx:zq:5l:hY:bN:wL:7j:gf:99:bO:rG:1O:Vc:gC:TE:Yy:4s:lu:f8:lZ:4c:ik:n0:rV:Aw:zY:X0:4A:fi:ht:CO:HY:ZA:2B:DA:ly:Kr:WD:xx:qT:Ho:22:qU:zF:Pw:2a:hk:6H:jU:BS:SB:h9:mi:tS:lz:Vi:iT:ie:3U:YW:ii:DX:yp:T2:2L:c4:tV:uN:HB:yT:0B:eT:tN:Vs:og:k4:cm:rK:oQ:JV:40:2z:Vd:H6:1e:Dx:gt:pe:6D:46:AS:qb:r4:B8:wR:of:pm:K3:D3:OU:nf:E6:Zg:aQ:Cr:Pf:pB:em:Dw:oQ:pp:Xp:NQ:zZ:b5:n4:Yi:Er:F8:Fc:Zr:cp:ev:Mj:j2:F1:gp:Sh:3q:v8:oC:SO:Er:ca:IZ:K4:T5:EQ:8x:ko:8r:3R:Cp:aO:7u:6r:BB:Un:Dq:00:2a:bd:FT:Zj:Aq:PZ:5b:TY:Ij:uq:3a:c3:Zg:Bo:en:ls:7I:6k:Wd:dX:Ra:ck:6R:VL:Nn:dH:9M:1v:OX:Fx:Kt:xi:9l:b0:kl:Zk:kU:LN:kX:gD:3Z:7e:4w:au:7d:v4:B1:cJ:WY:bE:Vj:j1:1W:X8:0e:LB:a6:7C:Rp:jy:0f:6f:hj:TK:oV:wy:G8:xS:h3:4a:qx:w6:TL:eZ:js:3e:oK:jy:LR:MK:st:WD:oe:NM:uW:B6:mQ:x5:CQ:r0:nD:Ry:qN:rz:VI:rh:zf:Nb:lo:5Q:Ez:Ve:TV:wB:ab:Ur:eV:q7:jM:0i:BN:0N:xR:oh:Ub:41:4T:x8:Z8:JK:Li:Oh:do:1K:av:oJ:hp:Dk:dI:sO:hs:4I:Vy:Lf:3S:AK:i8:jE:XC:vd:al:Iq:uv:Df:gA:tE:cy:We:Im:PO:PX:si:OU:Hc:oh:Zb:7p:36:1q:tj:uz:wH:yU:vq:vW:p0:Zp:n2:5v:WM:la:TV:Y5:sj:QN:MK:0e:wU:6f:KG:MS:aU:Fs:rh:Sl:PH:Gw:l3:kM:tX:RN:AH:o8:5B:Hr:lq:7I:Fq:KG:DN:Wx:Jq:wZ:rI:g5:hF:Ks:HG:NJ:to:x2:UG:sF:fO:BX:MD:MU:RK:PD:jn:aA:nK:3R:mi:WW:5c:G3:Cy:1y:yA:sZ:99:RS:4P:SU:uJ:mw:g3:qv:Ry:UL:Y6:NK:Ny:4m:PJ:uc:Dv:W9:jt:Dh:tM:mB:8m:Kj:pT:lr:4l:5D:3K:lQ:jL:Mr:WO:7c:Ya:Kf:gc:1D:XZ:7Z:vm:Gy:Hr:oF:uu:hp:8d:oZ:0z:qy:zZ:oV:kW:MP:EL:1W:PF:sY:3Z:T7:Fu:q9:lS:I6:Wd:cV:2P:sP:Pc:RJ:3i:Lq:QE:xR:Gg:eU:Rg:i6:Eq:fy:4D:xU:Kr:GK:6P:H4:N6:BR:XF:4n:8t:N3:GV:VS:vF:2u:AU:mr:LZ:d6:6O:Df:fK:PP:L4:4Q:Y9:g2:he:Ty:59:MO:sZ:G9:ql:Ob:6K:J0:HZ:Lw:JK:3u:qV:Q2:mW:jz:hh:9x:aM:T1:dN:hm:Rq:T4:yo:Tg:NY:7R:Lt:iE:0a:Av:ew:QU:2r:Nd:u0:UC:Go:KK:8v:MQ:LK:d7:6N:SE:3f:qo:VG:Hr:0L:mm:m4:Se:0l:tX:5E:45:ch:Fi:Q2:zr:15:66:oJ:AV:j1:X3:Wl:jF:3Z:yJ:5S:8Y:mh:O3:qn:m6:Ei:jW:Sp:Xu:tB:sR:Hj:TH:wl:hI:SC:DA:uE:5L:se:Pw:pP:ko:8r:S7:iu:G5:Sq:9L:Jy:Qr:50:Vm:IA:ih:YY:Gw:69:YR:47:Cj:aQ:iM:aE:lH:aF:eU:q7:vq:1V:sd:q6:Cp:ee:Fw:gW:tL:Sd:4M:zM:8V:Bu:NH:ND:8H:UW:El:4s:7u:0V:Rl:9d:n0:qp:Sk:zV:ni:85:7x:oq:JL:zX:OO:sP:jx:tL:yV:YF:Oj:Y7:Bd:mp:f0:8o:fV:PM:EX:lN:WT:f2:At:5i:V0:uh:yq:bh:pj:8i:5o:Ew:8p:Ak:Os:VV:CI:uZ:3d:Kk:GV:ci:Kf:Fb:S9:qU:DQ:6Q:4y:Ld:jB:YP:zn:pu:Rp:bh:zm:z5:rw:xv:po:xK:ls:6N:cx:M8:TM:Iu:aV:4x:7a:tX:Dk:lg:Dg:au:rl:dx:pJ:dq:ny:mu:C0:fd:02:Qk:4Q:sy:Rk:Ua:O2:4D:N2:84:Yi:fC:mO:4L:2W:y7:wj:YV:2t:8U:Er:Vn:Xf:QQ:sS:Ed:D0:Na:DZ:Ea:Ta:j6:rC:up:1a:Fb:CV:q6:0U:HY:0T:Kn:Qu:FZ:HE:xy:pl:Si:uT:id:bF:QP:QT:LT:CY:0k:iO:PS:uN:zd:AC:MB:tf:Q7:3a:Wf:Ed:Qi:9g:8q:y4:A9:x0:Em:fr:jg:Dy:Ue:Yf:ff:yo:VG:do:fs:TY:o6:eJ:NV:SP:9I:0F:mo:Ur:NT:Gp:GQ:CV:o1:H8:tl:ZW:I9:rf:aO:w4:sK:Vc:wA:5W:fR:WF:lp:x9:jN:93:lw:Rx:Gh:mz:n5:y9:9S:jA:8y:0s:CS:St:sl:Vm:82:Fm:qE:eM:0y:MW:Po:gf:ED:A5:1v:kR:ss:du:Z1:Mu:79:R1:Sa:0s:VI:8e:Lh:cJ:il:Y7:o0:6d:6U:Sj:xu:5h:4W:Es:3H:96:uT:cZ:aM:BK:Jw:ZO:Ks:3a:th:nR:tc:Sk:jD:9U:nR:tl:PH:ZS:9g:yU:nl:fW:jZ:Nm:4c:0i:eD:yU:I0:TC:Ms:1u:6Q:0G:HW:07:B8:wp:JK:9h:wN:8k:up:y4:zl:4d:P3:P7:wA:M9:4e:J9:kp:4N:QB:Oa:Tk:AJ:1L:uT:tl:DG:5O:dF:5a:Et:27:1T:2M:2b:FM:2S:Ot:Ah:Ik:wL:ua:5S:30:9T:Qe:M5:kL:MX:mr:Hg:3w:91:MN:Z8:Vy:e6:pE:FZ:XE:H0:T4:qZ:S3:kh:p9:EA:LK:SV:dF:9k:mg:kB:w4:ML:EH:5s:Es:4l:jw:gj:Fz:bK:pw:ET:qn:Gr:2M:6q:jm:YI:44:Wx:0K:VV:8Y:QP:TS:sI:zq:zJ:JA:tv:YI:Sc:Ra:fz:a8:t8:NN:ft:Xe:dd:9n:dh:RK:rl:hC:kd:n9:bd:WX:in:DG:Rn:Qm:Wb:BP:9t:8u:69:VM:df:F8:i7:E5:Fw:A8:sv:dz:Ew:JK:7j:FA:U6:Tj:x8:uA:Qb:cP:KC:rZ:DS:Xt:vM:rx:Ay:Ys:4w:Xv:hn:Mt:Cq:qT:NJ:WO:5x:ZZ:1V:R3:U5:bq:FM:MX:OG:3i:cQ:FX:jA:RS:zr:Bi:Wh:Ry:Ps:u9:UL:gL:dR:68:If:mg:Vz:ya:eH:sn:XK:0G:eK:T2:M4:Fl:i4:dg:vb:XS:29:8s:0e:Lr:WI:k4:m2:f0:Rt:ol:XG:qS:H7:FO:vd:TQ:sv:lZ:Dt:Uy:qt:TB:Af:aT:37:Di:B0:ki:yK:ZN:tN:6j:UN:TV:jt:Dm:33:sH:QF:Oz:Wv:PH:2b:yU:Ov:lQ:t6:7g:Wv:w4:tb:R6:qw:JC:08:1a:AF:AE:q3:Du:GH:sR:Pz:py:OK:48:hj:Tn:u3:Va:zF:TI:he:Dk:BK:Bp:86:dE:wY:1N:tE:Ev:EB:So:k4:Ef:9P:0e:Cf:8G:Fm:k5:tq:5D:vn:3T:6G:vS:Nc:RY:82:8N:2r:xN:KF:ff:dY:Fy:KI:gI:tg:tV:2i:bh:5K:Tq:p9:UD:B9:WH:VW:DT:D9:UN:uW:Mr:kB:zy:ow:ed:xx:kL:eO:Er:Up:tW:JS:Qx:hb:JF:Pb:QI:jX:sr:c0:2F:iB:S5:FL:10:0U:GR:0C:wz:AG:g0:mv:OT:KY:Ur:Gh:7m:Qt:tb:Qn:Xy:yR:SN:Xz:Ja:DG:OS:Fh:Xy:z8:lK:w4:hN:it:W0:sE:Uq:nc:aK:6p:6D:6e:lJ:aG:G3:Pb:mn:tW:EW:I2:3Q:A7:rA:Kf:Bs:K2:8z:xV:cD:HU:EG:Tr:Pb:B0:RB:qt:MZ:NY:AV:bZ:gT:7E:8G:KQ:1c:4B:yq:Gn:s1:IE:ws:Kb:U8:XD:T9:4t:41:E6:2C:gL:At:DO:Fx:lI:aA:hc:Y0:oZ:ZT:XZ:oH:aa:N5:Pl:Ix:Qz:7E:RM:9M:xK:TY:F5:nY:Hv:3G:7D:kx:rx:2K:pO:O5:tp:U9:Jp:f7:sD:Ut:gn:Wj:5r:IS:eV:Oe:MM:Tb:rn:nN:2P:PV:jg:5q:Su:uO:VB:vs:fx:r3:O1:Al:py:xr:RM:Nl:wI:0R:30:9g:HY:6d:x4:uF:PO:3h:qx:9m:e4:Eq:jt:lW:d1:GG:xH:Om:mJ:w1:Yb:Pe:nA:b6:Z8:4r:Ob:3a:c4:0o:LE:gk:tf:ZN:4c:R4:Qd:Lx:ju:GT:XN:dt:k4:yZ:V5:2m:L6:tC:9O:SK:Ds:Ky:f0:bg:AL:fg:aU:NF:vC:NG:Fw:wt:gG:b8:NC:ip:v2:OW:np:qR:cO:Hl:lj:g2:U0:a6:Xh:To:aB:HM:6Q:hp:MU:ya:Jm:RQ:Np:G3:Qn:wm:c0:1i:xv:uA:IK:Dz:Yp:bE:sH:2v:Np:80:Y3:2D:VX:bd:zh:Iu:es:wh:a7:TE:Vr:iH:vg:g5:jS:kG:Fn:Mk:78:lD:CB:Os:o9:M8:wk:w4:oL:61:Wa:eT:Fk:Ci:Xj:C7:sy:r7:rI:bF:JE:WT:ku:Ay:jc:wf:dG:po:ox:qU:A2:5W:B7:Fv:Li:Wg:B8:ED:Yr:ga:BM:PF:Ic:Gx:J2:NF:ZP:bO:Vs:Uj:W7:Cc:tw:Si:eN:wt:eh:T5:oT:b2:r8:VM:3W:ZH:Qs:xx:iU:fR:ky:OQ:rE:4O:y4:5T:LF:zM:S4:LI:8v:DN:fS:lw:V8:SZ:MS:GX:pK:fM:Dx:Lc:LM:5X:WI:yA:3u:hv:y7:Yz:q9:9u:a4:HF:6a:zh:3X:kP:7X:IZ:q5:7t:bP:jg:D9:bF:tt:8f:mN:Py:gQ:Id:Lx:NF:zt:kj:4N:IB:y0:Qi:VT:m8:xA:zq:Vk:IS:tm:Tp:eM:n8:Ur:hi:pg:pg:CF:FL:0H:Wn:R8:wy:Sz:FQ:I0:wU:dS:p1:Pz:w1:g5:zY:pC:Ph:Wq:kI:XB:v1:aE:60:Kz:3Y:OF:Gr:ll:my:un:xD:eU:ot:DA:X7:pD:Zw:Ss:5l:JH:nH:XJ:oZ:Vg:0r:Nw:o2:Q2:ba:Hz:uz:fb:JK:m7:Im:ra:n9:QE:M3:lQ:W5:2Z:js:cu:uV:FD:Ep:6z:uo:IF:8P:UQ:55:Jv:gW:LL:2A:dO:l6:uY:g6:G4:HL:fC:9H:3h:bw:xT:Ip:46:Bk:wU:H9:Wy:yc:W4:jA:Af:aD:0s:vq:Iw:tZ:p8:wu:N1:mz:wL:em:Eq:IQ:VQ:VY:pB:x0:Un:zB:DR:Ji:27:FL:MW:yD:ZR:0N:Ku:69:yr:eU:ms:Mf:oX:aP:YN:H3:Oe:N8:3M:vM:h3:yY:hc:Nj:0J:1W:VX:QA:lM:zI:n5:Qz:RL:S1:Fl:oA:Pi:ym:VT:CA:A8:OO:f8:Zh:zF:U2:pR:2u:GW:1a:2w:sl:tB:nY:sP:n4:pe:Jk:zj:KZ:EO:xo:jT:VW:Zt:iN:EK:J6:nb:76:md:ew:SP:Bk:t9:ma:mu:sf:gh:rT:zB:Wu:lL:n4:6j:TN:Jh:Oi:s7:SY:qN:mO:TT:fU:dF:U7:os:lk:ii:kK:pv:OW:6p:S8:rn:AW:LX:jE:va:d6:v1:vW:l9:kF:Sj:zT:8c:Wc:fc:aF:XG:Xk:Qn:NU:xZ:6Q:iY:fA:KB:Ve:3V:75:4n:mF:WS:U8:fD:F3:2F:x4:HM:BU:4O:RL:JS:aj:GT:cb:gA:Nm:C6:Jm:QR:0f:6o:5v:iX:hG:rq:S2:1t:QO:HC:Zo:Hq:3M:h5:vT:EX:l0:m5:Wz:mH:08:ja:We:Hc:Ud:9O:hM:86:Ic:AB:Sn:xv:oP:32:l2:x2:UR:IZ:XO:Zu:sq:td:Um:GB:Vi:60:GH:NR:oE:J9:dD:fX:Lz:6B:Xq:pu:Ft:Oo:ka:sG:um:u3:lH:ye:RG:Rn:Nc:fo:PH:4r:HA:1N:ef:Ec:83:7Q:CV:eM:de:pq:Er:6K:ku:pm:gc:9U:Jw:jt:zy:Mg:WW:iL:MV:7L:15:sw:LP:CM:3J:Vu:OG:Ry:4H:ij:0K:fr:XP:E7:2o:cL:wH:Vb:0t:SO:99:q6:GB:BY:DO:4V:3t:l3:Ci:06:Sd:wH:Z1:fJ:qs:Mw:Gp:UY:Dn:Hg:nQ:yg:6R:vz:8I:yz:Xv:jZ:dD:OS:Xp:G7:F4:Kw:en:JJ:7w:aK:pc:bj:vQ:zG:Oe:uH:xJ:z1:vU:nf:7x:gS:ID:K9:ka:ny:Rg:ri:tT:T9:2i:kd:a2:z8:7B:qE:km:MX:Uw:Aw:4n:oN:5E:Vi:zk:Jw:b9:vp:7d:Ge:jV:wR:dI:CV:AQ:ys:uS:sP:oc:kE:nx:7E:V5:Ul:nK:TF:5g:qR:UK:Aa:XB:K7:Hi:ZY:sR:U3:pI:PE:Sj:kl:EW:jq:Ou:fK:8p:BG:OM:Fg:7z:3L:7a:7K:zF:Co:wS:VX:Wf:pp:Sq:hi:5v:k8:4l:Pg:Pm:qn:Lp:Y0:Ot:5h:bN:VV:2j:Zy:c0:3p:lS:8o:gZ:n1:n5:tT:wK:1v:is:xu:3l:ub:u9:69:Hw:Hq:3w:0Q:7L:37:BC:gV:IX:oN:KQ:y1:E7:8d:Hl:fs:su:md:qK:uI:Mm:yE:xA:b9:vY:wz:GK:fP:fE:Ej:Tb:Eu:cp:85:5G:Ee:3t:6q:Io:kL:IY:CV:qA:eG:7O:Lg:2v:IY:2k:jj:Sc:Cs:3c:ai:kO:qJ:JE:HK:bQ:ot:yq:bV:ns:wv:N4:TU:Ri:Y0:Lt:bf:UE:Q2:Aw:19:8b:WA:qo:0s:gq:2E:vI:n6:F4:rS:ka:VW:rr:Cz:LL:3s:ri:Z0:L2:07:N1:Q3:rH:0P:T9:8J:Mu:eO:2p:bG:Za:rT:2M:zt:6c:V1:IR:Lh:dR:Rr:8Q:18:p4:HG:hK:tq:Kp:oz:Zz:EY:aq:Xs:Wo:VK:DE:wS:Vc:v6:IH:tR:hC:C9:wD:qe:2H:Ki:id:Og:Gs:wm:h8:GR:Xm:Qc:wk:Sw:Rr:wU:mC:VN:mO:B4:PO:zK:72:UH:Ni:Tl:2t:nf:UA:JK:OT:Xl:MA:O0:Ht:JO:Ya:Cr:xg:js:oH:fJ:xe:h4:zK:49:Rm:kE:Dy:Lp:7R:Jn:4J:ek:CJ:ZF:j7:rR:XW:XL:px:Mc:wj:Z0:A0:oN:ZI:Vf:uE:i4:fc:Mn:2k:7E:32:bu:kw:ze:WR:Hm:2l:mC:3X:c5:RU:te:I1:XT:sq:A3:6F:Lv:pj:aq:1t:j9:r2:Fj:mk:Jf:19:sw:RN:dF:HM:HO:sp:K9:DD:YC:wL:6N:Uv:Cl:Yh:Yg:0S:2e:9Q:yd:RV:VW:73:l7:jE:SM:SN:KM:zY:a9:Rs:5A:8I:uK:lJ:iF:O1:yf:04:nY:8X:X8:FU:Qq:CC:4U:ha:Fx:19:cR:ht:8B:TJ:33:SH:hi:nw:jh:EP:sY:wq:av:Fy:aR:Uj:WG:bP:Hy:j9:47:jD:pn:jW:21:Kd:om:X3:dI:CZ:yy:cq:Aq:Mf:3l:N0:UR:9q:QY:yx:Q0:3Y:xU:DJ:N6:Ij:wS:NZ:UD:gy:Nk:Dk:89:rz:Cu:RR:I1:hW:u6:6W:nM:0P:p2:m7:u5:zo:Ls:Yh:x6:3J:QJ:t8:yG:HL:Gf:XY:hJ:yK:U9:vh:Fy:HW:n6:bW:4D:6M:rM:ew:bX:mw:SN:FT:XV:1a:uv:I9:Ga:A5:ka:ra:at:au:be:03:eH:13:GO:Fv:B8:BU:qI:mm:yl:aQ:RW:06:Xd:pE:lL:6L:V7:Eg:5q:aB:w4:w4:c4:JX:Hn:fW:Mv:oF:XB:yi:gv:Py:9p:xX:Ee:Cz:L3:fN:f4:Uf:ca:0h:bg:SI:Ky:7G:BO:ya:PE:9c:Ew:4I:4U:sQ:rf:I7:Q0:Hm:Vn:wU:jl:fe:Nc:mU:XC:kC:eD:2D:NI:qr:Fu:1o:g6:bK:S5:eP:c0:eS:v6:Uu:FJ:Q2:uU:vp:uy:ue:oG:Gp:jL:yz:lw:2F:jU:VG:Mj:Yk:v8:il:Ob:H3:VX:xx:tl:sh:3p:Dy:Bg:az:ly:Fs:Jy:bJ:UC:QO:9d:6j:fP:Nx:lZ:it:n6:hK:Re:PX:sA:K3:DF:FW:Kj:ex:w7:m1:VE:mI:c8:7A:cI:6U:zo:6o:Er:iv:qZ:lm:cD:Gm:po:4M:RK:Id:7C:gX:ZS:oD:DQ:pL:3Q:7R:MN:lH:Nx:dC:qj:Kj:HD:zh:Fz:W6:Cq:1b:Ia:3l:O8:e6:8x:aj:a4:A7:zd:Gi:2o:uQ:CZ:3M:6z:gP:SD:6C:PJ:Uz:2n:sm:gM:5v:E9:l8:hd:oa:TL:wR:Em:oX:If:aS:2a:VI:TE:fn:AG:qa:5a:av:xb:0Z:nr:cx:Yz:vX:Nx:hb:83:eR:KB:2D:0h:CJ:Ic:n1:cR:Ut:OZ:2s:Nt:de:YZ:TI:LU:vx:B2:fz:MV:rS:S4:sh:gn:MQ:7n:Xq:Ai:0m:Eb:vG:4o:6Q:lL:a2:8Z:SP:Kh:T9:ZU:ep:ky:gc:KI:27:nC:uo:uT:Dd:2t:qV:cp:21:bN:a6:C1:W5:4n:ND:kw:s2:1y:Mk:fn:5q:Qb:7H:W3:WE:3C:gp:3v:mI:gg:PB:2W:E6:7z:IT:Il:lZ:nq:BH:0C:wc:nu:XE:1S:bN:WJ:JB:rl:AZ:xR:LG:3r:IE:Rz:os:BY:eK:GG:VC:jn:OP:p9:yX:6d:P2:xN:9D:Oj:Xl:WA:5L:SD:dF:PZ:vh:qP:Ee:EM:ZL:Ku:SX:63:mQ:B9:Re:KZ:bg:aE:cW:Ys:qH:z7:Iv:IG:Bh:7x:Ci:ll:1S:IN:8c:uB:bk:On:OJ:OV:lu:Ug:U8:3C:Q7:ck:Lk:Hs:Vy:mN:8P:9W:RO:9P:H2:Og:Gy:5W:Mw:UI:s3:ql:3J:hx:9G:H9:iB:tx:Sb:mi:8a:tK:ZF:wr:EC:r1:Cx:FH:47:wp:uq:MU:vR:P3:uO:X2:9y:2m:ah:Yu:Q4:4G:T0:8v:oF:oI:Dq:4s:kn:6H:gS:4h:4w:G0:90:IU:rb:9N:ax:cE:aD:mK:8w:hI:bj:AN:we:aL:va:Xu:7D:ZK:9P:fj:Un:AJ:YL:kj:UU:tL:KK:2z:tX:Vn:ne:MR:uV:Fg:YC:al:rn:5Y:F3:FL:h0:CR:16:09:q2:MW:EP:DE:Ca:uX:yW:bF:8T:qc:e0:rf:uF:lz:VU:6P:uA:cE:fD:mM:q7:g6:IC:2u:QF:TC:mg:CO:Gv:p6:Eb:MY:RI:8M:sr:rm:2Q:qV:Pi:sR:nS:BC:la:2B:ki:OK:WA:Wj:in:8w:MJ:3V:2L:yy:QA:l3:Yv:Dy:Ax:J0:kD:Uv:z4:9O:Jv:Zg:dj:tm:NX:3q:57:ty:lM:DV:cn:SC:Zg:TT:wr:XX:uv:Vf:Ft:Js:xg:6L:0U:fj:2t:X6:3d:6p:xW:NM:p1:d2:ID:cq:5d:uV:IL:fG:oM:SK:Eh:oT:SA:Od:au:dS:6y:mG:iw:Jn:9H:Rl:iy:9K:AR:X4:dN:xI:tC:lR:eK:ew:93:se:qk:LC:Tm:1I:zD:4S:eK:6v:Yq:Ha:8K:Eq:AN:Qy:Hl:TM:WO:do:ee:EL:QO:wL:bE:pa:UC:Gh:Uo:Pf:FK:p7:yu:BA:mZ:pb:ST:0f:Ln:wz:ve:bv:cE:UP:Yh:vq:ob:Bh:n0:8s:ML:d2:GP:1U:Nr:fC:L8:bJ:kM:Bf:2j:YO:Jl:p1:XG:Qy:yf:MM:RG:zV:zu:vQ:mu:2A:En:FO:wF:B7:qy:yn:Qu:BQ:UE:0Y:06:nX:MW:J7:2j:Js:Eo:CR:4s:b0:Rp:99:W7:su:vS:TN:w0:v1:U6:a0:cK:G0:8H:us:Yr:k0:G1:lx:SA:nB:vg:Ra:00:Dw:Zy:qT:O7:Wz:5n:RZ:u0:Rr:QB:Om:Bm:4y:wF:01:w5:vc:xy:bT:iw:Wb:ao:xS:oJ:ao:zC:Qo:Gc:IB:M8:1o:Lp:ur:pQ:NI:Q1:ju:er:vn:z8:Po:aj:Rj:Ay:yW:KI:HD:a6:dC:2a:ch:C9:0n:UW:yy:QO:iz:WP:mq:14:x2:M2:jT:Bv:wX:lf:ll:rm:mj:7t:iQ:0l:LO:ug:tH:6k:fn:qv:pV:BZ:45:wr:Ia:qQ:WB:f9:bP:mT:OP:P1:dN:Fy:0O:9s:GI:Mz:4B:8L:Sy:uQ:L0:k1:j0:0R:Xq:63:mw:Aw:0S:OO:cp:Mi:8W:U5:u2:ci:sC:9y:qM:HS:kt:Fz:f8:qW:KJ:qJ:AI:mq:xf:yl:au:Zq:9p:Bu:15:JO:Ms:1J:fq:cX:73:rz:Wf:Vp:Ex:Fw:5b:ma:Bx:DH:k7:0v:T6:Ct:6Z:Tr:zD:EJ:a8:Ys:MS:4q:7W:55:wa:MJ:jP:wW:zD:AR:i6:9p:LJ:sI:K9:05:ph:wZ:Z6:mn:D2:V4:Ux:l6:o0:kA:Vz:OG:PM:e4:MR:qk:ol:2O:Qc:Qk:FB:nF:E8:TC:sN:IX:Z1:59:rD:Q4:PP:hC:xR:AN:QT:Sb:wc:kz:cc:vn:S4:Jz:4D:cG:Pd:hG:gs:v1:w5:yO:5N:cU:5Q:N5:RF:Tb:Ay:S3:A5:Ve:wt:7y:zh:35:gx:Sv:Gs:ll:Hn:Iz:HU:ah:S7:bk:Bo:dS:n8:aT:H3:Na:s4:tY:O1:Rf:L9:YN:ce:Fh:6B:Xu:67:gi:yb:eq:qY:cC:zh:x3:nI:vx:2Q | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	Ȱ�'U�*����ؑ\������i�(���{��LX HΆv���_d*�Y���9ߝ�0���b}7��2O����,�kv���t��G��p��=Ө��t~���Tj����M��5F���u=�k[wwɁ�=J��k�k�ެ������q�����ч�D�.�K���a�X`�}˟��@��82�g�#p;|vH+�b]�1,.���*�:
���q�D�TP�����I
4E�U����w40��^D(](�A!�XA�
K�qَv���hw��j=?��xˁ�}m:�2���DA�D&0���]��4ֲ=`�
e���/4��)�<�cEV-Ў�i�J�?�G�mo�g���z�����~*+���hUbx�ψ��C��e�PFư8ܬ܀�뜭�����O���J*?�f��M��<�=��t��7���eQ�Y��WW���i���dw�1���2LX�4�!2!��s"R��}#F�dQ;δ|S<f>0��x��5]��r� �Տ�6�����u �V8�Z0��)�^N���1N%�e�@�P`���k(m�+������Ӱ�l\�J��H(���McY�T�瞐���#mw).�݆�J�[��qq �2��<t�"�2<:�a��B�c,�_�:#�6�'���7������E�s��ҍ �)p��wѩ�s�%a�����IԦ�J��_R�CI/�ZMO$Y���+��v ��$�Λ-2�#�ք�f��ӛ#�w�8�k���Kk�!A]�P���m��i�N$2P�a���8��1K�j��tH�����P���f� �������p;'gl���-�6*��G_��^��(�	�5���2j�ֽ30��5ɩ��=�_e!�3����Uju sNF_bp�MpؐP��g��T��'��]�;X�ݻ���e��$��1�΋֞���
�X����'���(V�'9@��q���$�Ozo��I�K��`����U@6�B@��3��Y�
��{��g���$>������|ڔs�V 7~�,�ES�]����X�����/vښ	�֛B�I"9̆\g��Ե}\����_'�C�u�?��Q��,m	葎� �t�QJ9)�i�������F	(u�%�@(7X��Q�����P�W���o����b�&�ٵ�����(�
g	2�����7%¢�˹F�g�ʼ��R��eS9*�D&���&��s4��K�+��sdO5�^M�=E���P��Qfr�Le��ba�@��Hs���Gז��9���wpN�$�%�,୲�ZQ�B/5v�<�iVqu�+�-�Wtd�a���xD�f���d�
՛أ��L�@.h,��Sk��GL�n��qe	��!o�;F�%�����Nň_�嫳�uu�ê�IAk�;'����J�	@�Z*�S=�&D��LA,U"���k"Q~��l�P0I3�=������ɞѧ��IG�3�^oK���]�+C� j+��1���@3�t?�+�jY�>+��>l����`c�����>�z10i��O7d�qP*�?�91F�,�v����k��A���R���B"R�$;�Jw5(T��������l�pUaO��BȤ$�\�F�N�s	Eh)�k�Qӓ)M�~B�k����h���.4�)r����dl,:2�J:���x���!T�e�f���؝٦z���1v���OAիq���>�Rߓ���A��xs(U/9�P�����Grj�.k�o.�$`#����������<_]{���g�G�l�;w�F�i�~z�Э���]p�=�ݛ�x�.#�Z��؂_��z�e�Z�kQ��
��a�ܨV�lΗ�v�O����K�]�UM_�U%�\N�Zۮ,���%�T�Q?9��e�*���0�Q�2�����.RL�v��ұ��ڻ�=h%�,��[KD�b��C;�H-�z�4\��P\M���z$���������AhS� 㹒�}nBP�nX;�Tk�S!	�>�i�F�O�T��ѫ[z�9���e��J�ش�x��D��O�Y\9�F����X�(3ʟp(��`�S��#� �B}��� ��K�_]zp{�y�'S"����J�;k	�me]:� 	d�i�.i��q4�5m�<(���O�vj,�Q���)#'
d[���A%z���[�k�Zw��v�b�7�?^&� ��ЉH�X��zY�U���ǈ��\�.L,"�����q�Az߲�K���������L핕U�}\�Na��Y�W]�L�䅌�봇fj�4����Y�h�tws6�>��3^����Fg7