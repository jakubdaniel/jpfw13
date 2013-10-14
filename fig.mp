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

  drawarrow ((fullcircle rotated 180 scaled 0.75u shifted (0.5u, -1.5u)) cutbefore (fullcircle scaled u shifted(0u, -2u))) withpen pencircle scaled 1.5 withcolor darkblue;
  label.rt(btex \small\sf\bf i++ etex, (0.8u,-1.2u)) withcolor darkblue;

  fill fullcircle scaled u shifted (0u,-2u) withcolor blue;
  draw fullcircle scaled u shifted (0u,-2u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\sf\bf i $\ge$ 0 etex, (0u,-2u)) withcolor white;
endfig;

end
.
