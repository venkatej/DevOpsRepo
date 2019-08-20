https://www.tecmint.com/linux-iptables-firewall-rules-examples-commands/

* check your existing rules: `iptables -L -n -v` or `iptables -L`

* check the rules of specific table: iptables -t nat -L -v -n

* Block Specific IP Address in IPtables Firewall: iptables -A INPUT -s xxx.xxx.xxx.xxx -j DROP

* Block only TCP trafic from the IP address: iptables -A INPUT -p tcp -s xxx.xxx.xxx.xxx -j DROP

* Unblock IP Address in IPtables Firewall: iptables -D INPUT -s xxx.xxx.xxx.xxx -j DROP

* Block Specific Port on IPtables Firewall:  

    * To block outgoing connections on a specific port use: iptables -A OUTPUT -p tcp --dport xxx -j DROP

    * To allow incoming connections use: iptables -A INPUT -p tcp --dport xxx -j ACCEPT

* Allow Multiple Ports on IPtables using Multiport:

    * iptables -A INPUT  -p tcp -m multiport --dports 22,80,443 -j ACCEPT
    * iptables -A OUTPUT -p tcp -m multiport --sports 22,80,443 -j ACCEPT
    
* Allow Specific Network Range on Particular Port on IPtables: iptables -A OUTPUT -p tcp -d 192.168.100.0/24 --dport 22 -j ACCEPT

* Block Facebook on IPtables Firewall: 

    * host facebook.com --> it will return IP address of facebook, exoutput: facebook.com has address 66.220.156.68
    * whois 66.220.156.68 | grep CIDR --> output: CIDR: 66.220.144.0/20
    * block facebook ip: iptables -A OUTPUT -p tcp -d 66.220.144.0/20 -j DROP
    
* Setup Port Forwarding in IPtables: iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j REDIRECT --to-port 2525

* Block Network Flood on Apache Port with IPtables: iptables -A INPUT -p tcp --dport 80 -m limit --limit 100/minute --limit-burst 200 -j ACCEPT

* Block Incoming Ping Requests on IPtables: iptables -A INPUT -p icmp -i eth0 -j DROP

* Allow loopback Access: 

    * iptables -A INPUT -i lo -j ACCEPT
    * iptables -A OUTPUT -o lo -j ACCEPT
    
* Block Access to Specific MAC Address on IPtables: iptables -A INPUT -m mac --mac-source 00:00:00:00:00:00 -j DROP

* Search within IPtables Rule: iptables -L $table_name -v -n | grep $string

    * ex: iptables -L INPUT -v -n | grep 192.168.0.100

* Define New IPTables Chain: iptables -N custom-filter

* Flush IPtables Firewall Chains or Rules: iptables -F

* You can flush chains from specific table with: iptables -t nat -F

* Save IPtables Rules to a File: iptables-save > ~/iptables.rules

* Restore IPtables Rules from a File: iptables-restore < ~/iptables.rules

* man iptables

* Disable Outgoing Mails through IPTables: iptables -A OUTPUT -p tcp --dports 25,465,587 -j REJECT

* Block Connection on Network Interface: iptables -A INPUT -i eth0 -s xxx.xxx.xxx.xxx -j DROP

