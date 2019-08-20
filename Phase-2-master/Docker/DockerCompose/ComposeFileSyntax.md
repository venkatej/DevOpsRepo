
Refer: 
https://docs.docker.com/compose/compose-file/
https://www.linode.com/docs/applications/containers/how-to-use-docker-compose/

A docker-compose.yml file is organized into four sections:


| Directive | Use |
| --- | --- |
| version | Specifies the Compose file syntax version. This guide will use Version 3 throughout. |
| services | In Docker a service is the name for a “Container in production”. This section defines the containers that will be started as a part of the Docker Compose instance. |
| networks | This section is used to configure networking for your application. You can change the settings of the default network, connect to an external network, or define app-specific networks. |
| volumes | Mounts a linked path on the host machine that can be used by the container. |

directives used to set up and configure containers/services:

| Directive | Use |
| --- | --- |
| image | Sets the image that will be used to build the container. Using this directive assumes that the specified image already exists either on the host or on Docker Hub. |
| build | This directive can be used instead of image. Specifies the location of the Dockerfile that will be used to build this container. |
| db | In the case of the example Dockercompose file, db is a variable for the container you are about to define. |
| restart | Tells the container to restart if the system restarts. |
| volumes | Mounts a linked path on the host machine that can be used by the container |
| environment | Define environment variables to be passed in to the Docker run command. |
| depends_on | Sets a service as a dependency for the current block-defined container |
| port | Maps a port from the container to the host in the following manner: host:container |
| links | Link this service to any other services in the Docker Compose file by specifying their names here. |
| container_name | Give the name to your container |

#### Example-1: run the image "nginx"

Usually if we want to run an image, we will run the command: docker run -d -p 8888:80 nginx

How to compose yml file as to run nginx container.

Create an yml file docker-compose.yml and add the below content.

    version: '3'

    services:
      webserver:
        image: nginx:latest
        ports:
          - "8888:80"

Run yml using docker compose: dokcer-compose up -d

Launch the URL http://publicIp:8888

#### Example-2: Run two images using docker compose. Here, adding jenkins image details to the existing yml file. Update dokcer-compose.yml file with below snippet.

Note: If you want to give the name to your container, you can add the durective 'container_name'

    version: '3'
    services:
      webserver:
        image: nginx:latest
        container_name: nginx_web
        ports:
          - "8888:80"
      cicd:
        image: jenkins:latest
        container_name: jenkins_ci
        ports:
          - "8080:8080"

Run yml using docker compose: dokcer-compose up -d

docker ps: You will see the result as below.

![image](https://user-images.githubusercontent.com/24622526/43244727-52351746-909b-11e8-9ec9-70d8fa6b5fcc.png)

Launch URL: http://publicIp:8888 & http://publicIp:8080

#### Example-3: Run three images using docker compose. Here, adding apache image details to the existing yml file. Update dokcer-compose.yml file with below snippet.

    version: '3'
    services:
      webserver-1:
        image: nginx:latest
        container_name: nginx_web
        ports:
          - "8081:80"
      webserver-2:
        image: httpd:latest
        container_name: apache2_web
        ports:
          - "8082:80"
      cicd:
        image: jenkins:latest
        container_name: jenkins_ci
        ports:
          - "8083:8080"

![image](https://user-images.githubusercontent.com/24622526/43245344-80bde41a-909d-11e8-9f33-70f4728bc266.png)

docker-compose up -d

docker ps

![image](https://user-images.githubusercontent.com/24622526/43245592-66d2865e-909e-11e8-8e37-27416ea72749.png)



Launch: http://ipAddress:8081

![image](https://user-images.githubusercontent.com/24622526/43245383-a1148b38-909d-11e8-9cc2-13c47c12cddf.png)

Launch: http://ipAddress:8082



![image](https://user-images.githubusercontent.com/24622526/43245404-b10af6da-909d-11e8-8e22-721ce3fe24f3.png)

Launch: http://ipAddress:8083

![image](https://user-images.githubusercontent.com/24622526/43245428-c542ffbc-909d-11e8-92ea-e8aca5beb9c7.png)


YML script syntax:

version: '3.7'
services:
  [serviceName1]:
     image: [image-name:tag]
     container_name: nginx_web
     ports:
       - "[portNumber]:[actualPortNumber]"
  [serviceName2]:
     image: [image-name:tag]
     container_name: nginx_web
     ports:
       - "[portNumber]:[actualPortNumber]"
