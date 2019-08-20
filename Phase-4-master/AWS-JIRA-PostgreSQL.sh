#Reference:https://www.youtube.com/watch?v=3Hd8o9IwtBg
#This has been tested on t2.medium, EC2 AWS Linux instance. i.e., Amazon Linux AMI 2017.09.1 (HVM), SSD Volume Type - ami-1853ac65

#Update the system with all the packages.
sudo yum update -y

#=============================POSTGRESQL INSTALLATION START==========================#
#search all the available packages with postgre 
sudo yum list postgre*

#You can choose the postgresql version from the above list of results.
sudo yum install -y postgresql-server.x86_64

#Create a user for postgre.
sudo su - postgres

#see the postgre data base file aftert he installation.
echo'
-bash-4.2$ ls
backups  data
'
#Initiate the db.
initdb data
echo'
-bash-4.2$ initdb data
	Success. You can now start the database server using:

		postgres -D data
	or
		pg_ctl -D data -l logfile start
'

#Start the database
pg_ctl -D data -l logfile start
echo'
-bash-4.2$ pg_ctl -D data -l logfile start
server starting
'

#Create a databse for JIRA.
createdb jiradb
echo'
-bash-4.2$ createdb jiradb
'

#exit (exit from postgres user)


#Once the JIRA configuration is completed, then again connect to your db "jiradb" and then verify the table by default created by the JIRA in prostgreSQL.
echo'
su - postgres 

psql

\connect jiradb

\dt

'
#=============================POSTGRESQL INSTALLATION END==========================#

#=============================JIRA INSTALLATION START==============================#
sudo -i

sudo yum install wget -y

#download jira
sudo wget  https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.8.0-x64.bin

#ls -- whether the bin file downloaded or not.
echo'
[ec2-user@ip-172-31-47-93 ~]$ ls
atlassian-jira-software-7.8.0-x64.bin
'

chmod a+x atlassian-jira-software-7.8.0-x64.bin

sudo ./atlassian-jira-software-7.8.0-x64.bin

echo'
[ec2-user@ip-172-31-47-93 ~]$ sudo ./atlassian-jira-software-7.8.0-x64.bin
Unpacking JRE ...
Starting Installer .. .
Mar 17, 2018 3:29:06 AM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
Mar 17, 2018 3:29:06 AM java.util.prefs.FileSystemPreferences$2 run
INFO: Created system preferences directory in java.home.

This will install JIRA Software 7.8.0 on your computer.
OK [o, Enter], Cancel [c]
o
Choose the appropriate installation or upgrade option.
Please choose one of the following:
Express Install (use default settings) [1], Custom Install (recommended for advanced users) [2, Enter], Upgrade an existing JIRA installation [3]
1
Details on where JIRA Software will be installed and the settings that will be used.
Installation Directory: /opt/atlassian/jira
Home Directory: /var/atlassian/application-data/jira
HTTP Port: 8080
RMI Port: 8005
Install as service: Yes
Install [i, Enter], Exit [e]
i

Extracting files ...


Please wait a few moments while JIRA Software is configured.
Installation of JIRA Software 7.8.0 is complete
Start JIRA Software 7.8.0 now?
Yes [y, Enter], No [n]
y

Please wait a few moments while JIRA Software starts up.
Launching JIRA Software ...
Installation of JIRA Software 7.8.0 is complete
Your installation of JIRA Software 7.8.0 is now ready and can be accessed
via your browser.
JIRA Software 7.8.0 can be accessed at http://localhost:8080
Finishing installation ...
'

#Launch the URL with http://<publicIP>:8080

#Please refer AWS-JIRA-PostgreSQL-installation.doc for furthur steps to finish the complete JIRA Setup.

#=============================JIRA INSTALLATION END==============================#
