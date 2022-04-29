#!/bin/sh
# Clean old temp files
rm -f *.var
rm -f ./original.txt
# Generate REF output (only do it the first time)
for aaa in pcalc.* ; do ../pcalc @$aaa >> ./original.txt;  done

