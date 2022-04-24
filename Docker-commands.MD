                                                                      Docker commands    
#############Basic Docker commands
yum install docker -y                                  To install docker
apt-get install docker.io -y                           To insatll docker
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



#####To create docker images and push to docker hub or conver from conatainer to image:
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

Creating one or more containers using sinhgle Dockerfile is called multi stack docker file





########Docker compose
apt install docker-compose                          (It installs Docker compose in the instance)
docker-compose -v                                   (TO check version of compose)
-See that docker version installed in system is same as version declared in compose.Yaml file
-Docker compose helps to create containers in single click
-Docker compose creates a customized network by default, all containers will be same network
-if we want to create multiple containers in  same config and keep all containers in a single network we can use docker compose. to create multiple containers using a compose.YAML file
docker-compose up                                   (TO run a compose file in docker)
-we cannot communicate by using docker compose with other server containers as we can communicate only with in server level containers








########Docker swarm
-Docker swarm can solve the draw backs of docker compose as in follow below:
-Docker swarm helps to communicate from one server level containers to another servers, May be any container of another server we can establish connection in between the both.
-Docker swarm is as orchestration tool same as Kubernetes
-Docker swarm has Leader and worker concept same as jenkins master and slave concept

docker swarm install                                     (Install docker swarm in leader server)
\ TOKEN WILL GET GENERATED\ COPY THE COMMAND AND PASTE IT TO SLAVE SERVERS. The group of Servers are called as clusture

docker node ls                        (To get list of servers)

Docker swarm visualizer                       ( Run this command only in master node), It will create a visualizer container to see all master and slave in UI)
docker run -it id -p 5000:8000 -v /var/run/docker.sock:/var/run/docker.sock dockersamples/visualizer

To run with a different context root(useful when running behind an external load balance)
docker run -it -d -e CTX_ROOT-/visualizer -v /var/run/docker.sock:/var/run/docker.sock dockersamples/visualizer

docker swarm leave

docker swarm join --token worker                   (TO see token id of master so that to configure the slave)

docker service create --name mycontainer --publish 8000:80 --replicas 10 nginx:latest
(This command creates containers with name=mycontainer and replicas or count of 10 container --publish or -p means port mapping of 8000:80 (external:docker container port) with nginx image)

docker service ps name of service  (to see all service containers give name of service as created earlier as above the service name is my container, it list all the 10 containers) This service command only runs in master node.

-The containers get deployed as much as nodes are present in the swarm equally balanced Eg:5 nodes are present 1 is master and 4 are slave, in all 5 containers every node is distributed with 2 cointainer in each as 5, total as 10 containers, Equal distribution happens.

docker ps -a (To check containers only on a particular node either master or slave)

docker network ls
-The default networks are Bridge, host, null or none networks
but 
In docker swarm the networks which are added additionally for external communication are docker gw_bridge and ingress_overlay or swarm network are present.
Ingress network helps to communicate external nodes and are connected each other

docker inspect ingress               (get list of ingress connected nodes)

docker service update my container --replicas 2
(to update list of containers as 2 containers either increase or decrease list of containers in nodes with equal distribution) out of which is earlier

docker inspect service_name
TO get details about containers

The ingress network generates a virtual IP in all nodes and container connected each other either u hit any address of any node of container, it will show u result of web application either that container has web app or not or not having container or not but treated equally as Whole One, as public Ip of other node is hit still shows results.

docker exec -it conatiner_id /bin/bash
apt insatll iputils-ping                      (To install Ping)

docker service rm service_name                (To remove the services )

watch docker node ls                          (To watch the live containers update)




########-docker swarm Rolling update
to update the container from one version to another like to update from older version to newer version in containers

For example 
There are 3 containers with redis image version 3.06 as below created
docker service create --replicas 3 --name redis --update-delay 10s redis:3.0.6
update-delay=5min means delay of creating a new container of each

There is new update in application version, but people are accessing outside of world old version but systems should be updated to new
as a ecommerce website there should not be outage of app hence we use rolling update

To update the image version to other, we use command
docker service update --image redis:3.0.7 redis redis

The given update-delay command while creating a container helps to delay the container update time and create updated containers one by one to prevent outage and kill and create in given update time.

updates help to fix the bugs and reduce quality issues

docker service update --update-parllelism 2 --update-delay 10s redis:3.0.7 
To create containers parllelly

This helps the containers not to stop but update online

#############-docker Rollback updates
When ever there is any issues with updates we genrally roll back to previous versions 
docker service rollback redis:3.0.6
The service is rollback done to previous versions

To delay rollback update with parllelism
docker service --rollback-parllelism --rollback-delay 5min redis





############Global services in docker or deamonsets in kubernetes
In real time it helps to create monitoring servers and logs 
when ever we create a service in docker by default an extra container has to be created by default in each node which helps to record logs and monitor.
without running a command a global service container is created in each node.

docker service  create --name nginx --mode global --publish 8000:80 nginx:latest
here we have not given any replicas to create a service for example --replicas 4 containers, but here we have 4 nodes and every node has a container created by default as declared as global container to run in each node as default for each linked master node.

if we create a new node in fututure and make as slave to that global master node by default a new container is created by default what global value is defined.


############active/pause/stop/remove a particular server in a swarm mode
docker node ls                (get list of nodes)
docker node update --availability pause ip-address of server        (To pause the service of particular node and stops deployment)
docker node update --availability active ip-address of server       (To activate the service of particular node)
docker node update --availability drain ip-address of server        (To remove the service of particular node completly)
docker node update --availability stop ip-address of server         (To stop the service of particular node)
These commands helps to do some upgrades in servers for patching upgrading, node and etc



#############To create containers particullary in master node 
docker service create --constraint=node.role!=worker --name syedcontainer --publish 7000:80 --replicas 3 ubuntu:latest

Here (--constraint=node.role!=worker means (!= is called as not equal) to worker)
The nodes are created particularly in master node.



###########To create containers in workers only
docker service create --constraint=node.role==worker --name syedcontainer --publish 7000:80 --replicas 4 ubuntu:latest
Now the containers are deployed in workers as not in master as we specified role=workers





################TO create a service in a particular server
To deploy in a particular service in a particular server we give or denote a server with Label

docker node update --label-add=PERF=LABELNAME IP_address of node (To give Label to that particular node)
here in labelname u need to give a label name for that node
for eg as label name as deployment_node

docker service create --name servicename1 --constraint=node.labels.PERF==label_name --replicas 4 --publish 8000:80 nginx:latest
 


########Docker Secrets
Docker secrets helps to store senstive information such as username and passwords and protect from unauthorized usage access from hackers
Usually passwords are stored generally in documents or mention in scripts or in Yaml files or Dockerfile to authenticate the database servers in generally 
as database servers communicate with username and passwords or an node communicates with credentials or ssh keys
Hence such sensitive information is kept in encoded format as base64 in sepearate containers which holds sensitive data

openssl rand(It is an Random charecters generator used to generate random passwords)

openssl rand -base64 12 | docker secret create db_root_password -                (To generate random password for root data_base)
(This should be running in master node if using docker swarm)

openssl rand -base64 12 | docker secret create db_dba_password -                 (To generate database account password)

Both passwords are encrypted in base64 format

docker secret ls              (To list all secrets)
docker inspect secret_name    (To inspect a secret)

base64 passwords can be decoded in online by using base64 decoder tool

Manually set password and convert to base64
echo "hi@123" | base64
The hi@123 is encoded in base64 and result is displayed

All secrets which are out side has to be Mount in the seperate container, The commands are:\
docker secret ls                    (gets list of secrets)
docker service create --name nginx01 --secret name_of_secret1 --secret name_of_secret2 --publish 8000:80 image_name:version_of_image
(The secrets are mounted in the nginx01 container)

docker exec -it container_id bin/bash  (To get inside of secrets container)

"The secrets folder is present in /run directory and you can get inside of secrets folder and find the two passwords"
cat file_name 
you will get encoded result of secrets

All the secrets configuration and environment variables are mentioned and required changes and configuration stack.yml file is deployed
#Refer stack file in docker git folder to know more related to secrets configuration.

##########How to deploy a stack file.yml
The stack file version mentioned in file and docker swarm intsalled version should match both
Switch to root user first
docker stack deploy -c stackfilename.yml            (To deploy the Stack file)
docker service ls
docker service ps 
docker service ps name_of_service

For example if There are two containers in a single master node
one is Mysql and second is secrets
get inside of mysql container which is created by using stack.yml file
docker exec -it container_id of Mysql     (TO get inside of Mysql Container)
to access Mysql 
mysql -u root -p      (Run the command to access mysql with password and give root password which u find in secrets container)

############docker config






########Docker reservation and limits


