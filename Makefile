PX=1152
NX=1152
Y=864

all: slides.pdf

slides.pdf: %.pdf: %.latex %.mp beamerthemeD3S.sty
	mpost $*.mp
	pdflatex $*.latex

present: all
	xrandr --output LVDS2 --mode $(PX)x$(Y) --pos $(NX)x0 --output VGA2 --mode $(NX)x$(Y) --pos 0x0
	impressive -g `expr $(PX) + $(NX)`x$(Y) -T 0 slides.pdf
