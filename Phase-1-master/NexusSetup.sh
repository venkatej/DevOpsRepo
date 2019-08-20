#Nexus setup: http://clusterfrak.com/sysops/app_installs/nexus_install/#download-nexus-repository-oss

#go to root user: sudo -i or sudo su
sudo -i

#Install the packages that are needed to support Nexus Repository OSS
#yum clean all
yum update -y
#yum -y install sudo vim wget net-tools java-1.8.0-openjdk.x86_64
yum -y install wget java-1.8.0-openjdk.x86_64

#Create Installation Directory
mkdir /opt/nexus
cd /opt/nexus

#Download Nexus Repository OSS
wget http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz

#Unzip the nexus package
tar -xzvf nexus-latest-bundle.tar.gz

#Copy Init Script: Crosscheck the below source path before you run thios command
cp /opt/nexus/nexus-2.14.12-02/bin/nexus /etc/init.d/

#Change the Init Script with NEXUS_HOME path : Manual update
#vi /etc/init.d/nexus
#NEXUS_HOME="/opt/nexus/nexus-2.14.12-02"

#Add the Nexus User & set direcxtory permissions.
useradd nexus
chown -R nexus:nexus /opt/nexus/
chown nexus:nexus /etc/init.d/nexus

#cat /opt/nexus/nexus-2.14.12-02/conf/nexus.properties : Crosscheck this path & nexus.properties content.
#nexus-webapp-context-path=/nexus

#Login to nexus user & start nexus
su nexus
/etc/init.d/nexus start
service nexus status

#Launch the URL in any browser: http://<PublicIP>:8081/nexus


#Note:
#Note-1: Marked with the workds "Crosscheck" & "Update" for manual actions. Search for those workds in this file and take an action accordingly.
#Note-2:Please "Crosscheck" whether those details are correct are not. Update the paths if they are different.

#Installation Procedure:
#Step-1: Copy the lines from 4 to 22, and then paste it on yout terminal. All the commands will be executed one by one.
#Step-2: Manually you need to update the file /etc/init.d/nexus with NEXUS HOME as instructed in line number 22-25.
#Step-3: Copy the lines from 27 to 38, and then paste it on yout terminal. All the commands will be executed one by one.
#Step-4: Login with below default credentials.
#default user credentials
#Full admin access: Username/pwd: admin/admin123
#Partial admin access: Username/pwd: deployment/deployment123

#Go to maven home & update the settings.xml file with nexus user details.
#Example: vi /root/apache-maven-3.5.3/conf/settings.xml: update this settings file with below nexus credentials.
echo'
	<server>
		<id>deployment</id>
		<username>deployment</username>
		<password>deployment123</password>
	</server>
'
#Add the below details in your project pom.xml file. Make sure the IP is correct.
echo'
<distributionManagement>
	<repository>
		<id>deployment</id> <!-- this ID should match with server id which we configure in settings.xml file. -->
		<name>Nexus Release Repository</name>
		<url>http://18.219.252.49:8081/nexus/content/repositories/releases/</url>
	</repository>
	<snapshotRepository>
		<id>deployment</id>
		<name>Nexus Snapshots Repository</name>
		<url>http://18.219.252.49:8081/nexus/content/repositories/snapshots/</url>
	</snapshotRepository>
</distributionManagement>
'
