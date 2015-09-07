/usr/share/tomcat/bin/shutdown.sh
rm -rf /var/lib/tomcat/webapps/ROOT
mv /var/lib/tomcat/webapps/openlmis-web.war /var/lib/tomcat/webapps/ROOT.war
rm /var/lib/tomcat/webapps/ROOT.war
/usr/share/tomcat/bin/startup.sh