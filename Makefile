ASY_CMD = asy

PLUS_PDFS = 2P-plus-2P.pdf P-plus-2P.pdf  P-plus-3P.pdf P-plus-P.pdf P-plus-Q.pdf
LINE_PDFS = P-and-Q-labels.pdf P-line-Q.pdf P-tangent.pdf negP-plus-P.pdf labels-only.pdf

%.pdf: %.asy pre-ec.asy post-config.asy
	$(ASY_CMD) -f pdf $<

all: $(PLUS_PDFS) $(LINE_PDFS)