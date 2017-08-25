# $1=gc log file path
grep 'ParNew: ' $1 | sed "s/ /\t/g" | sed "s/T/ /g" | sed "s/+0000://g" | sed "s/:\t\[ParNew://g" | sed "s/K->/\t/g" | sed "s/K(/\t/g" | sed "s/K),//g" | sed "s/\tsecs\]//g" | sed "s/K)After\tGC://g"
