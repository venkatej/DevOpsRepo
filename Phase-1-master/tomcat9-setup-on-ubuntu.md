Refer: https://linuxize.com/post/how-to-install-tomcat-9-on-ubuntu-18-04/

sudo apt update && sudo apt install default-jdk -y

Jenkins home path: /usr/lib/jvm/java-11-openjdk-amd64/

sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat

wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz -P /tmp

sudo tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat

sudo ln -s /opt/tomcat/apache-tomcat-9.0.16 /opt/tomcat/latest

sudo chown -RH tomcat: /opt/tomcat/latest

sudo chmod o+x /opt/tomcat/latest/bin/

sudo vi /etc/systemd/system/tomcat.service

on RHEL - /usr/lib/systemd/system/tomcat.service


    [Unit]
    Description=Tomcat 9 servlet container
    After=network.target

    [Service]
    Type=forking

    User=tomcat
    Group=tomcat

    Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/"
    Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true"

    Environment="CATALINA_BASE=/opt/tomcat/latest"
    Environment="CATALINA_HOME=/opt/tomcat/latest"
    Environment="CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid"
    Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

    ExecStart=/opt/tomcat/latest/bin/startup.sh
    ExecStop=/opt/tomcat/latest/bin/shutdown.sh

    [Install]
    WantedBy=multi-user.target
    
 
sudo systemctl daemon-reload

sudo systemctl start tomcat

sudo systemctl status tomcat

sudo systemctl enable tomcat

sudo ufw allow 8080/tcp

sudo vi /opt/tomcat/latest/conf/tomcat-users.xml


    <tomcat-users>
    <!--
        Comments
    -->
       <role rolename="admin-gui"/>
       <role rolename="manager-gui"/>
       <user username="admin" password="admin_password" roles="admin-gui,manager-gui"/>
    </tomcat-users>

sudo vi /opt/tomcat/latest/webapps/manager/META-INF/context.xml

Comment everything b/w <Context></Context> tag.

    <Context antiResourceLocking="false" privileged="true" >
    <!--
      <Valve className="org.apache.catalina.valves.RemoteAddrValve"
             allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
    -->
    </Context>

sudo systemctl restart tomcat

http://[Public_IP_address]:8080

http://[Public_IP_address]:8080/manager/html
