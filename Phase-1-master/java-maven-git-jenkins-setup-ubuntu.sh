# Refer: https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04

apt update -y && apt install openjdk-8-jdk git -y

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

export PATH=$JAVA_HOME/bin:$PATH

#Check java
echo Check the java version
java -version


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

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update

sudo apt install jenkins

systemctl status jenkins



