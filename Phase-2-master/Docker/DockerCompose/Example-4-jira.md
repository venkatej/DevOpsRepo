
Refer: https://github.com/blacklabelops/jira/blob/master/docker-compose.yml

1. Create any folder. 

      ex: mkdir jira

2. Change directory to new folder: 

      ex: cd jira

3. Create a yml file and add the below script. If you are getting the error with below script, copy the same content from docker-compose.yml file which is attahced.

      vi docker-compose.yml

            version: '3'
            services:
              jira:
                depends_on:
                  - postgresql
                image: blacklabelops/jira
                networks:
                  - jiranet
                volumes:
                  - jiradata:/var/atlassian/jira
                ports:
                  - '8888:8080'
                environment:
                  - 'JIRA_DATABASE_URL=postgresql://jira@postgresql/jiradb'
                  - 'JIRA_DB_PASSWORD=jellyfish'
                  - 'SETENV_JVM_MINIMUM_MEMORY=256m'
                  - 'SETENV_JVM_MAXIMUM_MEMORY=1g'
                  - 'JIRA_PROXY_NAME='
                  - 'JIRA_PROXY_PORT='
                  - 'JIRA_PROXY_SCHEME='
                logging:
                  # limit logs retained on host to 25MB
                  driver: "json-file"
                  options:
                    max-size: "500k"
                    max-file: "50"
                labels:
                  com.blacklabelops.description: "Atlassian Jira"
                  com.blacklabelops.service: "jira"
              postgresql:
                image: blacklabelops/postgres
                networks:
                  - jiranet
                volumes:
                  - postgresqldata:/var/lib/postgresql/data
                environment:
                  - 'POSTGRES_USER=jira'
                  # CHANGE THE PASSWORD!
                  - 'POSTGRES_PASSWORD=jellyfish'
                  - 'POSTGRES_DB=jiradb'
                  - 'POSTGRES_ENCODING=UNICODE'
                  - 'POSTGRES_COLLATE=C'
                  - 'POSTGRES_COLLATE_TYPE=C'
                logging:
                  # limit logs retained on host to 25MB
                  driver: "json-file"
                  options:
                    max-size: "500k"
                    max-file: "50"
                labels:
                  com.blacklabelops.description: "PostgreSQL Database Server"
                  com.blacklabelops.service: "postgresql"
            volumes:
              jiradata:
                external: false
              postgresqldata:
                external: false
            networks:
              jiranet:
                driver: bridge

            
4. Now, run the command, docker-compose up -d

   At the end of the execution, you will see the log as below.
   
            Status: Downloaded newer image for postgres:latest
            jira_postgresql_1 ... done
            jira_jira_1 ... done



5. Launch the URL: http://IP_Address:8888.

#### Check the postgresql database whether jira really connected or not. Verifying whether the tables are created or not in postgresql db server.

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

