scp /tmp/openlmis-web.war ubuntu@52.69.124.32:/home/ubuntu/
echo "sudo mv /home/ubuntu/openlmis-web.war /var/lib/tomcat7/webapps/ROOT.war && sudo rm -rf /var/lib/tomcat7/webapps/ROOT && sudo /etc/init.d/tomcat7 restart" >> deploy-qa.sh
ssh ubuntu@52.69.124.32 < deploy-qa.sh
rm deploy-qa.sh
rm /tmp/openlmis-web.war