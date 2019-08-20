
https://docs.docker.com/engine/reference/commandline/stack/

https://docs.docker.com/get-started/part5/

https://vsupalov.com/difference-docker-compose-and-docker-stack/


Deploy/install the software into server.

without SWARM:  "docker run" vs "docker-compose" - 1 container per 1 image
--------------
1. "docker run" command to run our application i.e., docker image

	docker engine - we can run one image at a time. finally, one container will be created
	
2. "docker-compose" - yml file, we can configure more than one image details into yml file.

	docker engine
	docker-compose

with SWARM:  "docker service" vs "docker stack"  - more than 1 container per 1 image
-----------
3. docker swarm - we can deploy our apps(only one at a time) using "docker service"

	docker engine
	docker swarm
	docker-machine(optional)
	
4. docker stack - deploy more than one app at a time using docker-compose

	docker engine
	docker swarm
	docker-machine(optional)
	docker-compose
	
	
