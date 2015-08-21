sudo /etc/init.d/tomcat7 stop
sudo rm -rf /var/lib/tomcat7/webapps/ROOT
mv /tmp/openlmis-web.war /var/lib/tomcat7/webapps/ROOT.war
sudo /etc/init.d/tomcat7 restart