### Latency routing policy 

  - Use when you have resources in multiple AWS Regions and you want to route traffic to the region that provides the best latency.
  - Refer: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-latency
    
1. Create two ubuntu instances, one in Mumbai region & another one is in Ohio region.

    * Mumbai Instance:
        `#!/bin/bash`
        `sudo apt-get update -y && sudo apt-get install apache2 -y`
        `echo "<center><h1>Mumbai Region Server" > /var/www/html/index.html`
        `service apache start`

    * Ohio Instance:
        `#!/bin/bash`
        `sudo apt-get update -y && sudo apt-get install apache2 -y`
        `echo "<center><h1>Ohio Region Server" > /var/www/html/index.html`
        `service apache start`
        
2. Create two record sets with the same name for above two instances.

![image](https://user-images.githubusercontent.com/24622526/50133662-7f9de800-02b2-11e9-856c-00596de28c48.png)

![image](https://user-images.githubusercontent.com/24622526/50133692-9ba18980-02b2-11e9-86db-a21f6d34c07e.png)

3. Launch the URL in any browser in the machine which is connected to INIDIA region.

   http://geo.svnreddydevops.com/
   
   ![image](https://user-images.githubusercontent.com/24622526/50133702-afe58680-02b2-11e9-8810-7ff3c22feb02.png)

4. 3. Launch the URL in any browser in the machine which is connected to Ohio region(US location). (for this, create a windows machine in Ohio region and connect to the widnows and then launch the below url in the browser.

   http://geo.svnreddydevops.com/
   
   ![image](https://user-images.githubusercontent.com/24622526/50133731-c8ee3780-02b2-11e9-9bef-af7aa1fe9a68.png)



