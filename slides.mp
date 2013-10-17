verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}

\begin{document}
etex

input TEX;

filenametemplate "%j%c.mps";

u := 30;

color blue; blue := (0, 176/255, 240/255);
color darkblue; darkblue := (0, 112/255, 192/255);

color red; red := (240/255, 0, 44/255);
color darkred; darkred := (192/255, 0, 28/255);

color gray; gray := (192/255, 192/255, 192/255);
color darkgray; darkgray := (86/255, 86/255, 86/255);

def node(expr o, l, ci, cii) =
  begingroup
    picture r;

    r := image(
      fill fullcircle scaled u shifted o withcolor cii;
      draw fullcircle scaled u shifted o withpen pencircle scaled 1.5 withcolor ci;
      label(l, o) withcolor white;
    );

    r
  endgroup
enddef;

def edge(expr o, d, l, c) =
  begingroup
    path p;
    picture r;
    pair a;

    a := (d - o) rotated -90;
    a := point 1 of (((0,0)--a) cutafter fullcircle scaled 0.5u);

    p := ((o--d) cutbefore (fullcircle scaled (u + 1.5) shifted o) cutafter (fullcircle scaled (u + 1.5) shifted d));

    r := image(
      drawarrow p withpen pencircle scaled 1.5 withcolor c;
      label(l, (point 0.5 of p) + a) withcolor c;
    );

    r
  endgroup
enddef;

def nonedge(expr o, d, l, c) =
  begingroup
    path p;
    picture r;
    pair a;

    a := (d - o) rotated -90;
    a := point 1 of (((0,0)--a) cutafter fullcircle scaled 0.5u);

    p := ((o--d) cutbefore (fullcircle scaled (u + 1.5) shifted o) cutafter (fullcircle scaled (u + 1.5) shifted d));

    r := image(
      drawarrow p withpen pencircle scaled 1.5 withcolor c dashed evenly;
      label(l, (point 0.5 of p) + a) withcolor c;
    );

    r
  endgroup
enddef;

beginfig(1)
  draw edge((0u, 0u), (2u, 0u), btex \small\bf i++ etex, darkred);
  draw edge((2u, 0u), (4u, 0u), btex \small\bf i++ etex, darkred);
  draw nonedge((4u, 0u), (8u, 0u), btex \small\bf i++ etex, darkred);

  draw node((0u, 0u), btex \small\bf i = 0 etex, darkred, red);
  draw node((2u, 0u), btex \small\bf i = 1 etex, darkred, red);
  draw node((4u, 0u), btex \small\bf i = 2 etex, darkred, red);
  draw node((8u, 0u), btex \small\bf i = n etex, darkred, red);

  drawarrow fullcircle rotated 180 scaled 0.75u shifted (0.5u, -1.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  label.urt(btex \small\bf i++ etex, (0.8u,-1.2u)) withcolor darkblue;

  draw node((0u, -2u), btex \small\bf i \(\ge\) 0 etex, darkblue, blue);
endfig;

beginfig(2)
  drawarrow (((0u, 0u)--(-1u, -2u) cutbefore (fullcircle scaled u shifted (0u, 0u))) cutafter (fullcircle scaled u shifted (-1u, -2u))) withpen pencircle scaled 1.5 withcolor darkblue;
  label.ulft(btex \small\bf .f etex, point 0.5 of (((0u, 0u)--(-1u, -2u) cutbefore (fullcircle scaled u shifted (0u, 0u))) cutafter (fullcircle scaled u shifted (-1u, -2u)))) withcolor darkblue;

  drawarrow (((0u, 0u)--(1u, -2u) cutbefore (fullcircle scaled u shifted (0u, 0u))) cutafter (fullcircle scaled u shifted (1u, -2u))) withpen pencircle scaled 1.5 withcolor darkblue;
  label.urt(btex \small\bf .g etex, point 0.5 of (((0u, 0u)--(1u, -2u) cutbefore (fullcircle scaled u shifted (0u, 0u))) cutafter (fullcircle scaled u shifted (1u, -2u)))) withcolor darkblue;

  drawarrow (((-1u, -2u)--(1u, -2u) cutbefore (fullcircle scaled u shifted (-1u, -2u))) cutafter (fullcircle scaled u shifted (1u, -2u))) withpen pencircle scaled 1.5 withcolor darkblue;
  label.top(btex \small\bf [0] etex, point 0.5 of (((-1u, -2u)--(1u, -2u) cutbefore (fullcircle scaled u shifted (-1u, -2u))) cutafter (fullcircle scaled u shifted (1u, -2u)))) withcolor darkblue;

  drawarrow (((1u, -2u)--(2u, -4u) cutbefore (fullcircle scaled u shifted (1u, -2u))) cutafter (fullcircle scaled u shifted (2u, -4u))) withpen pencircle scaled 1.5 withcolor darkblue dashed evenly;
  label.urt(btex \bf .num etex, point 0.5 of (((1u, -2u)--(2u, -4u) cutbefore (fullcircle scaled u shifted (1u, -2u))) cutafter (fullcircle scaled u shifted (2u, -4u)))) withcolor darkblue;

  fill fullcircle scaled u shifted (0u, 0u) withcolor blue;
  draw fullcircle scaled u shifted (0u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\bf \(\text{ref}_\text{1}\) etex, (0u, 0u)) withcolor white;

  fill fullcircle scaled u shifted (-1u, -2u) withcolor blue;
  draw fullcircle scaled u shifted (-1u, -2u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\bf \(\text{ref}_\text{2}\) etex, (-1u, -2u)) withcolor white;

  fill fullcircle scaled u shifted (1u, -2u) withcolor blue;
  draw fullcircle scaled u shifted (1u, -2u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\bf \(\text{ref}_\text{3}\) etex, (1u, -2u)) withcolor white;

  drawarrow (1u, 0u)--(0.5u + 1.5, 0u) withpen pencircle scaled 1.5 withcolor gray;
  label.rt(btex \bf x etex, (1u, 0u)) withcolor gray;

  drawarrow (2u, -2u)--(1.5u + 1.5, -2u) withpen pencircle scaled 1.5 withcolor gray;
  label.rt(btex \bf \(\text{y} \sim \text{x.f[0]} \sim \text{x.g}\) etex, (2u, -2u)) withcolor gray;
endfig;

beginfig(3)
  fill fullcircle scaled 2u shifted (0u, 0u) withcolor blue;
  draw fullcircle scaled 2u shifted (0u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\bf reachable etex, (0u, 0u)) rotated 45 withcolor white;

  fill (fullcircle scaled 1u shifted (1u, 0u)) withcolor gray;
  draw (fullcircle scaled 1u shifted (1u, 0u)) withpen pencircle scaled 1.5 withcolor darkgray;
  fill (((fullcircle scaled 1u shifted (1u, 0u)) cutbefore (fullcircle scaled 2u shifted (0u, 0u))) cutafter (fullcircle scaled 2u shifted (0u, 0u)))--(((fullcircle rotated 180 scaled 2u shifted (0u, 0u)) cutbefore (fullcircle scaled 1u shifted (1u, 0u))) cutafter (fullcircle scaled 1u shifted (1u, 0u)))--cycle withpen pencircle scaled 1.5 withcolor red;
  draw (((fullcircle scaled 1u shifted (1u, 0u)) cutbefore (fullcircle scaled 2u shifted (0u, 0u))) cutafter (fullcircle scaled 2u shifted (0u, 0u)))--(((fullcircle rotated 180 scaled 2u shifted (0u, 0u)) cutbefore (fullcircle scaled 1u shifted (1u, 0u))) cutafter (fullcircle scaled 1u shifted (1u, 0u)))--cycle withpen pencircle scaled 1.5 withcolor darkred;
  label(btex \small\bf error etex, (1u, 0u)) withcolor white;

  draw (0u, -0.5u)--(-0.375u, -2.125u)--(0.375u, -2.125u)--cycle withpen pencircle scaled 0.8 dashed evenly withcolor darkblue;
  label(btex \tiny\bf p etex, (0u, -1.75u)) withcolor darkblue;
  label(btex \tiny\bf q etex, (0u, -2u)) withcolor darkblue;

  draw (0.8125u, -0.25u)--(0.325u, -1.375u)..(1.3u, -1.375u)--cycle withpen pencircle scaled 0.8 dashed evenly withcolor darkred;
  label(btex \tiny\bf p etex, (0.8125u, -1u)) withcolor darkred;
  label(btex \tiny\bf \(\neg\)q etex, (0.8125u, -1.25u)) withcolor darkred;

  fill fullcircle scaled 0.125u shifted (0u, -0.5u) withcolor white;
  fill fullcircle scaled 0.125u shifted (0.8125u, -0.25u) withcolor white;
  drawarrow (0u, -0.5u)--(0.8125u, -0.25u) cutafter (fullcircle scaled 0.125u shifted (0.8125u, -0.25u)) withpen pencircle withcolor white dashed evenly;
  
endfig;

beginfig(4)
  drawarrow (5u, 0u)--(4u, -1u) withpen pencircle scaled 1.5 withcolor darkblue dashed evenly;
  label.lft(btex \small\bf i = 1 etex, (4.375u, -0.5u)) withcolor darkblue;

  drawarrow (5u, 0u)--(6u, -1u) withpen pencircle scaled 1.5 withcolor darkblue dashed evenly;
  label.rt(btex \small\bf \(\neg\)(i = 1) etex, (5.625u, -0.5u)) withcolor darkblue;

  fill fullcircle scaled u shifted (5u, 0u) withcolor blue;
  draw fullcircle scaled u shifted (5u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;

  drawarrow (0u, 0u)--(-1u, -1u) withpen pencircle scaled 1.5 withcolor darkblue dashed evenly;
  label.lft(btex \small\bf i = 1 etex, (-0.625u, -0.5u)) withcolor darkblue;

  drawarrow (0u, 0u)--(1u, -1u) withpen pencircle scaled 1.5 withcolor gray dashed evenly;
  label.rt(btex \small\bf \(\neg\)(i = 1) etex, (0.625u, -0.5u)) withcolor gray;

  fill fullcircle scaled u shifted (0u, 0u) withcolor blue;
  draw fullcircle scaled u shifted (0u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\bf i = 1 etex, (0u, 0u)) withcolor white;

  label.ulft(btex \small\bf a) etex, (-0.5u, 0.5u)) withcolor darkblue;
  label.ulft(btex \small\bf b) etex, (4.5u, 0.5u)) withcolor darkblue;
endfig;

picture emptystack;

emptystack := image(
  label.bot(btex \small\bf stack etex, (1u,0u)) withcolor darkblue;
);

setbounds emptystack to ((0u - 1.5,-1u)--(2u + 1.5,-1u)--(2u + 1.5,2u)--(0u - 1.5,2u)--cycle);

def stack(text t) = 
  begingroup
    picture s;
    save __i;
    __i := 0;
    s := image(
      forsuffixes l=t:
        fill (0u, 0.625u * __i)--(2u, 0.625u * __i)--(2u, 0.625u * __i + 0.5u)--(0u, 0.625u * __i + 0.5u)--cycle withcolor blue;
        draw (0u, 0.625u * __i)--(2u, 0.625u * __i)--(2u, 0.625u * __i + 0.5u)--(0u, 0.625u * __i + 0.5u)--cycle withpen pencircle scaled 1.5 withcolor darkblue;
        label(TEX("\bf {" & l & "}"), (1u, 0.625u * __i + 0.25u)) withcolor white;

        __i := __i + 1;
      endfor;
      draw emptystack;
    );

    s
  endgroup
enddef;


beginfig(5)
  draw emptystack;
endfig;

beginfig(6)
  string i;
  i := "b";
  draw stack(i);
endfig;

beginfig(7)
  string i,ii;
  i := "b";
  ii := "a";
  draw stack(i,ii);
endfig;

beginfig(8)
  string i;
  i := "a + b";
  draw stack(i);
endfig;

picture alias;

alias := image(
  drawarrow (-2u, 0u)--(-2u, -2.5u){down}..{right}(-1.5u, -3u)--(3.5u, -3u){right}..{up}(4u, -2.5u) withpen pencircle scaled 1.5 withcolor gray dashed evenly;
  drawarrow (0u, -3u)--(0u, -2.5u - 1.5) withpen pencircle scaled 1.5 withcolor gray dashed evenly;
  drawarrow (2u, -3u)--(2u, -2.5u - 1.5) withpen pencircle scaled 1.5 withcolor gray dashed evenly;

  label.llft(btex \small\bf .g etex, (-2u + 0.125u, -3u + 0.125u)) withcolor gray;
  label.bot(btex \Huge\bf ? etex, (2u, -3u)) withcolor gray;

  draw node((-2u, 0u), btex \small\bf \(\text{ref}_\text{1}\) etex, darkblue, blue);
  draw node(( 2u, 0u), btex \small\bf \(\text{ref}_\text{2}\) etex, darkblue, blue);
  draw edge((-2u, 0u), (2u, 0u), btex \small\bf .f etex, darkblue);

  draw edge((2u, 0u), (0u, -2u), btex \small\bf [0] etex, darkblue);
  draw edge((2u, 0u), (2u, -2u), btex \small\bf [1] etex, darkblue);
  draw edge((2u, 0u), (4u, -2u), btex \small\bf [2] etex, darkblue);

  draw node((0u, -2u), btex \small\bf \(\text{ref}_\text{3}\) etex, darkblue, blue);
  draw node((2u, -2u), btex \small\bf \(\text{ref}_\text{4}\) etex, darkblue, blue);
  draw node((4u, -2u), btex \small\bf \(\text{ref}_\text{5}\) etex, darkblue, blue);
);

beginfig(9)
  draw alias;
endfig;

beginfig(10)
  picture img;

  img := image(
    drawarrow (-2u, 0u)--(-2u, -2.5u){down}..{right}(-1.5u, -3u)--(3.5u, -3u){right}..{up}(4u, -2.5u) withpen pencircle scaled 1.5 withcolor darkblue;
    drawarrow (0u, -3u)--(0u, -2.5u - 1.5) withpen pencircle scaled 1.5 withcolor darkblue;
    drawarrow (2u, -3u)--(2u, -2.5u - 1.5) withpen pencircle scaled 1.5 withcolor darkblue;
  
    label.llft(btex \small\bf .g etex, (-2u + 0.125u, -3u + 0.125u)) withcolor darkblue;
    label.bot(btex \Huge\bf \checkmark etex, (2u, -3u)) withcolor darkred;
  
    draw node((-2u, 0u), btex \small\bf \(\text{ref}_\text{1}\) etex, darkblue, blue);
    draw node(( 2u, 0u), btex \small\bf \(\text{ref}_\text{2}\) etex, darkblue, blue);
    draw edge((-2u, 0u), (2u, 0u), btex \small\bf .f etex, darkblue);
  
    draw edge((2u, 0u), (0u, -2u), btex \small\bf [0] etex, darkblue);
    draw edge((2u, 0u), (2u, -2u), btex \small\bf [1] etex, darkblue);
    draw edge((2u, 0u), (4u, -2u), btex \small\bf [2] etex, darkblue);
  
    draw node((0u, -2u), btex \small\bf \(\text{ref}_\text{3}\) etex, darkblue, blue);
    draw node((2u, -2u), btex \small\bf \(\text{ref}_\text{4}\) etex, darkblue, blue);
    draw node((4u, -2u), btex \small\bf \(\text{ref}_\text{5}\) etex, darkblue, blue);
  );

  draw img;
endfig;

end

verbatimtex
\end{document}
etex

.
