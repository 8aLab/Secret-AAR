#!/bin/bash

cat $1 | perl -pe 'chomp unless ($_=~/^\>/);' | perl -ne '$_=~s/(?<=.)\>/\n\>/g; print $_; END{ print "\n"; }' | perl -pe ' $_=~s/\n/###/ if $_=~/^\>/;' | xargs -I{} bash -c 'echo '"'"'{}'"'"' | perl -pe '"'"'$_=~s/###/\n/g;'"'"' > temp_fa.fa ; head -n 2 temp_fa.fa ; tail -n 1 temp_fa.fa > temp_2 ; python predict_bcell.py -n -m Bepipred temp_2 | perl -ne '"'"'@f=split; print "$f[3]" if (($f[3] eq ".") || ($f[3] eq "E")); END {print "\n"}'"'"' '

rm temp_2
rm temp_fa.fa


