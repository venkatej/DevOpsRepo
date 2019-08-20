Docker Compose is used to run multiple containers as a single service.


    curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    
    docker-compose version
    
Creating docker-compose: docker-compose.yml

    version: '3'
    services:
      databases:
        image: mysql
        ports:
        - "3306:3306"
        environment:
        - MYSQL_ROOT_PASSWORD=passowrd
        - MYSQL_USER=user
        - MYSQL_PASSWORD=password
        - MYSQL_DATABASE=demodb
      web:
        image: nginx
        ports: 
        - 8082:80
            
    Launch the URL: http://publicIP:8082/

    Interatct with container: docker exec -it a726ec0223a7 bash

    Get into my sql command line: mysql -u [user-name] -p;

            ex: mysql -u user -p;
            
    See the list of databses: show databases;
    
    See the mysql commands: https://gist.github.com/hofmannsven/9164408
    



            
https://docs.docker.com/compose/samples-for-compose/#samples-tailored-to-demo-compose

https://docs.docker.com/compose/reference/

https://docs.docker.com/compose/wordpress/#shutdown-and-cleanup

https://docs.docker.com/glossary/?term=orchestration

https://docs.docker.com/ee/end-to-end-install/

      
