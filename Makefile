all: slides.pdf

slides.pdf: %.pdf: %.latex %.mp beamerthemeD3S.sty
	mpost $*.mp
	pdflatex $*.latex
