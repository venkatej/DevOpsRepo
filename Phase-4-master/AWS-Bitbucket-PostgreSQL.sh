# If we need to install bitbucket, we need minimum 2GB machines.

# This has been tested on t2.medium machine - 4 GB RAM - Ubuntu OS

#Login to the root
sudo -i

#system update
sudo apt-get update
sudo apt-get -y upgrade

#=========================DB INSTALLATION START===============================================#

#Install the PostgreSQL repository
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -

#Install the PostgreSQL
sudo apt-get -y install postgresql postgresql-contrib

#Start PostgreSQL server and enable it to start automatically at boot time by running
#sudo systemctl start postgresql
#sudo systemctl enable postgresql

#Change the password for the default PostgreSQL user, eneter the pwd and please remember it.
sudo passwd postgres

#Switch to the postgres user.
su - postgres

#Create a new user by typing:
createuser bitbucket

#Switch to the PostgreSQL shell to create database.
psql

#Set a password for the newly created user for SonarQube database. You can give any name for username & pwd. But make sure you should refer the same credentials in sonar.properties file.
ALTER USER bitbucket WITH ENCRYPTED password 'bitbucket';

#Create a new database for PostgreSQL database by running:
CREATE DATABASE bitbucket OWNER bitbucket;

#Exit from the psql shell:
\q

#Switch back to the sudo user by running the 'exit' command.

#=========================DB INSTALLATION END===============================================#


#=============================JIRA INSTALLATION START==============================#

sudo apt-get install wget -y

#download jira
sudo wget https://product-downloads.atlassian.com/software/stash/downloads/atlassian-bitbucket-6.1.3-x64.bin

#ls -- whether the bin file downloaded or not.
echo'
[ec2-user@ip-172-31-47-93 ~]$ ls
atlassian-bitbucket-6.1.3-x64.bin
'

chmod a+x atlassian-bitbucket-6.1.3-x64.bin

sudo ./atlassian-bitbucket-6.1.3-x64.bin

echo'
[root@ip-172-31-21-34 ~]# sudo ./atlassian-bitbucket-6.1.3-x64.bin
Unpacking JRE ...
Starting Installer ...



Unable to find Git! Please install Git before installing Bitbucket.
For more information please visit: http://go.atlassian.com/installgit
NOTE: If you proceed without a working Git, Bitbucket won't be able to start
after installation until a working Git is found.
If you proceed without a working Git, Bitbucket won't be able to start after installation.
Are you sure you want to continue?
Yes [y, Enter], No [n]
y
Bitbucket 6.1.3 installation wizard
Would you like to install or upgrade an instance?
Install a new instance [1, Enter], Upgrade an existing instance [2]
1
Install Bitbucket 6.1.3
What type of instance are you looking to install?
Install a Server instance [1, Enter], Install a Data Center instance [2], Install a Smart Mirroring instance [3]
1
Where should Bitbucket be installed?

[/opt/atlassian/bitbucket/6.1.3]

Default location for Bitbucket home directory

The location for Bitbucket data.
This will be the default location for repositories, plugins, and other data.

Ensure that this location is not used by another Bitbucket installation.
[/var/atlassian/application-data/bitbucket]

Configure which ports Bitbucket will use.


Bitbucket requires a TCP port that isn't being used by other applications.

The HTTP port is where users access Bitbucket through their browsers.

Bitbucket also requires ports 7992 and 7993 are available to run an embedded
Elasticsearch instance that provides search functionality to Bitbucket.
HTTP Port Number
[7990]



For a production server we recommend that you run Bitbucket as a
Windows/Linux service because Bitbucket will restart automatically when the
computer restarts.
Install Bitbucket as a service?
Yes [y, Enter], No [n]
y
Please review your Bitbucket installation settings


Installation Directory: /opt/atlassian/bitbucket/6.1.3
Home Directory: /var/atlassian/application-data/bitbucket
HTTP Port: 7990
Install as a service: Yes

Install [i, Enter], Exit [e]
i
Git is missing. If you proceed Bitbucket won't be able to start after installation.
Are you sure you want to continue?
Yes [y, Enter], No [n]
y

Extracting files ...

Installation of Bitbucket is complete
Would you like to launch Bitbucket?
Yes [y, Enter], No [n]
y

Please wait a few moments while Bitbucket starts up.
Launching Bitbucket ...
Installation of Bitbucket 6.1.3 is complete
Your installation of Bitbucket 6.1.3 is now ready and can be accessed via
your browser.
Bitbucket 6.1.3 can be accessed at http://localhost:7990
Launch Bitbucket 6.1.3 in browser?
Yes [y, Enter], No [n]
y
Finishing installation ...
'

#Launch the URL with http://<publicIP>:7990

#Please refer AWS-Bitbucket-PostgreSQL-Installation.doc for furthur steps to finish the complete JIRA Setup.

#=============================JIRA INSTALLATION END==============================#
