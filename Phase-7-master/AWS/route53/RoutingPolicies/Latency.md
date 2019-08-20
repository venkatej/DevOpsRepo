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

![image](https://user-images.githubusercontent.com/24622526/50133355-3ef19f00-02b1-11e9-9213-bb1fb0641dc7.png)

![image](https://user-images.githubusercontent.com/24622526/50133386-60528b00-02b1-11e9-8b6b-fc06cde656ac.png)

3. Launch the URL in any browser in the machine which is connected to INIDIA region.

   http://apache.svnreddydevops.com/
   
   ![image](https://user-images.githubusercontent.com/24622526/50133446-9a239180-02b1-11e9-8907-415f5d5cf00f.png)

4. Launch the URL in any browser in the machine which is connected to Ohio region. (for this practice, create a windows machine in Ohio region and connect to the widnows and then launch the below url in the browser.)

   http://apache.svnreddydevops.com/
   
   ![image](https://user-images.githubusercontent.com/24622526/50133503-dc4cd300-02b1-11e9-8fb6-e6b87f8ec58f.png)


