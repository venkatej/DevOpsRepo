### What is a Network?

   * A network consists of two or more computers that are linked in order to share resources (such as printers and CDs), exchange files, or allow electronic communications. The computers on a network may be linked through cables, telephone lines, radio waves, satellites, or infrared light beams.

### IP Address: 

   * IP number. Internet address. Whatever you call it, it's your link to the world.

   * "It's a network address for your computer so the Internet knows where to send you emails, data and pictures."

   * An Internet Protocol address (IP address) is a logical numeric address that is assigned to every single computer, printer, switch, router or any other device that is part of a TCP/IP-based network.

   * The IP address is the core component on which the networking architecture is built; no network exists without it. An IP address is a logical address that is used to uniquely identify every node in the network. 

   * They are similar to addresses in a town or city because the IP address gives the network node an address so that it can communicate with other nodes or networks, just like mail is sent to friends and relatives.

   * Internet Protocol version 4 (IPv4) defines an IP address as a 32-bit number.

   * Internet Protocol version 6 (IPv6) defines an IP address as a 128-bit number.

   * IP addresses are usually written and displayed in human-readable notations, such as 172.16.254.1 in IPv4, and 2001:db8:0:123:0:567:8:1 in IPv6. 

   * IP addresses falls into two types:

	 * Classfull IP addressing is a legacy scheme which divides the whole IP address pools into 5 distinct classes—A, B, C, D and E.(for more details, see [Classfull wiki](https://en.wikipedia.org/wiki/Classful_network) ).
	 * Classless IP addressing has an arbitrary length of the prefixes. (for more details, see  [CIDR wiki](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) ).

   * Classless Inter-Domain Routing (CIDR) is a method for allocating IP addresses.

	     172.31.0.0/20 = 2^(32-20) = 2^12 = 4096
  
             https://www.ipaddressguide.com/cidr

##### Public IP Address

   * A public IP address is an IP address that can be accessed over the Internet. Like postal address used to deliver a postal mail to your home, a public IP address is the globally unique IP address assigned to a computing device. 
   
   * A public IP address is the address that is assigned to a computing device to allow direct access over the Internet. 
   
   * A web server, email server and any server device directly accessible from the Internet are candidate for a public IP address.
   
   * A public IP address is globally unique, and can only be assigned to a unique device.
   
##### Private IP Address

   * Private IP address, is used to assign computers within your private space without letting them directly expose to the Internet. For example, if you have multiple computers within your home you may want to use private IP addresses to address each computer within your home.
   
   * Internet Assigned Numbers Authority (IANA) is the organization responsible for registering IP address ranges to organizations and Internet Service Providers (ISPs). 
   
   * To allow organizations to freely assign private IP addresses, the Network Information Center (InterNIC) has reserved certain address blocks for private use.
   
   * The following IP blocks are reserved for private IP addresses.
   
   | Class | Starting IP Address | Ending IP Address | Number of IPs |
   | --- | --- | --- | --- |
   | A | 10.0.0.0 | 10.255.255.255 | 16,777,216 |
   | B | 172.16.0.0 | 172.31.255.255 | 1,048,576 |
   | C | 192.168.0.0 | 192.168.255.255 | 65,536 |

   * A private IP address is the address space allocated by InterNIC to allow organizations to create their own private network. There are three IP blocks (1 class A, 1 class B and 1 class C) reserved for a private use.
   
   * The computers, tablets and smartphones sitting behind your home, and the personal computers within an organizations are usually assigned private IP addresses.
   
   * Ex, A network printer residing in your home is assigned a private address so that only your family can print to your local printer.

   * When  a computer is assigned a private IP address, the local devices see this computer via it's private IP address. However, the devices residing outside of your local network cannot directly communicate via the private IP address, but uses your router's public IP address to communicate. To allow direct access to a local device which is assigned a private IP address, a Network Address Translator (NAT) should be used.
  
   * Refer: https://en.wikipedia.org/wiki/Private_network
   
   * Refer: https://en.wikipedia.org/wiki/Reserved_IP_addresses
