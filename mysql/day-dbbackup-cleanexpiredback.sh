# sh day-dbbackup-cleanexpiredback.sh dbname
backupdir=/data/dbbackup
dbname=$1

reservedays=30

time=` date +%Y%m%d%H `

mysqldump --default-character-set=utf8mb4 --single-transaction --set-gtid-purged=OFF -q -R -uuser -ppasswd -hlocalhost $dbname | gzip > $backupdir/$dbname$time.sql.gz

find $backupdir -name "$dbname*.sql.gz" -type f -mtime +$reservedays -exec rm {} \; > /dev/null 2>&1
