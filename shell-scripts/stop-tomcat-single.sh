#调用关闭脚本
sh $1/bin/shutdown.sh

pid1=`ps aux| grep "$1" | grep -v grep | sed -n  '1P' | awk '{print $2}'`
echo $1' '$pid1

#循环检测进程是否存在
while [ -a /proc/$pid1 ]; do
	kill -15 $pid1
	echo 'call kill -15 to shutdown tomcat'
	sleep 10
done

echo
echo "shutdown $1 OK"
