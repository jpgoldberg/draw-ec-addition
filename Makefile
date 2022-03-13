ASY_CMD = asy

%.pdf: %.asy
	$(ASY_CMD) -f pdf $^
