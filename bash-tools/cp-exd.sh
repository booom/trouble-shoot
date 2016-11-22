# sh cp_exd.sh /home/albert/Desktop /home/albert/bak exd1 exd2 exd...
mkdir -p $2
cd $1
cp -rf `ls $1 | grep -E -v "^($3|$4|$5|$6|$7|$8|$9)$"` $2
cd $2
