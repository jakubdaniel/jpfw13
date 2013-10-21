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

color green; green := (44/255, 240/255, 0);
color darkgreen; darkgreen := (28/255, 192/255, 0);

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

picture aliasi, aliasii, aliasiii;

aliasi := image(
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

aliasii := image(
  drawarrow (-2u, 0u)--(-2u, -2.5u){down}..{right}(-1.5u, -3u)--(3.5u, -3u){right}..{up}(4u, -2.5u) withpen pencircle scaled 1.5 withcolor gray dashed evenly;
  drawarrow (0u, -3u)--(0u, -2.5u - 1.5) withpen pencircle scaled 1.5 withcolor gray dashed evenly;
  drawarrow (2u, -3u)--(2u, -2.5u - 1.5) withpen pencircle scaled 1.5 withcolor gray dashed evenly;

  label.llft(btex \small\bf .g etex, (-2u + 0.125u, -3u + 0.125u)) withcolor gray;
  label.bot(btex \Huge\bf ? etex, (2u, -3u)) withcolor gray;

  draw aliasi;
);

aliasiii := image(
  drawarrow (-2u, 0u)--(-2u, -2.5u){down}..{right}(-1.5u, -3u)--(3.5u, -3u){right}..{up}(4u, -2.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  drawarrow (0u, -3u)--(0u, -2.5u - 1.5) withpen pencircle scaled 1.5 withcolor darkblue;
  drawarrow (2u, -3u)--(2u, -2.5u - 1.5) withpen pencircle scaled 1.5 withcolor darkblue;
  
  label.llft(btex \small\bf .g etex, (-2u + 0.125u, -3u + 0.125u)) withcolor darkblue;
  label.bot(btex \Huge\bf \checkmark etex, (2u, -3u)) withcolor darkgreen;
  
  draw aliasi;
);

def maxbox(expr a, b) = 
  (llcorner (llcorner a--llcorner b) -- lrcorner(lrcorner a--lrcorner b) -- urcorner(urcorner a--urcorner b) -- ulcorner(ulcorner a--ulcorner b) -- cycle)
enddef;

beginfig(9)
  draw aliasii;

  setbounds currentpicture to maxbox(aliasii, aliasiii);
endfig;

beginfig(10)
  draw aliasiii;

  setbounds currentpicture to maxbox(aliasii, aliasiii);
endfig;

picture expri, exprii, expriii, expriv, exprv, exprvi, exprvii, exprviii;

expri := image(
  fill fullcircle scaled 0.5u shifted (-0.75u,  -2.25u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (-0.75u,  -2.25u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf x etex,         (-0.75u,  -2.25u)) withcolor white;
);

exprii := image(
  draw (-0.75u,  -1.5u)--(-0.75u, -2.25u) withpen pencircle scaled 1.5 withcolor darkblue;
  draw (-0.75u,  -1.5u)--(    0u, -2.25u) withpen pencircle scaled 1.5 withcolor darkblue;

  fill fullcircle scaled 0.5u shifted (-0.75u,  -1.5u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (-0.75u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf . etex,         (-0.75u,  -1.5u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (    0u,  -2.25u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (    0u,  -2.25u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf f etex,         (    0u,  -2.25u)) withcolor white;
);

expriii := image(
  draw (-0.75u, -0.75u)--( -1.5u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  draw (-0.75u, -0.75u)--(-0.75u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  draw (-0.75u, -0.75u)--(    0u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue;

  fill fullcircle scaled 0.5u shifted (-0.75u, -0.75u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (-0.75u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf [ ] etex,       (-0.75u, -0.75u)) withcolor white;

  fill fullcircle scaled 0.5u shifted ( -1.5u,  -1.5u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted ( -1.5u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf arr etex,       ( -1.5u,  -1.5u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (    0u,  -1.5u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (    0u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf 0 etex,         (   0u,  -1.5u)) withcolor white;
);

expriv := image(
  draw (    0u,     0u)--(-0.75u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue;
  draw (    0u,     0u)--(    0u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue;

  fill fullcircle scaled 0.5u shifted (    0u,     0u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (    0u,     0u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf . etex,         (    0u,     0u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (    0u, -0.75u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (    0u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf num etex,       (    0u, -0.75u)) withcolor white;
);

exprv := image(
  fill fullcircle scaled 0.5u shifted (  1.5u, -0.75u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (  1.5u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf y etex,         (  1.5u, -0.75u)) withcolor white;
);

exprvi := image(
  draw (  1.5u,     0u)--(  1.5u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue;
  draw (  1.5u,     0u)--( 2.25u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue;

  fill fullcircle scaled 0.5u shifted (  1.5u,     0u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (  1.5u,     0u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf . etex,         (  1.5u,     0u)) withcolor white;

  fill fullcircle scaled 0.5u shifted ( 2.25u, -0.75u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted ( 2.25u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf num etex,       ( 2.25u, -0.75u)) withcolor white;
);

exprvii := image(
  draw ( 0.75u,  0.75u)--(    0u,     0u) withpen pencircle scaled 1.5 withcolor darkblue;
  draw ( 0.75u,  0.75u)--(  1.5u,     0u) withpen pencircle scaled 1.5 withcolor darkblue;

  fill fullcircle scaled 0.5u shifted ( 0.75u,  0.75u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted ( 0.75u,  0.75u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf = etex,         ( 0.75u,  0.75u)) withcolor white;
);

exprviii := image(
  draw ((-3u -2.25u) / 2,  -1.5u)--(-3.75u, -2.25u) withpen pencircle scaled 1.5 withcolor darkred;
  draw ((-3u -2.25u) / 2,  -1.5u)--(   -3u, -2.25u) withpen pencircle scaled 1.5 withcolor darkred;
  draw (   -3u, -2.25u)--(-3.75u,    -3u) withpen pencircle scaled 1.5 withcolor darkred;
  draw (   -3u, -2.25u)--(-2.25u,    -3u) withpen pencircle scaled 1.5 withcolor darkred;
  draw ((-3u -2.25u) / 2,  -1.5u)--(-2.25u, -2.25u) withpen pencircle scaled 1.5 withcolor darkred;
  draw ((-3u -2.25u) / 2,  -1.5u)--( -1.5u, -2.25u) withpen pencircle scaled 1.5 withcolor darkred;
  draw (-0.75u, -0.75u)--((-3u -2.25u) / 2,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  draw (-0.75u, -0.75u)--(-0.75u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  draw (-0.75u, -0.75u)--(    0u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue;

  fill fullcircle scaled 0.5u shifted (-0.75u, -0.75u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (-0.75u, -0.75u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf [ ] etex,       (-0.75u, -0.75u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (    0u,  -1.5u) withcolor blue; 
  draw fullcircle scaled 0.5u shifted (    0u,  -1.5u) withpen pencircle scaled 1.5 withcolor darkblue; 
  label(btex \tiny\bf 0 etex,         (   0u,  -1.5u)) withcolor white;

  fill fullcircle scaled 0.5u shifted ( (-3u -2.25u) / 2,  -1.5u) withcolor red; 
  draw fullcircle scaled 0.5u shifted ( (-3u -2.25u) / 2,  -1.5u) withpen pencircle scaled 1.5 withcolor darkred; 
  label(btex \tiny\bf wrt etex,       ( (-3u -2.25u) / 2,  -1.5u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (-3.75u, -2.25u) withcolor red; 
  draw fullcircle scaled 0.5u shifted (-3.75u, -2.25u) withpen pencircle scaled 1.5 withcolor darkred; 
  label(btex \tiny\bf arr etex,         (-3.75u, -2.25u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (   -3u, -2.25u) withcolor red; 
  draw fullcircle scaled 0.5u shifted (   -3u, -2.25u) withpen pencircle scaled 1.5 withcolor darkred; 
  label(btex \tiny\bf . etex,         (   -3u, -2.25u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (-3.75u,    -3u) withcolor red; 
  draw fullcircle scaled 0.5u shifted (-3.75u,    -3u) withpen pencircle scaled 1.5 withcolor darkred; 
  label(btex \tiny\bf x etex,         (-3.75u,    -3u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (-2.25u,    -3u) withcolor red; 
  draw fullcircle scaled 0.5u shifted (-2.25u,    -3u) withpen pencircle scaled 1.5 withcolor darkred; 
  label(btex \tiny\bf f etex,         (-2.25u,    -3u)) withcolor white;

  fill fullcircle scaled 0.5u shifted (-2.25u, -2.25u) withcolor red; 
  draw fullcircle scaled 0.5u shifted (-2.25u, -2.25u) withpen pencircle scaled 1.5 withcolor darkred; 
  label(btex \tiny\bf i etex,         (-2.25u, -2.25u)) withcolor white;

  fill fullcircle scaled 0.5u shifted ( -1.5u, -2.25u) withcolor red; 
  draw fullcircle scaled 0.5u shifted ( -1.5u, -2.25u) withpen pencircle scaled 1.5 withcolor darkred; 
  label(btex \tiny\bf y etex,         ( -1.5u, -2.25u)) withcolor white;
);

picture cexpri, cexprii, cexpriii, cexpriv, cexprv, cexprvi, cexprvii, cexprviii;

cexpri := image(
  draw expri;
);

cexprii := image(
  draw exprii;
  draw cexpri;
);

cexpriii := image(
  draw expriii;
  draw cexprii;
);

cexpriv := image(
  draw expriv;
  draw cexpriii;
);

cexprv := image(
  draw exprv;
  draw cexpriv;
);

cexprvi := image(
  draw exprvi;
  draw cexprv;
);

cexprvii := image(
  draw exprvii;
  draw cexprvi;
);

cexprviii := image(
  draw cexprvii;

  draw image(
    draw exprvii;
    draw exprvi;
    draw exprv;
    draw expriv;
    draw exprviii;
    draw exprii;
    draw expri;
  ) shifted (6u, 0u);
);

beginfig(11)
  draw cexpri;
  setbounds currentpicture to bbox cexprviii;
endfig;

beginfig(12)
  draw cexprii;
  setbounds currentpicture to bbox cexprviii;
endfig;

beginfig(13)
  draw cexpriii;
  setbounds currentpicture to bbox cexprviii;
endfig;

beginfig(14)
  draw cexpriv;
  setbounds currentpicture to bbox cexprviii;
endfig;

beginfig(15)
  draw cexprv;
  setbounds currentpicture to bbox cexprviii;
endfig;

beginfig(16)
  draw cexprvi;
  setbounds currentpicture to bbox cexprviii;
endfig;

beginfig(17)
  draw cexprvii;
  setbounds currentpicture to bbox cexprviii;
endfig;

beginfig(18)
  draw cexprviii;
  setbounds currentpicture to bbox cexprviii;
endfig;

beginfig(19)
  draw edge(( 0u,  2u), ( 0u,  0u), btex etex, darkblue);
  draw edge(( 0u,  0u), ( 0u, -2u), btex etex, darkblue);
  draw nonedge(( 0u, -2u), (-1u, -4u), btex etex, darkgray);
  draw edge(( 0u, -2u), ( 1u, -4u), btex etex, darkblue);
  draw edge(( 1u, -4u), ( 0u, -6u), btex etex, darkblue);
  draw edge(( 1u, -4u), ( 2u, -6u), btex etex, darkblue);
  draw node(( 0u,  0u), btex \small\bf \(\text{s}_\text{1}\) etex, darkblue, blue);
  draw node(( 0u, -2u), btex \small\bf \(\text{s}_\text{2}\) etex, darkblue, blue);
  draw node((-1u, -4u), btex \small\bf \(\text{s}_\text{3}\) etex, darkgray, gray);
  draw node(( 1u, -4u), btex \small\bf \(\text{s}_\text{4}\) etex, darkblue, blue);

  drawdblarrow ((0u, 0u)..(-2u, -2u)..(-1u, -4u) cutbefore (fullcircle scaled (u + 3) shifted (0u, 0u)) cutafter (fullcircle scaled (u + 3) shifted (-1u, -4u))) withpen pencircle scaled 1.5 withcolor gray;
endfig;

end

verbatimtex
\end{document}
etex

.
