
## VPN

#### Step-1: Create VPC/Subnet/RT/IGW/NAT
  
			1 VPC, 2 subnets(1 public, 1 private), 2 RT(1 private, 1 public), IGW for public RT, NAT for private RT
	
#### Step-2: Create a server (public EC2 Instance into your VPC) using the AMI OpenVPN Server (from the AWS Market Place).

   * For this practice, you can choose type **t2.micro**.
   * By default, it will creae one security group.
   * Create Elastic IP and assign to OpenVPN server.
   
      
   ![image](https://user-images.githubusercontent.com/24622526/50554128-069f8700-0cdb-11e9-9cd8-e57f1a891b33.png)

#### Step-3: Connect to open VPN server and agree the terms

			Please enter 'yes' to indicate your agreement [no]: yes

			Once you provide a few initial configuration settings,
			OpenVPN Access Server can be configured by accessing
			its Admin Web UI using your Web browser.

			Will this be the primary Access Server node?
			(enter 'no' to configure as a backup or standby node)
			> Press ENTER for default [yes]: yes

			Please specify the network interface and IP address to be
			used by the Admin Web UI:
			(1) all interfaces: 0.0.0.0
			(2) eth0: 10.1.1.36
			Please enter the option number from the list above (1-2).
			> Press Enter for default [2]: yes
			Error: This is an invalid option.

			Please specify the network interface and IP address to be
			used by the Admin Web UI:
			(1) all interfaces: 0.0.0.0
			(2) eth0: 10.1.1.36
			Please enter the option number from the list above (1-2).
			> Press Enter for default [2]: yes
			Error: This is an invalid option.

			Please specify the network interface and IP address to be
			used by the Admin Web UI:
			(1) all interfaces: 0.0.0.0
			(2) eth0: 10.1.1.36
			Please enter the option number from the list above (1-2).
			> Press Enter for default [2]: yes
			Error: This is an invalid option.

			Please specify the network interface and IP address to be
			used by the Admin Web UI:
			(1) all interfaces: 0.0.0.0
			(2) eth0: 10.1.1.36
			Please enter the option number from the list above (1-2).
			> Press Enter for default [2]: 2

			Please specify the port number for the Admin Web UI.
			> Press ENTER for default [943]: 943

			Please specify the TCP port number for the OpenVPN Daemon
			> Press ENTER for default [443]: 443

			Should client traffic be routed by default through the VPN?
			> Press ENTER for default [no]: yes

			Should client DNS traffic be routed by default through the VPN?
			> Press ENTER for default [no]: yes

			Use local authentication via internal DB?
			> Press ENTER for default [yes]: yes

			Private subnets detected: ['10.1.0.0/16']

			Should private subnets be accessible to clients by default?
			> Press ENTER for EC2 default [yes]: yes

			To initially login to the Admin Web UI, you must use a
			username and password that successfully authenticates you
			with the host UNIX system (you can later modify the settings
			so that RADIUS or LDAP is used for authentication instead).

			You can login to the Admin Web UI as "openvpn" or specify
			a different user account to use for this purpose.

			Do you wish to login to the Admin UI as "openvpn"?
			> Press ENTER for default [yes]: yes

			> Please specify your OpenVPN-AS license key (or leave blank to specify later):


			Initializing OpenVPN...
			Adding new user login...
			useradd -s /sbin/nologin "openvpn"
			Writing as configuration file...
			Perform sa init...
			Wiping any previous userdb...
			Creating default profile...
			Modifying default profile...
			Adding new user to userdb...
			Modifying new user as superuser in userdb...
			Getting hostname...
			Hostname: 52.4.90.2
			Preparing web certificates...
			Getting web user account...
			Adding web group account...
			Adding web group...
			Adjusting license directory ownership...
			Initializing confdb...
			Generating init scripts...
			Generating PAM config...
			Generating init scripts auto command...
			Starting openvpnas...

			NOTE: Your system clock must be correct for OpenVPN Access Server
			to perform correctly.  Please ensure that your time and date
			are correct on this system.

			Initial Configuration Complete!

			You can now continue configuring OpenVPN Access Server by
			directing your Web browser to this URL:

			https://52.4.90.2:943/admin
			Login as "openvpn" with the same password used to authenticate
			to this UNIX host.

			During normal operation, OpenVPN AS can be accessed via these URLs:
			Admin  UI: https://52.4.90.2:943/admin
			Client UI: https://52.4.90.2:943/

			See the Release Notes for this release at:
			   http://www.openvpn.net/access-server/rn/openvpn_as_2_5.html

			openvpnas@openvpnas2:~$ sudo passwd openvpn
			Enter new UNIX password:
			Retype new UNIX password:
			passwd: password updated successfully

#### Step-4: As mentioned in the above output, connect to https://52.4.90.2:943/admin as an admin.

			Deafult admin username: openvpn
			Password you set in the above steps.

			Aggree the terms.

			Create the new admin/normal Users under "User Permissions"

#### Step-5: Launch public EC2 instance.

   * Create a new security group while launch the EC2 instance. 
   * Open the port 22 and update the inbound rules with **Open VPN Server's SG** or IP address(i.e, PublicIP/32).
   * Try to connect to this public EC2 instance. (You can't able to connect to the EC2 instance at this time).

#### Step-6: Normal users of VPN can connect to https://52.4.90.2:943/
		
      (Where as admins can connect to https://52.4.90.2:943/admin)

   * Once the normal user logged into VPN site, there are few links to download VPN Clients, so that you can directly login to VPN Server through VPN client.

   * Before you connect to VPN server (login to the VPN server from the OpenVPN client), check the IP address: http://www.myipaddress.com/
   
   * After you connected to VPN Server, check the IP address: http://www.myipaddress.com/
			
#### Step-7: Test the connection

   * Login into VPN serevr either admin/normal user creds.
   * Try to connect to EC2 instance.
   * Logout from VPN Serevr, check still the public instance connected.

#### Step-8: Disconnect from OpenVPN client, check the terminal still you connected to the instance or not.

Note that..

To delete the entire network, follow the below steps

* Delete VPN server first.

* Delete EC2 instances.

* Delete NAT

* Delete Elastic IPs

* Delete VPC. (It will automatcally removed SG, IGW, RT, Subnets etc)
