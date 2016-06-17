# sh java-code-stat.sh $path
find $1 -name "*.java" |xargs cat|grep -v ^$|wc -l
