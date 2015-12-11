sh stop-tomcat-single.sh /opt/appcluster1/tomcat06
echo

sh stop-tomcat-single.sh /opt/appcluster1/apache-tomcat-8.0.14
echo

sh stop-tomcat-single.sh /opt/appcluster1/ebay-apache-tomcat-8.0.14
echo

ps -ef | grep tomcat
