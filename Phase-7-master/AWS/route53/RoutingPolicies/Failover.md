#Failover

1. Create two EC2 ubuntu instances.

2. Install apache on both the instances.

    * Primary-Instance: 
      `apt-get update -y && apt-get install apache2 -y`
      `echo "<center><h1><font color=green>Server-1" > /var/www/html/index.html`
      `curl localhost`
    * Secondary-Instance: 
      `apt-get update -y && apt-get install apache2 -y`
      `echo "<center><h1><font color=red>Server-1 Fails" > /var/www/html/index.html`
      `curl localhost`
      

2. Go to route53 --> Create Healthcheck for primary server/instance.

![image](https://user-images.githubusercontent.com/24622526/50078735-c1c11e00-020d-11e9-8bee-75e67c3c36fa.png)

3. Create Record set for primary serer as primary serer to load the web app

![image](https://user-images.githubusercontent.com/24622526/50078905-29776900-020e-11e9-8a69-578d1094ba1a.png)

4. Create Record set(with the same name as creaed for primary) for second serer as secondary server to load the web app when primary server goes offline.

![image](https://user-images.githubusercontent.com/24622526/50079019-8115d480-020e-11e9-8156-80f62b7b1c86.png)

5. Create another record set to refer common name.

![image](https://user-images.githubusercontent.com/24622526/50079122-bf12f880-020e-11e9-9053-10b4b6867e32.png)

6. Launch the DNS: http://finalapache.svnreddydevops.com/ any browser, any machine, anywhere.

7. If primary server down, automatically, it routes to secondary server.

Note: The same approach applicable to S3 bucket, ELB. Ex: You can configure your Servers/ELB/S3 in one region as primary and ther other region as secondary.
