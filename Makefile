SCREENA=LVDS1
SCREENB=VGA1
PX=1024
NX=1024
Y=768

all: slides.pdf

slides.pdf: %.pdf: %.latex %.mp beamerthemeD3S.sty
	mpost $*.mp
	pdflatex $*.latex

present: all
	xrandr --output $(SCREENA) --mode $(PX)x$(Y) --pos $(NX)x0 --output $(SCREENB) --mode $(NX)x$(Y) --pos 0x0
	impressive -g `expr $(PX) + $(NX)`x$(Y) -T 0 slides.pdf
