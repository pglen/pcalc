bin_PROGRAMS = pcalc
pcalc_SOURCES = convert.c  help.c str.c funct.c pcalc.y pcalcl.l math.c print.c store.c symbol.c
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