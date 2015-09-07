/usr/share/tomcat/bin/shutdown.sh
rm /var/lib/tomcat/webapps/ROOT.war
rm -rf /var/lib/tomcat/webapps/ROOT
cp /var/lib/jenkins/jobs/moz-build/lastSuccessful/archive/open-lmis/modules/openlmis-web/build/libs/openlmis-web.war /var/lib/tomcat/webapps/ROOT.war
/usr/share/tomcat/bin/startup.sh