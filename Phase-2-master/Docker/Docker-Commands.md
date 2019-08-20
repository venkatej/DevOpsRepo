## Docker commands

    1. docker --help
    2. docker -v or docker --version or docker version
    3. docker images: To get the list of all the local images.
      docker rmi -f <image-name/id> : to remove the image.
    4. docker ps: To list the active containers.
      docker ps -a: To list both active & inactive containers.
      docker ps -a -s: To list both active & inactive containers along with the size of the container. -s gives you the container file size.
      docker stop <container-id>: shutdown the container.
      docker rm -f <container-id> Or docker rm -f <container-name/id>: First stop the docker container and then rm.
      docker container logs <container-id>
      docker container kill <container-id>
      docker container rm <container-id>
      docker container run <container-id>
      docker container start <container-id>

    5. docker run <image-name>: to run the image & it creates the container.
      docker run -it --name venkat ubuntu : we can give a name to the running container.
      docker ps: see the name in the list of active containers.
      Ex:
      1. docker run -it ubuntu: If the image not in local repo, docker will download/pull from the docker hub.
      2. Once the container available automatically we will enter into the container i.e., 'ubuntu' in this example.
      3. To exit from the container: exit
      4. To exit from the container: Ctrl - p - Q.
    6. docker info
    7. docker rm $(docker ps -a -f status=exited -q) : to remove all the container which are exited/not running.
       docker rm $(docker ps -aq) -f : Force to remove the docker running containers
    8. docker build -t <image-name> -f <docker file path>
      docker build --help
    9. docker run <image-name>
      docker run --help
    10. docker pull: to pull the docker images from docker hub.
    11. docker login: login creds to docker hub to push our own image from local to hub.
    11. docker push <dockerid>/<image-name>: push the local image to docker hub. Befre push, the local image need to be tagged with docker id. 
      docker tag <image-name> <dockerid>/<image-name>.
    12. docker stop <container-id>: shutdown the container.
    13. docker kill <container-id>: kills the execution of the contaner comopletely.
    14. docker exec: This command is used to access an running container and perform operations inside the container.
      docker exec -it <container-id> bash
      docker exec -it <container-id> sh
      docker exec -it <container-id> "/bin/bash"
    15. docker commit <container-id> <new-image-name> or docker commit <container-id> <docker-hub-id>/<new-image-name>: Create the new image from the modified running container.
    15. docker export: Save the container as tar file in local machine.
      docker export --output="MyDocker.tar" <container-id>
    16. docker import:
      docker import <path/imagetarfile>
    17. docker images -q: It returns only the docker image id.
    18. docker inspect <imaage_name/container>: see the details of an image or container.
    19. docker history <imaage_name>: see all the commands that were run with an image via a container.
    20. docker top ContainerID: you can see the top processes within a container.
    21. docker stats ContainerID: to provide the statistics of a running container.
    22. docker attach ContainerID: This command is used to attach to a running container. (to enter into the container)
    23. docker pause ContainerID: This command is used to pause the processes in a running container.
    24. docker unpause ContainerID: This command is used to unpause the processes in a running container.
    25. sudo service docker stop: Stop the dokcer service.
    26. sudo service docker start: Start the dokcer service.
    27. docker system events
    28. docker rename old-docker-container-name new-container-name
    29. docker logs:	
      docker logs container-id/container-name
      docker logs container-id/container-name -f
      docker logs [first 3 letters of container-id]
    30. docker cp or docker container cp: see the examples folder.
    31. docker diff container-id (run this command after docker cp)
    
    docker swarm: https://github.com/DevOpsPlatform/Phase-2/blob/master/Docker/DockerSwarm/swarm-mode.md
    
    32. docker swarm init --advertise-addr [manager-ip]
    33. docker node ls
    34. docker swarm join
    35. docker service create
    36. docker service ls
    37. docker service ps
    38. docker service scale
    39. docker service update
    40. docker service
    41. docker swarm join-token manager -q
    42. docker swarm join-token worker -q
    43. docker service --help
    44. docker service inspect --pretty [service-name]
    45. docker service inspect [service-name]
    46. docker service ps [service-name]
    47. docker service scale [service-name]=5
    48. docker service rm [service-name]
    49. docker swarm init --force-new-cluster

## docker compose:

    * dokcer-compose up -d
    * dokcer-compose down
    * dokcer-compose -f docker-compose.yml up -d
    * docker-compose -h
    * docker-compose version
    
## docker machine:

    * docker-machine --help

    * docker-machine create --help

    * docker-machine create --driver amazonec2 --help

    * docker-machine ls

    * docker-machine active

    * docker-machine ip machine-name

    * docker-machine stop machine-name

    * docker-machine start machine-name

    * docker-machine restart machine-name

    * docker-machine kill machine-name

    * docker-machine rm machine-name

    * docker-machine rm -f $(docker-machine ls -q)

    * docker-machine env machine-name

    * docker-machine config machine-name

    * docker-machine inspect machine-name

    * docker-machine status machine-name

    * docker-machine ssh machine-name

    * Uninstall docker-machine from our machine: rm $(which docker-machine)
