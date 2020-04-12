
$ uname -r #versao do kernel
#5.3.0-26-generic

$ service docker status #verificar execucao

$ sudo docker container run hello-world #run container "hello-world"-> docker hub
#loading config file: /home/ytallo/.docker/config.json.
#connect to the Docker daemon socket at unix:///var/run/docker.sock

$ sudo docker image ls -a
# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# myhello             latest              0c1c88fc2095        8 days ago          6.5MB
# ytpessoa/myhello    latest              0c1c88fc2095        8 days ago          6.5MB


#Executando 
$ sudo docker pull alpine
$ sudo docker container run -ti alpine:latest
$ sudo docker ps
# id 844d6c89ddbb
$ sudo docker container stop 
$ sudo docker container stats 844d6c89ddbb


