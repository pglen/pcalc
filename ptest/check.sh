#!/bin/sh

if [ ! -f check.sh ] ; then
    echo Please execute this script from ptest directory.
    exit
fi

# Clean old temp files
rm -f *.var
rm -f ./result.txt
echo This test should not generate output, except this line.
# Generate new output
for aaa in pcalc.* ; do ../pcalc @$aaa >> ./result.txt;  done
# Compare output with stock output
diff original.txt result.txt

