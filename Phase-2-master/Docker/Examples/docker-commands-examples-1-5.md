#### Example-1:

    docker run --detach --publish 80:80 --name webserver nginx

    docker exec -it webserver "/bin/bash"

        apt-get update -y

        apt-get install vim -y

        vi /usr/share/nginx/html/index.html

     docker exec -it webserver echo "hello devops"

     docker exec -it webserver mkdir "devops"

     docker exec -it webserver echo "hello devops"

     docker exec -it webserver touch "devops.txt"

     docker container ls

#### Example-2:

    docker create --publish 8081:80 --name apache-web httpd

    docker ps -a Or docker container ls --all
    
    docker start apache-web

    docker exec -it apache-web "/bin/bash"

        apt-get update -y

        apt-get install vim -y

        vi /usr/local/apache2/htdocs/index.html

     echo "<h1>Hello Friends... welcome to Docker..</h1>" > index.html

     ls

     docker cp index.html apache-web:/usr/local/apache2/htdocs/index.html
     
     docker cp apache-web:/usr/local/apache2/htdocs/index.html index.html
     
     mkdir src
     
     echo "<h1>sample file</h1>" > src/sample.html
     echo "<h1>sample-1 file</h1>" > src/sample-1.html
   
     docker cp src/. apache-web:/usr/local/apache2/htdocs/.
     
     http://54.152.120.63:8081/sample-1.html
     
     docker container stop webserver apache-web
     
     docker container rm webserver apache-web
  
#### Example-3: 

    mkdir -p /opt/jenkins
    
    sudo chown -R 1000:1000 /opt/jenkins
    
    docker run -d -p 8888:8080 --name jenkins-1 -v /opt/jenkins:/var/jenkins_home/ jenkins
    
    3.1. 
    
        Create the folder in docker host: /opt/jenkins/sample

        check the docker container whether the newly created folder is there in docker container or not. /var/jenkins_home/sample
        
    3.2.
    
        Create the folder in docker host:  /var/jenkins_home/sample-2

        check the docker container whether the newly created folder is there in docker container or not. /opt/jenkins/sample-2
        
#### Example-4:
    
        docker run -d -p 9999:8080 --name jenkins-2 --volumes-from  <id-of-above-container> jenkins
        
        docker run -d -p 8899:8080 --name jenkins-3 -v /opt/jenkins:/var/jenkins_home/ jenkins
        
#### Example-5:

        docker swarm init --advertise-addr [publicIP]
        
        docker node ls

        docker service create --name devops-jenkins -p 8889:8080 --mount type=bind,src=/opt/jenkins,dst=/var/jenkins_home,readonly=false --replicas 1 jenkins
        
        docker service ls
        
        docker service ps devops-jenkins
        
        ll /opt/jenkins
        
        docker ps --> its will give the runing containers list
        
        docker stop <container-id> or docker kill <container-id> 
        
        docker ps --> no contaner is running
        
        docker service ps devops-jenkins --> you will notice that, new replica has been created
        
        
        
    
    
    
    
    
    
