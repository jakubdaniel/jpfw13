SCREENA=LVDS1
SCREENB=VGA1
PX=1024
NX=1024
Y=768

all: slides.pdf

slides.pdf: %.pdf: %.latex %.mp beamerthemeD3S.sty
	mpost $*.mp
	pdflatex $*.latex
	pdflatex -jobname slides-comments "\def\withcomments{1} \input{$*.latex}"

present: all
	impressive -g `expr $(PX) + $(NX)`x$(Y) -T 0 slides.pdf

present-comments: all
	#xrandr --output $(SCREENA) --mode $(PX)x$(Y) --pos $(NX)x0 --output $(SCREENB) --mode $(NX)x$(Y) --pos 0x0
	impressive -g `expr $(PX) + $(NX)`x$(Y) -T 0 slides-comments.pdf
