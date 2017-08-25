monitor_file=$1
monitor_process="jetty"

filesize() {
  echo $(stat -c %s $1 | tr -d '\n')
}

echo $$ >> /tmp/pid-jetty-thread-dump

last_time_size=0

while :
do
  cur_size=$(filesize $monitor_file)

  if [ $cur_size=$last_time_size ]; then
    pid=$(ps aux| grep $monitor_process | grep -v grep | sed -n  '1P' | awk '{print $2}')
    jstack -l $pid > /tmp/dump-$(/opt/local/bin/date +%Y%m%d_%H%M%S).jstack
  fi

  last_time_size=$cur_size
  sleep 3
done
