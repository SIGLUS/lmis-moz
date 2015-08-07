rm -rf /var/lib/tomcat7/webapps/ROOT
mv /var/lib/tomcat7/webapps/openlmis-web.war /var/lib/tomcat7/webapps/ROOT.war
unzip /var/lib/tomcat7/webapps/ROOT.war -d /var/lib/tomcat7/webapps/ROOT
sudo /etc/init.d/tomcat7 restart