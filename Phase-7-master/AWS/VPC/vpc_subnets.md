### Amazon VPC

Refer: https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html

* Amazon Virtual Private Cloud (Amazon VPC) enables you to launch AWS resources into a virtual network that you've defined. 

* This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.

* Amazon VPC is the networking layer for Amazon EC2. 

* A virtual private cloud (VPC) is a virtual network dedicated to your AWS account.

* It is logically isolated from other virtual networks in the AWS Cloud. 

* You can launch your AWS resources, such as Amazon EC2 instances, into your VPC. 

* You can specify an IP address range for the VPC, add subnets, associate security groups, and configure route tables.

### Subnets:

* A subnet is a logical partition of an IP network into multiple, smaller network segments. 

* It is typically used to subdivide large networks into smaller, more efficient subnetworks.

* A subnet is a range of IP addresses in your VPC. You can launch AWS resources into a specified subnet.

* Use a public subnet for resources that must be connected to the internet.

* Use a private subnet for resources that won't be connected to the internet.

* To protect the AWS resources in each subnet, you can use multiple layers of security, including security groups and network access control lists (ACL).

* If a subnet's traffic is routed to an internet gateway, the subnet is known as a public subnet. 

### Route Tables:

* A route table contains a set of rules, called routes, that are used to determine where network traffic is directed.

* Each subnet in your VPC must be associated with a route table; the table controls the routing for the subnet. 

* A subnet can only be associated with one route table at a time, but you can associate multiple subnets with the same route table.

* Your VPC automatically comes with a main route table that you can modify.

* You can create additional custom route tables for your VPC.

* Each subnet must be associated with a route table, which controls the routing for the subnet. If you don't explicitly associate a subnet with a particular route table, the subnet is implicitly associated with the main route table.

* Each route in a table specifies a destination CIDR and a target.

* Every route table contains a local route for communication within the VPC over IPv4. If your VPC has more than one IPv4 CIDR block, your route tables contain a local route for each IPv4 CIDR block.

* When you add an Internet gateway, an egress-only Internet gateway, a virtual private gateway, a NAT device, a peering connection, or a VPC endpoint in your VPC, you must update the route table for any subnet that uses these gateways or connections.

### Internet Gateways:

* An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances in your VPC and the internet. It therefore imposes no availability risks or bandwidth constraints on your network traffic.

* An internet gateway serves two purposes: to provide a target in your VPC route tables for internet-routable traffic, and to perform network address translation (NAT) for instances that have been assigned public IPv4 addresses.

### NAT: Network Address Translation

* You can use a NAT device to enable instances in a private subnet to connect to the internet (for example, for software updates) or other AWS services, but prevent the internet from initiating connections with the instances.

* A NAT device forwards traffic from the instances in the private subnet to the internet or other AWS services, and then sends the response back to the instances. 

* When traffic goes to the internet, the source IPv4 address is replaced with the NAT device’s address and similarly, when the response traffic goes to those instances, the NAT device translates the address back to those instances’ private IPv4 addresses.

* NAT devices are not supported for IPv6 traffic—use an egress-only Internet gateway instead. 

* AWS offers two kinds of NAT devices—a NAT gateway or a NAT instance. We recommend NAT gateways, as they provide better availability and bandwidth over NAT instances.

* What is NAT?

    * NAT is designed for IP address conservation. It enables private IP networks that use unregistered IP addresses to connect to the Internet.

 * How does NAT work?

    * NAT allows a single device, such as a router, to act as an agent between the Internet and a local network, which means a single unique IP address is required to represent an entire group of computers to public network i.e Outside of their Network.

 * What is NAT Instance ?

    * NAT instance enable instances in the private subnet to initiate outbound traffic to the Internet, but prevent the instances from receiving inbound traffic initiated by someone on the Internet.

Note: NAT Instance is a legacy, You can use NAT Gateway. Refer: https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html

### Security

Refer: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Security.html

Amazon Virtual Private Cloud provides features that you can use to increase and monitor the security for your virtual private cloud (VPC):

* **Security groups** — Act as a firewall for associated Amazon EC2 instances, controlling both inbound and outbound traffic at the instance level.

* **Network access control lists (ACLs)** — Act as a firewall for associated subnets, controlling both inbound and outbound traffic at the subnet level.

You can secure your VPC instances using only security groups; however, you can add network ACLs as an additional layer of defense.

### Amazon VPC Limits:

* Refer: https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html


