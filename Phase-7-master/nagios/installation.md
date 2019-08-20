
## Step-1: Nagios Installtion on Ubuntu: 

##### Installtion steps in official page : https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#Ubuntu


##### 1.1. Launch an "Ubuntu Server 16.04" in AWS.

##### 1.2. Connect to the machine

      sudo -i
      
      hostname NagiosServer
      
      echo NagiosServer > /etc/hostname OR vi /etc/hostname
      
      exit and connect to the machine again.
      
      
![image](https://user-images.githubusercontent.com/24622526/44909089-87d71500-ad0d-11e8-9a8e-718e8cd7244a.png)

    
##### 1.3. Install required dependencies

      sudo apt-get update
      sudo apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.0 libgd2-xpm-dev
      
##### 1.4. Download Nagios

      cd /tmp
      wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.1.tar.gz
      tar xzf nagioscore.tar.gz
      
##### 1.5. Compile

      cd /tmp/nagioscore-nagios-4.4.1/
      sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
      sudo make all
      
##### 1.6. Create User And Group

      sudo make install-groups-users
      sudo usermod -a -G nagios www-data
      
##### 1.7. Install Binaries

      sudo make install

##### 1.8. Install Service / Daemon

      sudo make install-daemoninit

##### 1.9. Install Command Mode

      sudo make install-commandmode

##### 1.10. Install Configuration Files

      sudo make install-config

##### 1.11. Install Apache Config Files

      sudo make install-webconf
      sudo a2enmod rewrite
      sudo a2enmod cgi

##### 1.12. Configure Firewall

      sudo ufw allow Apache
      sudo ufw reload

##### 1.13. Create nagiosadmin User Account

      sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
      
* Note: If you create a user with a name other than nagiosadmin, you will need to edit /usr/local/nagios/etc/cgi.cfg and change all the nagiosadmin references to the user you created.

##### 1.14. Start Apache Web Server

      sudo systemctl restart apache2.service

##### 1.15. Start Service / Daemon

      sudo systemctl start nagios.service

##### 1.16. Launch nagios in brwoser at http://10.25.5.143/nagios

![image](https://user-images.githubusercontent.com/24622526/44911177-7a258d80-ad15-11e8-8b62-e21becb77313.png)


![image](https://user-images.githubusercontent.com/24622526/44909446-eb157700-ad0e-11e8-919d-68a357bc8244.png)

* Error message: (No output on stdout) stderr: execvp(/usr/local/nagios/libexec/check_load, ...) failed. errno is 2: No such file or directory 

* to fix this, we need to install plugins.

## Step-2: Install Plugins

##### 2.1. Install packages:

      sudo apt-get install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext

##### 2.2. Downloading The plugins

      cd /tmp
      wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
      tar zxf nagios-plugins.tar.gz


##### 2.3. Compile + Install the plugins

      cd /tmp/nagios-plugins-release-2.2.1/
      sudo ./tools/setup
      sudo ./configure
      sudo make
      sudo make install
      
* http://10.25.5.143/nagios

* Wait for some time and launch the above URL in browser The error you previously saw should now disappear and the correct output will be shown on the screen.

![image](https://user-images.githubusercontent.com/24622526/44909610-81499d00-ad0f-11e8-8c66-34ad9aa5428d.png)

##### Commands to START/STOP/RESTART/STATUS nagios.

      sudo systemctl start nagios.service
      sudo systemctl stop nagios.service
      sudo systemctl restart nagios.service
      sudo systemctl status nagios.service
      
## Step-3: Installing the check_nrpe Plugin

##### 3.1. Download & extract nrpe

      cd ~
      curl -L -O https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-3.2.1/nrpe-3.2.1.tar.gz
      
      tar zxf nrpe-*.tar.gz
      
      cd nrpe-*
      
##### 3.2. Configure check_nrpe

      ./configure

##### 3.3. build and install check_nrpe

      make check_nrpe
      sudo make install-plugin
      
## Step-4: Configuring Nagios

##### 4.1. Edit the file: vi /usr/local/nagios/etc/nagios.cfg

      Uncomment the line
      cfg_dir=/usr/local/nagios/etc/servers
      
##### 4.2. create the directory that will store the configuration file for each server that you will monitor

      mkdir /usr/local/nagios/etc/servers
      
##### 4.3. add a new command to your Nagios configuration that lets you use the check_nrpe

      vi /usr/local/nagios/etc/objects/commands.cfg

* Add the following to the end of the file to define a new command called check_nrpe:

      define command{
              command_name check_nrpe
              command_line $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
      }

## Step-5: Installing NPRE on a Host

* Create an Ubuntu machine.

* Connect to the ubuntu instance.

      sudo -i

      sudo useradd nagios

      sudo apt-get update

      sudo apt-get install build-essential libgd2-xpm-dev openssl libssl-dev unzip -y
      
      cd ~

      curl -L -O http://nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
      
      tar zxf nagios-plugins-*.tar.gz
      
      cd nagios-plugins-*
      
      ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
      
      make
      
      make install

      cd ~
      curl -L -O https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-3.2.1/nrpe-3.2.1.tar.gz
      
      tar zxf nrpe-*.tar.gz
      
      cd nrpe-*
      
      ./configure --enable-command-args --with-nagios-user=nagios --with-nagios-group=nagios --with-ssl=/usr/bin/openssl --with-ssl-lib=/usr/lib/x86_64-linux-gnu
      
      make all
      sudo make install
      sudo make install-config
      sudo make install-init
      
      vi /usr/local/nagios/etc/nrpe.cfg
      
* Add the PRIVATE IP address of Nagios Server.

      ![image](https://user-images.githubusercontent.com/24622526/44913127-f4591080-ad1b-11e8-895e-2d7b564442dd.png)

* Start NRPE:

      systemctl start nrpe.service
      
* check the status of NRPE:

      systemctl status nrpe.service
      
![image](https://user-images.githubusercontent.com/24622526/44913309-7fd2a180-ad1c-11e8-85e5-bd246a7d02ef.png)

* allow access to port 5666 through the firewall.

      ufw allow 5666/tcp 
      
Step-6: On Nagios Server:

* Run the following command on the Nagios server:

      /usr/local/nagios/libexec/check_nrpe -H private-ip-address-of-host
      
      Output: 
      NRPE v3.2.1
      

      
---


### Installation and configure hosts: https://www.digitalocean.com/community/tutorials/how-to-install-nagios-4-and-monitor-your-servers-on-ubuntu-16-04

After the installtion & setup done

![image](https://user-images.githubusercontent.com/24622526/44900118-46d20700-acf3-11e8-99f3-7ce337c4b4fc.png)

Stopping the server:

![image](https://user-images.githubusercontent.com/24622526/44900064-286c0b80-acf3-11e8-9217-a5bb4cb7e748.png)

Server Stopped:

![image](https://user-images.githubusercontent.com/24622526/44900092-3752be00-acf3-11e8-9ff4-df3899d80902.png)

Server Status in Nagios:

![image](https://user-images.githubusercontent.com/24622526/44899831-674d9180-acf2-11e8-81e6-d0a51677ead4.png)

Start the client server and wait for sometime (then refresh the nagios server in browser)

![image](https://user-images.githubusercontent.com/24622526/44899983-eba01480-acf2-11e8-9317-ff1e61660f71.png)

https://www.linkedin.com/pulse/container-monitoring-nagios-vinay-thakur/

