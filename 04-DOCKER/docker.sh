
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



#Exemplo1:
#imagem criada:
$ sudo docker container run -p 9999:8888 --name hello2 cloudnatived/demo:hello
Navegador: http://localhost:9999/


#Exemplo: com Dockerfile
$ ls
#Dockerfile 
$ sudo docker image build -t myytallo .
$ sudo docker image ls
#myytallo            
$ sudo docker container run -p 9999:8888 myytalo
#Autenticando uma imagem no Docker Hub: baixo de qualquer lugar
  sudo docker login
  sudo docker image tag myytallo ytpessoa/myytallo          #conta Docker Hub
  sudo docker image push ytpessoa/myytallo                  #enviando para Docker Hub
  sudo docker container run -p 9999:8888 ytpessoa/myytallo  #executando do Docker Hub

  
