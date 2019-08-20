
Refer: https://github.com/SonarSource/docker-sonarqube/blob/master/recipes.md

1. Create any folder. 

      ex: mkdir sonar

2. Change directory to new folder: 

      ex: cd sonar

3. Create a yml file and add the below script. If you are getting the error with below script, copy the same content from docker-compose.yml file which is attahced.

      vi docker-compose.yml

            version: "2"
            services:
              sonarqube:
                image: sonarqube
                ports:
                  - "9000:9000"
                networks:
                  - sonarnet
                environment:
                  - SONARQUBE_JDBC_URL=jdbc:postgresql://db:5432/sonar
                volumes:
                  - sonarqube_conf:/opt/sonarqube/conf
                  - sonarqube_data:/opt/sonarqube/data
                  - sonarqube_extensions:/opt/sonarqube/extensions
                  - sonarqube_bundled-plugins:/opt/sonarqube/lib/bundled-plugins
              db:
                image: postgres
                networks:
                  - sonarnet
                environment:
                  - POSTGRES_USER=sonar
                  - POSTGRES_PASSWORD=sonar
                volumes:
                  - postgresql:/var/lib/postgresql
                  # This needs explicit mapping due to https://github.com/docker-library/postgres/blob/4e48e3228a30763913ece952c611e5e9b95c8759/Dockerfile.template#L52
                  - postgresql_data:/var/lib/postgresql/data
            networks:
              sonarnet:
                driver: bridge
            volumes:
              sonarqube_conf:
              sonarqube_data:
              sonarqube_extensions:
              sonarqube_bundled-plugins:
              postgresql:
              postgresql_data:
            
4. Now, run the command, docker-compose up -d

   At the end of the execution, you will see the log as below.
   
            Status: Downloaded newer image for postgres:latest
            Creating sonar_sonarqube_1 ... done
            Creating sonar_db_1        ... done


5. Launch the URL: http://IP_Address:9000.

#### Check the postgresql database whether sonar really connected or not. Verifying whether the tables are created or not in postgresql db server.

6. Interact with postgresql container: (Run the command "dokcer ps" to find the postgresql container id)

      docker exec -it [container_id] bash
      
      6.1. login as postgres use: su - postgres
      
            ex: su - postgres
            
      6.2. get imto the postgre sql command line: psql
      
      6.3. List the databases: \list
      
            ex: \list
            
      6.4. connect to the database: \connect sonar
      
      6.5. List the tables: \dt
      
      6.6. Exit from the database: \q
     
      6.7. logout from the postgres user: exit
      
      Ctrl+p and then Ctrl+q (to exit from the container without stopping)

See the log below:

            root@e66d3de209f5:/# su - postgres
            No directory, logging in with HOME=/
            $
            $
            $ psql
            psql (10.4 (Debian 10.4-2.pgdg90+1))
            Type "help" for help.

            postgres=# \list
                                             List of databases
               Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
            -----------+----------+----------+------------+------------+-----------------------
             postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
             sonar     | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
             template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                       |          |          |            |            | postgres=CTc/postgres
             template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                       |          |          |            |            | postgres=CTc/postgres
            (4 rows)

            postgres=# \connect sonar
            You are now connected to database "sonar" as user "postgres".
            sonar=# \dt
             public | snapshots                | table | sonar
             public | user_roles               | table | sonar
             public | user_tokens              | table | sonar
             public | users                    | table | sonar
             public | webhook_deliveries       | table | sonar
             public | webhooks                 | table | sonar
            (56 rows)
            sonar=# \q
            could not save history to file "/home/postgres/.psql_history": No such file or directory
            $ exit
            root@e66d3de209f5:/#

![image](https://user-images.githubusercontent.com/24622526/43191467-c565e314-8fea-11e8-8ac9-f930505745a2.png)

