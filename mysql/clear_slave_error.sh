# get some slave stats
COUNTER=0

while [ $COUNTER -lt 500 ]; do
Slave_IO_Running=`mysql -u user --password='passwd' -Bse 'show slave status\G' | grep Slave_IO_Running | awk '{ print $2 }'`


Slave_SQL_Running=`mysql -u user --password='passwd' -Bse 'show slave status\G' | grep Slave_SQL_Running | awk '{ print $2 }'`

#Last_error=`mysql -u user --password='passwd' -Bse 'show slave status\G' | grep Last_error | awk -F : '{ print $2 }'`

#Last_sql_error=`mysql -u user --password='passwd' -Bse 'show slave status\G' | grep Last_SQL_Error | awk -F : '{ print $2 }'`

echo $Slave_SQL_Running

while [[ $Slave_SQL_Running == 'No' || $Slave_IO_Running == 'No' ]]; do
	#echo 'Last sql Error:' $Last_sql_error | mail -s 'Replication error on slavedb!!!' devops@company.com

	Last_sql_error=`mysql -u user --password='passwd' -Bse 'show slave status\G' | grep Last_SQL_Error | awk -F : '{ print $2 }'`

	echo $Last_sql_error >> last_sql_error.log

	mysql -u user --password='passwd' -Bse 'STOP SLAVE;\G'
	mysql -u user --password='passwd' -Bse 'set global sql_slave_skip_counter=1;\G'
	mysql -u user --password='passwd' -Bse 'start SLAVE;\G'

        Slave_IO_Running=`mysql -u user --password='passwd' -Bse 'show slave status\G' | grep Slave_IO_Running | awk '{ print $2 }'`

        Slave_SQL_Running=`mysql -u user --password='passwd' -Bse 'show slave status\G' | grep Slave_SQL_Running | awk '{ print $2 }'`

done 

let COUNTER=COUNTER+1
sleep 1
done

exit 0