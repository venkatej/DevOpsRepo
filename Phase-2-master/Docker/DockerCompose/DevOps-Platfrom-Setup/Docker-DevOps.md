
* Launch an Ubuntu machine with instance type t2.medium or higher than this. (I tired on t2.xlarge)

![image](https://user-images.githubusercontent.com/24622526/44790921-f8f0be00-ab8f-11e8-8bc9-cde45a624240.png)


* Connect to the instance.

### Step-1: Install docker engine.

   [Dokcer-Installation-Ubuntu](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DockerEngine/2.1.Dokcer-Installation-Ubuntu.md)

### Step-2: Install docker-compose.

  [Dokcer-Compose-Installation-Ubuntu](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DockerCompose/Installation-and-example-1.md)

### Step-3: DevOps Setup using docker compose files:

##### 3.1. Install Git : apt-get install git

* Clone the repo: git clone https://github.com/DevOpsBasicSetup/Phase-2.git

##### 3.2. Run docker compose:

    change directory to Phase-2/Docker/DockerCompose/DevOps-Platfrom-Setup/

    cd Phase-2/Docker/DockerCompose/DevOps-Platfrom-Setup/

    docker-compose -f  docker-compose-apache.yml -f docker-compose-SeleniumGrid.yml -f docker-compose-jenkins-nexus.yml -f docker-compose-sonar.yml up -d
    
#### 3.3. update index.html with IP address

* update index.html file with IP address: vi index.html

![image](https://user-images.githubusercontent.com/24622526/44790406-ca261800-ab8e-11e8-8f9c-26a264531e07.png)


##### 3.4. Deploy web files:

* copy the web files to apache webserver container: 

      docker ps
      
      docker cp index.html a7d4c9895408:/usr/local/apache2/htdocs/
      docker cp jenkins.jpg a7d4c9895408:/usr/local/apache2/htdocs/
      docker cp nexus.jpg a7d4c9895408:/usr/local/apache2/htdocs/
      docker cp selenium.jpg a7d4c9895408:/usr/local/apache2/htdocs/
      docker cp sonar.jpg a7d4c9895408:/usr/local/apache2/htdocs/


* Apache web files default location: /usr/local/apache2/htdocs/index.html

![image](https://user-images.githubusercontent.com/24622526/47959672-e062b100-dfe1-11e8-8030-ab3f6d10326c.png)


* Launch the apache webserver URL in any browser: http://[publicIpAddress]:80 (or) http://[publicIpAddress]

![image](https://user-images.githubusercontent.com/24622526/47959651-531f5c80-dfe1-11e8-9f78-b03160131b06.png)

* Click on Jenkins/sonar/nexus/selenium to access the corresponding DevOps tool.

* Similarly, we can write yml files for different tools and run docker-compose to create containers.

Note: Nexus will take few minuits to up.
