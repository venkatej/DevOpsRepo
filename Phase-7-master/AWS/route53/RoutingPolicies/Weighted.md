# Weighted

1. Create two EC2 ubuntu instances.

2. Install apache on both the instances.

    * Primary-Instance: 
      `apt-get update -y && apt-get install apache2 -y`
      `echo "<center><h1><font color=blue>Server-1" > /var/www/html/index.html`
      `curl localhost`
    * Secondary-Instance: 
      `apt-get update -y && apt-get install apache2 -y`
      `echo "<center><h1><font color=red>Server-2" > /var/www/html/index.html`
      `curl localhost`
      

2. Go to route53 --> Hosted Zoned --> Create record set

  ![image](https://user-images.githubusercontent.com/24622526/50081091-9c371300-0213-11e9-9bc2-d0802c0c9098.png)

3. Create another record set for second server with the same name as created above.

![image](https://user-images.githubusercontent.com/24622526/50081156-c7216700-0213-11e9-897d-3397d436d16a.png)

4. Launch the URL: http://apache.svnreddydevops.com/

Note: The same approach applicable to ELB. Ex: You can configure your Servers/ELB in one region as primary and ther other region as secondary.

