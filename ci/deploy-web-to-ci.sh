sudo /etc/init.d/tomcat stop
sudo rm -rf /var/lib/tomcat/webapps/ROOT
mv /tmp/openlmis-web.war /var/lib/tomcat/webapps/ROOT.war
sudo /etc/init.d/tomcat restart