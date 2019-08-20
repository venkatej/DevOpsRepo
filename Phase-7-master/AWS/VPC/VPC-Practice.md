## VPC Practice:

* Refer:

	* https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html

	* https://aws.amazon.com/vpc/pricing/

#### Step-1: Create VPC

	When VPC created 

		default Network ACL added to VPC.
		One new Route Table created.
		IPv4 CIDR - 10.1.0.0/16

	  After the VPC created --> select the VPC --> Actions --> Edit DNS hostnames --> Enable.

#### Step-2: Create Subnets

		IPv4 CIDR - 10.1.1.0/24
		Enable auto assign public IP
		Go to the route table which is created when VPC created, Subnet Associate

		After you created the Subnet --> choose subnet --> Actions --> Modify auto-assign IP settings --> Enable Auto-assign IPv4.

**Try this**: Create an instance by specifying the above details. and try to connect.

#### Step-3: Create IGW

		attach to VPC (after IGW created)
		Attach to Route Table (Edit Routes)

**Try this**: Try to connect to EC2 instance now.

This is called public subnet.

#### Step-4: Create Subnets (private)

		IPv4 CIDR - 10.1.2.0/24

### Step-5: Create Route Table

		Create RT
    
		Go to route table, Subnet Associate - choose private subnet
		
**Try this and observe**:

   1. Create an private instance by specifying the above details. and try to connect directly from your terminal (Gitbash or putty etc).
   2. Connect to public instance and copy the pem key into your connected public instance and give permissions on pem file(chmod 400 file.pem), and then try to connect to private instance.
   3. apt-get update -y && apt-get install nginx -y (or)  yum update -y && yum install nginx -y
   
   It will not download anything from Internet.. if you want download anything from internet.. go for NAT.

### Step-6: Create NAT Gateway/instance.

	Select public Subnet id
	Create Elastic IP
	Edit Route Tables to add NAT Gateway to Private Subnet.

**Try this**: Run the command again: apt-get update -y && apt-get install nginx -y (or)  yum update -y && yum install nginx -y

![image](https://user-images.githubusercontent.com/24622526/50402514-40ddc580-07bd-11e9-92c2-3583f3395798.png)

**Example:**

* Create 2 public instances under public Subnets 

       - the instance names: public-in-1, public-in-2
       - the security group name: public

* Create 1 private instances under private Subnets

       - private instance name: private-in-1
       - the security group name: private

* Create 1 instance from other VPC. 

        - private instance name: other-vpc-in
        - the security group name: default

* Try to directly connect to private instance.

* Try to connect private instance from public-in-1,public-in-2, other-vpc-in  what is happening?

    * Update the security group of private-in-1, as to connect only to public-in-1 - open the port 22 ssh for public-in-1.

    * Update the security group of private-in-1, as to connect only to public-in-2 - open port 22 ssh for public-in-2.

    * Update the security group of private-in-1, as to connect only to other-vpc-in - open port 22 ssh for other-vpc-in.

    * Update the security group of private-in-1, as to connect only to public-in-1, public-in-2 - port 22 ssh

    * Update the security group of private-in-1, as to connect only public-in-2 - port 80 http

* Practice with simple java web application:

	* Default VPC: https://github.com/venkatasykam/DevOpsWebApp/tree/jdbc-ec2
	
	* Non default VPC(our own VPC): Public EC2 instance and private RDS mysql db server: https://github.com/venkatasykam/DevOpsWebApp/tree/jdbc-vpc

	* Non default VPC(our own VPC): Public EC2 instance for web app & private EC2 instance for mysql db server: https://github.com/venkatasykam/DevOpsWebApp/tree/jdbc-vpc-example-2

**Try this**:

* Disable the option "auto assign public IPv4 address" for public subnet.

	* Create EC2 instance into **public** subnet. This instance will not have any public ip as we disabled in subnet settings.
	* Try to connect to public istance (It will not connect with private IP address)
	* Create ElasticIP and associate with public ec2 instance. Try to connect now with elastic IP, **it will connect** with public IPv4 address which is elastic IP.

* Make sure the option is disabled "auto assign public IPv4 address" for private subnet.

	* Create EC2 instance into **private** subnet. This instance will not have any public ip as we disabled in subnet settings.
	* Try to connect to public istance (It will not connect with private IP address)
	* Create ElasticIP and associate with public ec2 instance. Try to connect now with elastic IP, **it will NOT connect** even with public IPv4 address which is elastic IP.
	* If you really really wants to connect to your private instance, two ways
		* connect from your public instance.
		* make your private instance as public instance. (For this, associate the private subnet with public route table OR update the private route table rutes with IGW, remove NAT gateway).

---

**when we should go for NAT?**

  * connect to private-in-1 (from public-in-1 or public-in-2), try to run the command: apt-get update- y (or) apt-get install nginx -y
  
  * Nothing will be connected to internet, download from internet as this is private instance(belongs to private subnet) and traffic controlled by private route table.
  
  * NAT Gateways will allow only one way traffic, i.e., private instance can connect to the internet but, internet can't connect to the private instance.
  
  * You can use a NAT device to enable instances in a private subnet to connect to the internet (for example, for software updates) or other AWS services, but prevent the internet from initiating connections with the instances. A NAT device forwards traffic from the instances in the private subnet to the internet or other AWS services, and then sends the response back to the instances. When traffic goes to the internet, the source IPv4 address is replaced with the NAT device’s address and similarly, when the response traffic goes to those instances, the NAT device translates the address back to those instances’ private IPv4 addresses.
  
**Note that..**

To delete the entire network, follow the below steps,

* Delete EC2 instances.

* Delete NAT

* Delete Elastic IPs

* Delete VPC. (It will automatcally removed SG, IGW, RT, Subnets etc)

