1. Create two EC2 instances.

2. Install Apache2 or Nginx on both the instances.

   apt-get update -y && apt-get install apache2 -y or apt-get install nginx -y

3. Go to Load Balancers --> Create Load Balancer --> Choose 'Classic Load Balancer' --> Load Balancer name --> 
  
   Assign Secuity Group(make sure port 80 should be open) --> Configure Security Settings(default) --> Configure Health check(default) --> 

   Add EC2 Instances --> add both instances now (or you ca nadd them later) --> Add Tags "Name: Apache-LB" --> Review --> Create.
   
4. Go to Route53 --> Hosted Zones --> Create Record Set --> 

    Name : give any name
    
    Alias --> yes
    
    Alias Target --> choose loadbalancer which we created in Step-3.
    
    Save.
    
5. Launch the URL(record set name) in any browser in any machine.
    
    
