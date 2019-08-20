#Refer: https://www.howtoforge.com/how-to-install-sonarqube-on-ubuntu-1804/

#This has been tested on t2.medium - Ubuntu Server 16.04 - Storage 10 GB

#Please refer AWS-SONAR-PostgreSQL-installation.doc in case if you have doubts with the below steps.

#https://dzone.com/articles/integration-jenkins-jacoco-and-sonarqube
#http://www.tecnohobby.net/ppal/index.php/programacion/java/28-instalar-sonarqube-con-postgresql

#mvn -V clean verify -P coverage,sonar sonar:sonar

#Login to the root
sudo -i

#system update
sudo apt-get update -y
sudo apt-get upgrade -y

#=========================JAVA INSTALLATION START===============================================#

#Add the Oracle Java repository on the server by running.
sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update -y

#Install Oracle JDK, select OK, and then YES when ever a window will be prompted.
sudo apt-get install oracle-java8-installer -y

java -version

#=========================JAVA INSTALLATION END===============================================#

#=========================DB INSTALLATION START===============================================#

#Install the PostgreSQL repository
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -

sudo apt-get update -y

#Install the PostgreSQL
sudo apt-get install postgresql postgresql-contrib

sudo systemctl status postgresql

#Start PostgreSQL server and enable it to start automatically at boot time by running
#sudo systemctl start postgresql
#sudo systemctl enable postgresql

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

echo ' connect to db and check the tables
su – postgres
psql
\connect sonar
\dt

select * from projects;
select * from users;
select * from project_links;

'

#Switch back to the sudo user by running the 'exit' command.

#=========================DB INSTALLATION END===============================================#

#=========================SONARQUBE INSTALLATION START===============================================#

sudo -i

#create a user for SonarQube
sudo adduser sonar

#Download the SonarQube installer files archive. You can find all the versions of SONAR here  https://www.sonarqube.org/downloads/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-6.7.6.zip

#Install unzip
apt-get -y install unzip

#Unzip the archive and moving to the folder 'opt'.
sudo unzip sonarqube-6.7.6.zip -d /opt

#Rename the directory
sudo mv /opt/sonarqube-6.7.6 /opt/sonarqube

#Give ownership to sonar user on /opt/sonarqube
sudo chown -R sonar:sonar /opt/sonarqube

#Update the sonar.sh file with below user name
vi /opt/sonarqube/bin/linux-x86-64/sonar.sh
#RUN_AS_USER=sonar

#Update the sonar properties file with sonar jdbc username and pwd, and jdbc URL also.
sudo vi /opt/sonarqube/conf/sonar.properties

#Find the following lines.
#sonar.jdbc.username=
#sonar.jdbc.password=
#sonar.jdbc.url=jdbc:postgresql://localhost/sonar

#Uncomment and provide the PostgreSQL username and password of the database that we have created earlier. It should look like:

echo'
sonar.jdbc.username=sonar
sonar.jdbc.password=sonar
sonar.jdbc.url=jdbc:postgresql://localhost/sonar
sonar.web.host=0.0.0.0
sonar.search.javaOpts=-Xms512m  -Xmx512m
'
echo 'Run the below commands to start and stop the sonar service'
/opt/sonarqube/bin/linux-x86-64/sonar.sh start
/opt/sonarqube/bin/linux-x86-64/sonar.sh stop

#Launch the url http://<publicIP>:9000

echo'
default username & passwd are
uname: admin
paswd: admin
' 

echo "Or add sonar as a service as mentioned below"

#Configure Systemd service whenever system restarted, soanr will automatically started.
#To this, create a file and paste the snippet as followed.
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

User=sonar
Group=sonar
Restart=always

[Install]
WantedBy=multi-user.target
'

#Cross check whether file saved with content.
cat /etc/systemd/system/sonar.service

#start the sonar
sudo systemctl start sonar
sudo systemctl enable sonar

#Check if the service is running
sudo systemctl status sonar

#Launch the url http://<publicIP>:9000

echo'
default username & passwd are
uname: admin
paswd: admin
' 
#=========================SonarQube INSTALLATION END===============================================#

