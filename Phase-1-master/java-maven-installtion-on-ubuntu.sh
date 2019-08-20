#Reference: https://thishosting.rocks/install-java-ubuntu/

#login to root
echo login to root
sudo -i

#===========================JAVA INSTALLATION START==========================================

#Update the packages
apt-get update && apt-get upgrade

apt-get install software-properties-common

#Add java packages to repo
add-apt-repository ppa:webupd8team/java

#Update & install java
apt-get update

apt-get install oracle-java8-installer

#Check java
java -version

#find the jdk path
find / -name "java"

#Java path setup
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/

export PATH=$JAVA_HOME/bin:$PATH

#===========================JAVA INSTALLATION END=========================================

#===========================MAVEN SETUP START========================================================

#Maven Setup:
echo Maven Setup:
#Download maven:
echo Download maven:
 wget http://mirror.cogentco.com/pub/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

#Unzip tar file
echo Unzip tar file
 tar zxpvf apache-maven-3.5.4-bin.tar.gz

#maven home path depedns on the user: here we are running from root user. /home/ec2-user/apache-maven-3.5.4
echo maven home: /root/apache-maven-3.5.4

#Setup Maven
export MAVEN_HOME=/root/apache-maven-3.5.4

export M3=$MAVEN_HOME/bin

export PATH=$M3:$PATH

#check maven: mvn -v
echo check maven: mvn -v
mvn -v

#===========================MAVEN SETUP END========================================================


