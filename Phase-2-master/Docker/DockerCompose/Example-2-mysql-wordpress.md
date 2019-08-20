Reference: https://docs.docker.com/compose/wordpress/

1. Create any folder. 

      ex: mkdir my_wordpress

2. Change directory to new folder: 

      ex: cd my_wordpress
      
3. Create a yal file and add the below script. If you are getting the error with below script, copy the same content from docker-compose.yml file which is attahced.

      vi docker-compose.yml

        version: '3.3'
        services:
           db:
             image: mysql:5.7
             volumes:
               - db_data:/var/lib/mysql
             restart: always
             environment:
               MYSQL_ROOT_PASSWORD: somewordpress
               MYSQL_DATABASE: wordpress
               MYSQL_USER: wordpress
               MYSQL_PASSWORD: wordpress
           wordpress:
             depends_on:
               - db
             image: wordpress:latest
             ports:
               - "8000:80"
             restart: always
             environment:
               WORDPRESS_DB_HOST: db:3306
               WORDPRESS_DB_USER: wordpress
               WORDPRESS_DB_PASSWORD: wordpress
        volumes:
            db_data:
            
4. Now, run the command, docker-compose up -d

   At the end of the execution, you will see the log as below.
   
      Status: Downloaded newer image for wordpress:latest
      Creating my_wordpress_db_1
      Creating my_wordpress_wordpress_1

5. Launch the URL: http://IP_Address:8000 (dont do anything as of now).

#### Check the mysql database whether wordpress really connected or not. Verifying whether the tables are created or not in mysql db server.

6. Interact with mysql container: (Run the command "dokcer ps" to find the mysql container id)

      docker exec -it [container_id] bash
      
      6.1. Get into the mysql command line: mysql -u [wordpress] -p;
      
            ex: mysql -u wordpress -p;
            
      6.2. List the databases: show databases;
      
      6.3. Connect to database: use [dbname];
      
            ex: use wordpress;
            
      6.4. List the tables: show tables;
      
      as of now, you will not see the tables.
      
      Ctrl+p and then Ctrl+q (to exit from the container without stopping)

7. Interact with wordpress container: (Run the command "dokcer ps" to find the mysql container id)

      docker exec -it [container_id] bash
      
      7.1. find / -name "wp-config.php"
      
            Here you can find the DB Config details: /var/www/html/wp-config.php

      7.2. run the command & check the file whether the mysql details configured or not: cat /var/www/html/wp-config.php
      
      Ctrl+p and then Ctrl+q (to exit from the container without stopping)
      
8. Launch the URL: http://IP_Address:8000 and then register with username & pwd.

9. Now, check the mysql database whether the tables are created or not. For that, connect to the mysql container as per the step-6.

      
