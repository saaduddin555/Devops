Docker commands
yum install docker -y                                  To install docker

service docker status                                  To know docker status

service docker start                                   To start a docker service

docker images                                          To know how many images are there in system

docker ps                                              how many docker containers are running

docker ps -a                                           how many docker containers you are having-all

docker --help                                          to get more info and commands related to docker

docker pull tomcat                                     To Pull docker image from docker hub

docker run -d --name tomcat-container -p 8081:8080  tomcat:latest
(-d refers detached mode, --name to mention what to name for container, -p refers to give port number. external:internal, image name:tag as tomcat:latest or can give image id

docker run makes images to convert as containers or create new container.
docker run -d_image id                                      To convert into container

chk config to start the docker server in boot time or start server manually by using (start docker.service) command

docker exec -it tomcat-container  /bin/bash                 Login to docker container or get inside.

docker stop tomcat-container                                 To stop a container

docker start_container name                                  To start a container

docker build -t mytomcat .     
To build image from docker file and -t refers to give a tag or name of the image then followed by .(dot refers that docker file is in current location or if not specify path of docker file)

docker container prune                                  (to delete all stopped containers)

docker image prune -a                                  (to delete all images)

docker run -itd_Image id                               (it creates the container as well runs it)

docker ps -aq                                          (only gets containers ID)

docker run -it_image name                              (created a container and inside of container)

docker rm_container id                                  to remove container or delete

docker rm (container id) -f                             to remove container forcefully with out stopping

docker rmi (image id)                                   to remove unused images in container

docker run -p  8080:8080 -it --rm image name             Port mapping the address
docker run -p  8080:8080 --rm image name
docker run  -d -t --name “myubuntu” ubuntu /bin/bash
docker container ls                                      to get list of container

To create docker images and push to docker hub:
docker image ls                                          to get list of images
Create a repository in docker hub website first, if u want to push an image to docker hub
docker login                                                           To login in docker hub in linux server enter username and password
docker commit_container id_repository name/image-new-name:tag          (convert from container to image)
docker push_repository name/image-name:tag    (to push docker images to hub give account name)

Create or link Volumes with in container to container:
docker run -it --name containername --privileged=true --volumes-from container1 ubuntu /bin/bash
(it means to run=to create -it=interactive mode --name=name of the conatiner --privileged=true means that volume to link --volumes-from= means to link volume from what container,give container-name and ubuntu=name of os /bin/bash=root folder)
docker run -it --name containername -v /volumename ubuntu /bin/bash      (TO create a volume with container, a volume can be created only while creating a container)

Link volumes from Host machine to ec2 container volume host to container:
mkdir shared  (creaqte folder in ec2 instance)
get inside of shared folder
docker run -it --name hostcont -v /home/shared:/foldername --privileged=true ubuntu /bin/bash
/home/shared:/foldername, it is a path of ec2 server:/container link folder name to visible inside of container

docker volume ls                                                   (to list out all volumes with name, ID)
docker volume create newvolume
dokcer volume rm newvolume
docker volume prune                                     (to unmount all unmount volumes but not to use the command often)
docker inspect volumename                               (to get volume details and creation of volume info)
docker ps                                               (get container info)
docker container inspect container name                 (to get all container related info)

Docker Networking commands:
apt install net-tools
if config


Docker File               
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
