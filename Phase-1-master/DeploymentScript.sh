#Deployment Script

#Deploy the war to tomcat server.
#Step-1: Removing the existing package from tomcat server
rm -rf /root/tomcat7/webapps/DevOpsWebApp-*.war
rm -rf /root/tomcat7/webapps/DevOpsWebApp-*

#Step-2: Staging the new package to tomcat server.
cp ${WORKSPACE}/target/*.war  /root/tomcat7/webapps


#Try to deploy on tomcat server where it is available on another linux machine.