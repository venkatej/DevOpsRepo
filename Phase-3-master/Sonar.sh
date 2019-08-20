#Refer: https://www.vultr.com/docs/how-to-install-sonarqube-on-ubuntu-16-04

#This has been tested on t2.medium - Ubuntu Server 16.04

#Please refer AWS-SONAR-PostgreSQL-installation.doc in case if you have doubts with the below steps.

#https://dzone.com/articles/integration-jenkins-jacoco-and-sonarqube
#http://www.tecnohobby.net/ppal/index.php/programacion/java/28-instalar-sonarqube-con-postgresql

#clean verify sonar:sonar -P coverage,sonar 

#Login to the root
sudo -i

#system update
sudo apt-get update
sudo apt-get -y upgrade

#=========================JAVA INSTALLATION START===============================================#

#Add the Oracle Java repository on the server by running.
sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update

#Install Oracle JDK, select OK, and then YES wheneven window will be prompted.
sudo apt install oracle-java8-installer

java -version

#=========================JAVA INSTALLATION END===============================================#

#=========================DB INSTALLATION START===============================================#

#Install the PostgreSQL repository
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -

#Install the PostgreSQL
sudo apt-get -y install postgresql postgresql-contrib

#Start PostgreSQL server and enable it to start automatically at boot time by running
sudo systemctl start postgresql
sudo systemctl enable postgresql

#Change the password for the default PostgreSQL user, eneter the pwd and please remember it.
sudo passwd postgres

#Switch to the postgres user.
su - postgres

#Create a new user by typing:
createuser sonar

#Switch to the PostgreSQL shell to create database.
psql

#Set a password for the newly created user for SonarQube database. You can give any name for username & pwd. But make sure you should refer the same credentials in sonar.properties file.
ALTER USER sonar WITH ENCRYPTED password 'sonar';

#Create a new database for PostgreSQL database by running:
CREATE DATABASE sonar OWNER sonar;

#Exit from the psql shell:
\q

#Switch back to the sudo user by running the 'exit' command.
exit
#=========================DB INSTALLATION END===============================================#

#=========================SONARQUBE INSTALLATION START===============================================#

sudo -i

#Download the SonarQube installer files archive. You can find all the versions of SONAR here  https://www.sonarqube.org/downloads/
wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.4.zip

#Install unzip
apt-get -y install unzip

#Unzip the archive and moving to the folder 'opt'.
sudo unzip sonarqube-6.4.zip -d /opt

#Rename the directory
sudo mv /opt/sonarqube-6.4 /opt/sonarqube

#Update the sonar properties file with sonar jdbc username and pwd, and jdbc URL also.
sudo vi /opt/sonarqube/conf/sonar.properties

#Find the following lines.
#sonar.jdbc.username=
#sonar.jdbc.password=

#Uncomment and provide the PostgreSQL username and password of the database that we have created earlier. It should look like:

echo'
sonar.jdbc.username=sonar
sonar.jdbc.password=sonar
'
echo'
Find the link and uncomment, save the file and exit from the editor.:
sonar.jdbc.url=jdbc:postgresql://localhost/sonar
'

#Configure Systemd service whenever system restarted, soanr will automatically started.
#To this, create a file and paste the snipppet as followed.
vi /etc/systemd/system/sonar.service

#Copy the below snippet and paste it in the editor.
echo'
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking

ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop

User=root
Group=root
Restart=always

[Install]
WantedBy=multi-user.target
'

#Cross check whether file saved with content.
cat /etc/systemd/system/sonar.service

#start the sonar
sudo systemctl start sonar

#Check if the service is running
sudo systemctl status sonar

#Launch the url http://<publicIP>:9000

echo'
default username & passwd are
uname: admin
paswd: admin
' 
#=========================SonarQube INSTALLATION END===============================================#

