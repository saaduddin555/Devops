                                                                      Docker commands    
#############Basic Docker commands
yum install docker -y                                  To install docker
service docker status                                  To know docker status
service docker start                                   To start a docker service
docker images                                          To know how many images are there in system
docker ps                                              how many docker containers are running
docker ps -a                                           how many docker containers you are having-all
docker --help                                          to get more info and commands related to docker
docker pull tomcat                                     To Pull docker image from docker hub

systemctl status docker           	                    (Get status of docker)
docker info                                 	        (Info about docker)
docker pull nginx 		                                to pull an nginx image from docker hub
docker images                                       	(only images list)
docker ps                    	                        (to see only running containers
docker stop                      		                (to stop a container
docker ps -a                     	                    (to see all containers either stopped or running


##########Attach  and detach command
docker run --name attached -p 8080:80 nginx
will atttach to terminal and there is no access to terminal
docker run -d --name detach -p 8081:80 nginx
the -d helps not be attached with the terminal and will have access for it and gets uuid


#########Child commands
Command	Description
docker attach	                Attach local standard input, output, and error streams to a running container
docker build	                Build an image from a Dockerfile
docker builder              	Manage builds
docker checkpoint	            Manage checkpoints
docker commit	                Create a new image from a container’s changes
docker config	                Manage Docker configs
docker container            	Manage containers
docker context	                Manage contexts
docker cp	                    Copy files/folders between a container and the local filesystem
docker create	                Create a new container
docker diff	                    Inspect changes to files or directories on a container’s filesystem
docker events	                Get real time events from the server
docker exec	                    Run a command in a running container
docker export	                Export a container’s filesystem as a tar archive
docker history	                Show the history of an image
docker image	                Manage images
docker images	                List images
docker import	                Import the contents from a tarball to create a filesystem image
docker info	                    Display system-wide information
docker inspect	                Return low-level information on Docker objects
docker kill	                    Kill one or more running containers
docker load	                    Load an image from a tar archive or STDIN
docker login	                Log in to a Docker registry
docker logout	                Log out from a Docker registry
docker logs	                    Fetch the logs of a container
docker manifest	                Manage Docker image manifests and manifest lists
docker network	                Manage networks
docker node	                    Manage Swarm nodes
docker pause	                Pause all processes within one or more containers
docker plugin	                Manage plugins
docker port	                    List port mappings or a specific mapping for the container
docker ps	                    List containers
docker pull	                    Pull an image or a repository from a registry
docker push	                    Push an image or a repository to a registry
docker rename	                Rename a container
docker restart	                Restart one or more containers
docker rm	                    Remove one or more containers
docker rmi	                    Remove one or more images
docker run	                    Run a command in a new container
docker save	                    Save one or more images to a tar archive (streamed to STDOUT by default)
docker search	                Search the Docker Hub for images
docker secret	                Manage Docker secrets
docker service	                Manage services
docker stack	                Manage Docker stacks
docker start	                Start one or more stopped containers
docker stats	                Display a live stream of container(s) resource usage statistics
docker stop	                    Stop one or more running containers
docker swarm	                Manage Swarm
docker system	                Manage Docker
docker tag	                    Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
docker top                  	Display the running processes of a container
docker trust	                Manage trust on Docker images
docker unpause	                Unpause all processes within one or more containers
docker update	                Update configuration of one or more containers
docker version	                Show the Docker version information
docker volume	                Manage volumes
docker wait	                    Block until one or more containers stop, then print their exit codes

################To Create a New Containers from docker images:
docker run makes images to convert as containers or create new container.
docker run -d_image id                                      To convert into container
docker run -d --name tomcat-container -p 8081:8080  tomcat:latest
(-d refers detached mode, --name to mention what to name for container, -p refers to give port number. external:internal, image name:tag as tomcat:latest or can give image id
docker run -dt -p 80:80 image-id or image name
if we dont specify name for a container docker will create its own random name for container
hence
docker run --name mynginx -d -p 8000:80 nginx

################TO get Inside of Container:
docker exec -it tomcat-container  /bin/bash                                              Login to docker container or get inside.
docker exec -it container1 /bin/bash                                                      (to get inside of running container)


#######TO start or stop a Container
docker stop tomcat-container                                 To stop a container
docker start_container name                                  To start a container
chk config to start the docker server in boot time or start server manually by using (start docker.service) command
docker stop container-name or UUID         (To specifically stop a particular container by name or UUID
docker container stop conatiner-name
docker container stop $(docker container ls -aq)        its passing the list to stop command
docker container rm containername                       To remove a particular container


##########To Delete or remove the Containers
docker container ls                                    (to get list of container)
docker container prune                                 (to delete all stopped containers)
docker image prune -a                                  (to delete all images)
docker run -itd_Image id                               (it creates the container as well runs it)
docker ps -aq                                          (only gets containers ID)
docker run -it_image name                              (created a container and inside of container)
docker rm container id                                 (to remove container or delete)
docker rm (container id) -f                            (to remove container forcefully with out stopping)
docker rmi (image id)                                  (to remove unused images in container)
docker container ls -aq                        		    To get list of all container name
docker container rm $(docker conatiner ls -aq) 	        its passing the list to remove command



#####To create docker images and push to docker hub:
docker image ls                                          to get list of images
Create a repository in docker hub website first, if u want to push an image to docker hub
docker login                                                           To login in docker hub in linux server enter username and password
docker commit_container id_repository name/image-new-name:tag          (convert from container to image)
docker push_repository name/image-name:tag    (to push docker images to hub give account name)



####### Volumes---Create or link Volumes with in container to container:
docker volume ls                                                   (to list out all volumes with name, ID)
docker volume create newvolume
dokcer volume rm newvolume
docker volume prune                                     (to unmount all unmount volumes but not to use the command often)
docker inspect volumename                               (to get volume details and creation of volume info)
docker ps                                               (get container info)
docker container inspect container name                 (to get all container related info)

docker run -it --name containername --privileged=true --volumes-from container1 ubuntu /bin/bash
(it means to run=to create -it=interactive mode --name=name of the conatiner --privileged=true means that volume to link --volumes-from= means to link volume from what container,give container-name and ubuntu=name of os /bin/bash=root folder)

docker run -it --name containername -v /volumename ubuntu /bin/bash      (TO create a volume with container, a volume can be created only while creating a container)



########Link volumes from Host machine to ec2 container volume host to container:
mkdir shared  (create folder in ec2 instance)
get inside of shared folder
docker run -it --name hostcont -v /home/shared:/foldername --privileged=true ubuntu /bin/bash
/home/shared:/foldername, it is a path of ec2 server:/container link folder name to visible inside of container



######Docker Networking commands:
apt install net-tools
if config
apt-get install iputils-ping                                                         (to support ping environment)
docker network ls                                                                    to list all types of network
docker ps                                                                            details about containers like image,port,name of container
docker inspect container-id                                                          get info and config about containers
docker run -i -t --name containername --network bridge nginx:latest                 (create container with bridge network)
docker run -dt --name containername --network host nginx:latest                     (create container with host network)
docker run -d -t --name containername --network none nginx:latest                   (create container with null network)
docker inspect containername                                                        (to get details such as ip adresss and other network related of a container)
curl -I ipaddress:port-no                                                           (to check weather that particular ip is working or not




#####Port Mapping:
docker run -p  8080:8080 -it --rm image name                                              Port mapping the address
docker run -p  8080:8080 --rm image name
docker run  -d -t --name “myubuntu” ubuntu /bin/bash
docker run -p 8080:8080 -it --rm hello-world-java                                       (To run a container with port mapping)
docker run -p(port) 8080(host port):8080(container port) -it(interactive port) –rm(when docker container stops to kill the port) hello-world-java(image name)

docker run -p 8080:8080 -it --name mynewcontainer imagename
(copy and paste the public ip of ec2 with port-number and port is open to world using port mapping)
Note: port-mapping is used when a container is connected with host network method. for bridge network it created its own ip and port numbers.

Note:
By default docker containers can make connections to the outside worild, but the outside world cannot conect to container
if we want to conatiner to connect to outside world, we need to bind host port with container port to access the incoming connections
docker host........>>will send a request to docker container to connect incomming connection
Port mapping is required to connect a container for outside world using custom port.
docker inspect container-id or name
docker run -d -p 8000:80 --name mynginx nginx
netstat -ntlp              (Networkconnections and ipadress)

#####Manual network creation:
docker network create my-own-network
docker run -it --name containername --network my-own-network ubuntu:latest
(my-own-network= is the name of Manual network)
docker network create (network name)
docker run -it –name (container name) –network(network name) (image name)



#######Docker File               
FROM: for a base image the command must be on top of the docker
RUN: To execute Command, it will create a layer in the image.
MAINTAINER: Author/owner/description
COPY: Copy files from the local system (docker VM) we need to provide a source, destination(We cant download file from the internet and any remote directory)
ADD: Similar to copy but, it provides a feature to download files from the internet, also we extract files at the docker image side.
EXPOSE: To Expose ports such as port 8080 for tomcat, port 80 for Nginx, etc.
WORKDIR: To set a working directory for a container.
CMD: Execute commands but during container creation
ENTRYPOINT: Similar to CMD, but has higher priority over CMD, first commands will be executed by ENTRYPOINT only.
ENV: Environment Variables
VOLUME:TO CREATE DOCKER VOLUME EG: VOLUME ["/MYVOLUME"]  VOLUMES CAN BE CREATE BEFORE CREATING A CONTAINER

docker build -t mytomcat .     
To build image from docker file and -t refers to give a tag or name of the image then followed by .(dot refers that docker file is in current location or if not specify path of docker file)


########Docker compose
apt install docker-compose                          (It installs Docker compose in the instance)
docker-compose -v                                   (TO check version of compose)
See that docker compose YAML file version declared is same as docker compose installed in system
Docker compose creates a customized network by default, all containers will be same network
if we want to create multiple containers in  same config and keep all containers in a single network we can use docker compose. to create multiple containers using a compose.YAML file
docker-compose up                                   (TO run a compose file in docker)


########Docker swarm
########Docker Secrets and Config
########Docker reservation and limits


