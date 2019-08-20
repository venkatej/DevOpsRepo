### Step-1: Install docker engine.

   [Dokcer-Installation-Ubuntu](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DockerEngine/2.1.Dokcer-Installation-Ubuntu.md)

### Step-2: Install docker-machine.

  [Dokcer-Machine-Installation-Ubuntu](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DokcerMachine/Installation-and-example.md)

##### 2.1. Create 3 docker hosts using docker-machine.
  
      docker-machine create --driver amazonec2 --amazonec2-access-key AKI********** --amazonec2-secret-key UeI4G**********ots7z9Xo --amazonec2-region us-east-2 --amazonec2-zone "a" docker-m

      docker-machine create --driver amazonec2 --amazonec2-access-key AKI********** --amazonec2-secret-key UeI4G**********ots7z9Xo --amazonec2-region us-east-2 --amazonec2-zone "b" docker-w-1

      docker-machine create --driver amazonec2 --amazonec2-access-key AKI********** --amazonec2-secret-key UeI4G**********ots7z9Xo --amazonec2-region us-east-2 --amazonec2-zone "c" docker-w-2

    * docker-machine ls

### Step-3: Swarm mode:

    docker-machine ls
    
    docker-machine ip docker-m

    docker-machine ssh docker-m

    sudo -i

    docker swarm init --advertise-addr 18.218.203.69

    docker node ls

    exit
    exit

    docker-machine ssh docker-w-1

    sudo -i

    docker swarm join --token SWMTKN-1-0c62o5bu8cuhgtwnw5ja5ohiju3vsec7h4lwdldc0toxmqr3a2-2ktuqceisbznx1c1mmvbmanzh 18.218.203.69:2377


    docker-machine ssh docker-w-1

    sudo -i

    docker swarm join --token SWMTKN-1-0c62o5bu8cuhgtwnw5ja5ohiju3vsec7h4lwdldc0toxmqr3a2-2ktuqceisbznx1c1mmvbmanzh 18.218.203.69:2377

    exit
    exit

    docker-machine ssh docker-m

    sudo -i

    docker node ls

### Step-4: Services:

##### 4.1. Create Services:

    docker service create --name devops-web -p 8888:8080 --replicas 2 venkatasykam/devopswebapp:1.0.14

    docker service ls

    docker service ps devops-web

    launch http://<PublicIP>:8888

##### 4.2. Scale the service:

    docker service scale devops-web=5

    launch http://<PublicIP>:8888
    
##### 4.3. Update the service:

    docker service update --image venkatasykam/devopswebapp:1.0.15 devops-web

##### 4.4. Update the service:

    docker service rollback devops-web

    docker service ls --> here you can see the image version/tag.

##### 4.5. Other commands:

    docker service --help

    docker service ls

    docker service ps devops-web

    docker service inspect --pretty devops-web

    docker service inspect devops-web

    docker service ps devops-web

    docker service scale devops-web=5

    docker service ps devops-web

    docker service rm devops-web

    docker service inspect devops-web --> it should return Status: Error: no such service: devops-web, Code: 1


#### More than one manager

      docker swarm join-token manager -q
      docker swarm join-token worker -q

Note: If the manager down, docker swarm init --force-new-cluster
