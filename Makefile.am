bin_PROGRAMS = pcalc
pcalc_SOURCES = src/convert.c  src/help.c src/str.c src/funct.c src/pcalc.y src/pcalcl.l src/math.c src/print.c src/store.c src/symbol.c
pcalc_CFLAGS = -I src
pcalc_TEXINFOS = pcalc.texi

#AM_YFLAGS = -t -d -v

.PHONY: test

clean-local:
	@rm -f *.exe
	@rm -f *.o

test:
	@cd ptest; ./check.sh; cd ..

git:
	echo "Updating git"
	git add .
	git commit -m "Auto Update"
	git push