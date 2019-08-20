### Step-1: Install docker engine.

   [Dokcer-Installation-Ubuntu](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DockerEngine/2.1.Dokcer-Installation-Ubuntu.md)

### Step-2: Install docker-compose.

  [Dokcer-compose-Installation-Ubuntu](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DockerCompose/Installation-and-example-1.md)

### Step-3: Install docker-machine.

  [Dokcer-Machine-Installation-Ubuntu](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DokcerMachine/Installation-and-example.md)

##### 3.1. Create 2 docker hosts using docker-machine.
  
      docker-machine create --driver amazonec2 --amazonec2-access-key AKI********** --amazonec2-secret-key UeI4G**********ots7z9Xo --amazonec2-region us-east-2 --amazonec2-zone "b" docker-w-1

      docker-machine create --driver amazonec2 --amazonec2-access-key AKI********** --amazonec2-secret-key UeI4G**********ots7z9Xo --amazonec2-region us-east-2 --amazonec2-zone "c" docker-w-2

    * docker-machine ls

### Step-4: Swarm mode:


    docker swarm init --advertise-addr 18.218.203.69  # IP address of the machine where we are going to initiate swam.

    docker node ls

    docker-machine ssh docker-w-1

    sudo -i

    docker swarm join --token SWMTKN-1-0c62o5bu8cuhgtwnw5ja5ohiju3vsec7h4lwdldc0toxmqr3a2-2ktuqceisbznx1c1mmvbmanzh 18.218.203.69:2377

    exit
    exit

    docker-machine ssh docker-w-2

    sudo -i

    docker swarm join --token SWMTKN-1-0c62o5bu8cuhgtwnw5ja5ohiju3vsec7h4lwdldc0toxmqr3a2-2ktuqceisbznx1c1mmvbmanzh 18.218.203.69:2377

    exit
    exit


    docker node ls
    
    Now the current machine is acting as a leader.
    

### Step-5: docker stack:

* 5.1. Create a docker-compose file & copy the content from [docker-compose.yml](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DockerStacks/docker-compose.yml)

* 5.2. docker stack deploy -c docker-compose.yml devops

* docker service ls  # Wait for some time to create replicas for services before you access the application from browser. See the below image, once stack deployed, its preparing to create replicas for our services.

* docker service ps devops_cicd

* docker service ps devops_devopsweb

* docker stack rm devops

![image](https://user-images.githubusercontent.com/24622526/44851535-2604a580-ac50-11e8-91fc-6918c3871d32.png)

