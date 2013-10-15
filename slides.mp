verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}

\begin{document}
etex

filenametemplate "%j%c.mps";

u := 30;

color blue; blue := (0, 176/255, 240/255);
color darkblue; darkblue := (0, 112/255, 192/255);

color red; red := (240/255, 0, 44/255);
color darkred; darkred := (192/255, 0, 28/255);

color gray; gray := (192/255, 192/255, 192/255);
color darkgray; darkgray := (86/255, 86/255, 86/255);

beginfig(1)
  drawarrow (0.5u, 0)--(1.5u, 0) withpen pencircle scaled 1.5 withcolor darkred;
  label.bot(btex \small\sf\bf i++ etex, (1u,0)) withcolor darkred;
  drawarrow (2.5u, 0)--(3.5u, 0) withpen pencircle scaled 1.5 withcolor darkred;
  label.bot(btex \small\sf\bf i++ etex, (3u,0)) withcolor darkred;
  drawarrow (4.5u, 0)--(7.5u, 0) withpen pencircle scaled 1.5 withcolor darkred dashed evenly;
  label.bot(btex \small\sf\bf i++ \ldots i++ etex, (6u,0)) withcolor darkred;

  fill fullcircle scaled u shifted (0u,0u) withcolor red;
  draw fullcircle scaled u shifted (0u,0u) withpen pencircle scaled 1.5 withcolor darkred;
  label(btex \small\sf\bf i = 0 etex, (0u,0u)) withcolor white;

  fill fullcircle scaled u shifted (2u,0u) withcolor red;
  draw fullcircle scaled u shifted (2u,0u) withpen pencircle scaled 1.5 withcolor darkred;
  label(btex \small\sf\bf i = 1 etex, (2u,0u)) withcolor white;

  fill fullcircle scaled u shifted (4u,0u) withcolor red;
  draw fullcircle scaled u shifted (4u,0u) withpen pencircle scaled 1.5 withcolor darkred;
  label(btex \small\sf\bf i = 2 etex, (4u,0u)) withcolor white;

  fill fullcircle scaled u shifted (8u,0u) withcolor red;
  draw fullcircle scaled u shifted (8u,0u) withpen pencircle scaled 1.5 withcolor darkred;
  label(btex \small\sf\bf i = n etex, (8u,0u)) withcolor white;

  drawarrow fullcircle rotated 180 scaled 0.75u shifted (0.5u, -1.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  label.urt(btex \small\sf\bf i++ etex, (0.8u,-1.2u)) withcolor darkblue;

  fill fullcircle scaled u shifted (0u,-2u) withcolor blue;
  draw fullcircle scaled u shifted (0u,-2u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\sf\bf i $\ge$ 0 etex, (0u,-2u)) withcolor white;
endfig;

beginfig(2)
  drawarrow (((0u, 0u)--(-1u, -2u) cutbefore (fullcircle scaled u shifted (0u, 0u))) cutafter (fullcircle scaled u shifted (-1u, -2u))) withpen pencircle scaled 1.5 withcolor darkblue;
  label.ulft(btex \small\sf\bf .f etex, point 0.5 of (((0u, 0u)--(-1u, -2u) cutbefore (fullcircle scaled u shifted (0u, 0u))) cutafter (fullcircle scaled u shifted (-1u, -2u)))) withcolor darkblue;

  drawarrow (((0u, 0u)--(1u, -2u) cutbefore (fullcircle scaled u shifted (0u, 0u))) cutafter (fullcircle scaled u shifted (1u, -2u))) withpen pencircle scaled 1.5 withcolor darkblue;
  label.urt(btex \small\sf\bf .g etex, point 0.5 of (((0u, 0u)--(1u, -2u) cutbefore (fullcircle scaled u shifted (0u, 0u))) cutafter (fullcircle scaled u shifted (1u, -2u)))) withcolor darkblue;

  drawarrow (((-1u, -2u)--(1u, -2u) cutbefore (fullcircle scaled u shifted (-1u, -2u))) cutafter (fullcircle scaled u shifted (1u, -2u))) withpen pencircle scaled 1.5 withcolor darkblue;
  label.top(btex \small\sf\bf [0] etex, point 0.5 of (((-1u, -2u)--(1u, -2u) cutbefore (fullcircle scaled u shifted (-1u, -2u))) cutafter (fullcircle scaled u shifted (1u, -2u)))) withcolor darkblue;

  drawarrow (((1u, -2u)--(2u, -4u) cutbefore (fullcircle scaled u shifted (1u, -2u))) cutafter (fullcircle scaled u shifted (2u, -4u))) withpen pencircle scaled 1.5 withcolor darkblue dashed evenly;
  label.urt(btex \sf\bf .num etex, point 0.5 of (((1u, -2u)--(2u, -4u) cutbefore (fullcircle scaled u shifted (1u, -2u))) cutafter (fullcircle scaled u shifted (2u, -4u)))) withcolor darkblue;

  fill fullcircle scaled u shifted (0u, 0u) withcolor blue;
  draw fullcircle scaled u shifted (0u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\sf\bf \(\text{ref}_\text{1}\) etex, (0u, 0u)) withcolor white;

  fill fullcircle scaled u shifted (-1u, -2u) withcolor blue;
  draw fullcircle scaled u shifted (-1u, -2u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\sf\bf \(\text{ref}_\text{2}\) etex, (-1u, -2u)) withcolor white;

  fill fullcircle scaled u shifted (1u, -2u) withcolor blue;
  draw fullcircle scaled u shifted (1u, -2u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\sf\bf \(\text{ref}_\text{3}\) etex, (1u, -2u)) withcolor white;

  drawarrow (1u, 0u)--(0.5u + 1.5, 0u) withpen pencircle scaled 1.5 withcolor gray;
  label.rt(btex \sf\bf x etex, (1u, 0u)) withcolor gray;

  drawarrow (2u, -2u)--(1.5u + 1.5, -2u) withpen pencircle scaled 1.5 withcolor gray;
  label.rt(btex \sf\bf \(\text{y} \sim \text{x.f[0]} \sim \text{x.g}\) etex, (2u, -2u)) withcolor gray;
endfig;

beginfig(3)
  fill fullcircle scaled 2u shifted (0u, 0u) withcolor blue;
  draw fullcircle scaled 2u shifted (0u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\sf\bf reachable etex, (0u, 0u)) rotated 45 withcolor white;

  fill (fullcircle scaled 1u shifted (1u, 0u)) withcolor gray;
  draw (fullcircle scaled 1u shifted (1u, 0u)) withpen pencircle scaled 1.5 withcolor darkgray;
  fill (((fullcircle scaled 1u shifted (1u, 0u)) cutbefore (fullcircle scaled 2u shifted (0u, 0u))) cutafter (fullcircle scaled 2u shifted (0u, 0u)))--(((fullcircle rotated 180 scaled 2u shifted (0u, 0u)) cutbefore (fullcircle scaled 1u shifted (1u, 0u))) cutafter (fullcircle scaled 1u shifted (1u, 0u)))--cycle withpen pencircle scaled 1.5 withcolor red;
  draw (((fullcircle scaled 1u shifted (1u, 0u)) cutbefore (fullcircle scaled 2u shifted (0u, 0u))) cutafter (fullcircle scaled 2u shifted (0u, 0u)))--(((fullcircle rotated 180 scaled 2u shifted (0u, 0u)) cutbefore (fullcircle scaled 1u shifted (1u, 0u))) cutafter (fullcircle scaled 1u shifted (1u, 0u)))--cycle withpen pencircle scaled 1.5 withcolor darkred;
  label(btex \small\sf\bf error etex, (1u, 0u)) withcolor white;

  draw (0u, -0.5u)--(-0.375u, -2.125u)--(0.375u, -2.125u)--cycle withpen pencircle scaled 0.8 dashed evenly withcolor darkblue;
  label(btex \tiny\sf\bf p etex, (0u, -1.75u)) withcolor darkblue;
  label(btex \tiny\sf\bf q etex, (0u, -2u)) withcolor darkblue;

  draw (0.8125u, -0.25u)--(0.325u, -1.375u)..(1.3u, -1.375u)--cycle withpen pencircle scaled 0.8 dashed evenly withcolor darkred;
  label(btex \tiny\sf\bf p etex, (0.8125u, -1u)) withcolor darkred;
  label(btex \tiny\sf\bf \(\neg\)q etex, (0.8125u, -1.25u)) withcolor darkred;

  fill fullcircle scaled 0.125u shifted (0u, -0.5u) withcolor white;
  fill fullcircle scaled 0.125u shifted (0.8125u, -0.25u) withcolor white;
  drawarrow (0u, -0.5u)--(0.8125u, -0.25u) cutafter (fullcircle scaled 0.125u shifted (0.8125u, -0.25u)) withpen pencircle withcolor white dashed evenly;
  
endfig;

end
.
