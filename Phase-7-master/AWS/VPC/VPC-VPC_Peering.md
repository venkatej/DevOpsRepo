## VPC to VPC - peer connection

https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html

https://aws.amazon.com/vpc/pricing/

https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html

https://docs.aws.amazon.com/vpc/latest/peering/create-vpc-peering-connection.html#create-vpc-peering-connection-local

https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-routing.html

VPC to VPC peering

1. peering connection b/w two different VPCs but same regions, same AWS account.
2. peering connection b/w two different VPCs but different regions, same AWS account.
3. peering connection b/w two different VPCs but different AWS accounts.

Scenario is, I want to connect from MU public instance to NV private instance. (second one from the above) 

#### Step-1: Created VPC/Subnet/RT/IGW/NAT in N.Virginia , and Mumbai regions.

   * each region, 
	
	1 VPC, 2 subnets(1 public, 1 private), 2 RT(1 private, 1 public), IGW for public RT, NAT for private RT

   * For NV 
   
	VPC - 10.1.0.0/16
	Private NV subnets - 10.1.1.0/28
	Public NV subnets - 10.1.2.0/28

   * For MU

	VPC - 10.2.0.0/16
	Private MU subnets - 10.2.1.0/28
	Public MU subnets - 10.2.2.0/28

#### Step-2: Create two instances(1 public, 1 private) in each region.

   * Create two instances in MU region (one public, one private)

	sudo -i
	hostname mu-public-instance
	echo "mu-public-instance" > /etc/hostname
	exit
	exit

	sudo -i
	hostname mu-private-instance
	echo "mu-private-instance" > /etc/hostname
	exit
	exit

   * Create two instances in NV region (one public, one private)

	sudo -i
	hostname nv-public-instance
	echo "nv-public-instance" > /etc/hostname
	exit
	exit

	sudo -i
	hostname nv-private-instance
	echo "nv-private-instance" > /etc/hostname
	exit
	exit

#### Step-3: To achieve this scenario, create a peer connection b/w two VPCs which are in different regions.

   3.1. Here, the requester VPC is - MU-VPC, Accepter(receiver) VPC is NV-VPC.
	
	So, we have to create peer connection from the requester MU-VPC.

	From MU region:
		3.1.1. Go to https://console.aws.amazon.com/vpc/
		3.1.2. Peering Connections
		3.1.3. Create Peering Connection, Refer: https://docs.aws.amazon.com/vpc/latest/peering/create-vpc-peering-connection.html
		
	From NV region:
		3.1.4. Go to https://console.aws.amazon.com/vpc/
		3.1.5. Peering Connections
		3.1.6. Now you can see the requester's peer connection id as similar to pcx-0d7fdfdfsdfsafa53g, and the status shows as "pending". See, VPC Peering Connection Lifecycle: https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-basics.html
		3.1.7. Actions --> Accept request --> status will be changed as "Active"

#### Step-4: Update the route tables, https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-routing.html

	As per the requirement "Example-1", we need to connect from public MU region instance to private NV region instance.
	
	4.1. Go to the route table in MU public route table, and add a rule "Destination" as "10.1.1.0/28" (NV private Subnet range) OR you can give NV VPC IP range OR NV-PRIVATE-IP-ADDRESS/32 and "Target" as peer connection "pcx-0d7fdfdfsdfsafa53g".
	
	4.2. Go to the route table in NV private route table, and add a rule "Destination" as "10.2.2.0/28"(MU public Subnet range) OR you can give MU VPC IP range OR MU-PUBLIC-IP-ADDRESS/32 and "Target" as peer connection "pcx-0d7fdfdfsdfsafa53g".

#### Step-5: Test the peer connection

	5.1. Connect to public MU instance.
	5.2. Create pem file and update with private key.
	5.3. chmod 400 nv.pem file.
	5.4. ssh -i nv.pem user@nv-private-instance-ip
	5.5. You should able to connect to NV private instance from MU public instance. (You should not able to connect connect to NV private instance from your local terminal (or) another machine which is from other VPC.
	
**Try this**

1. try to connect from mu private instance to nv private instance. (Its possible)

2. try to connect from nv public to mu private instance. (Its possible, if you update the RT rules/settings)

**Delete**

1. peering connection (delete from any one of the region)

2. instances (in both the regions)

3. NAT Gateway

4. Elastic IPs

5. VPC (It will remove Security Groups, RT, Subnets, IGW, etc)
