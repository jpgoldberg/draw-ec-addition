ASY_CMD = asy

%.pdf: %.asy pre-ec.asy draw-ec.asy
	$(ASY_CMD) -f pdf $<
