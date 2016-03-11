rm -f `find $1 -size 0`

datebeg="2015-01-01"
dateend="2015-11-30"
 
beg_s=`date -d "$datebeg" +%s`
end_s=`date -d "$dateend" +%s`

while [ "$beg_s" -le "$end_s" ];do
	day=`date -d @$beg_s +"%Y-%m-%d"`;
	logfile=$1*.$day.*

	if [ ! -s $1$day.tar.gz ]; then
		echo $day' log file exist'
		tar zcvf $1$day.tar.gz $logfile
		rm -f $logfile
	fi

	beg_s=$((beg_s+86400));
done

rm -f `find $1 -name *.tar.gz -size -100c`
