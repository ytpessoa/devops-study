
##################################
#   Minikube:  kubernetes local  #
##################################
$ minikube start #configura 'kubectl' para usar "minikube"
$ minikube start -p <name> # to create a new cluster
$ minikube delete #to delete this one


#####################################################
#  OBJETOS KUBERNETES                               #
#####################################################

# "Deployment(estado desejado)" supervisona -> "Replicaset" responsável por-> grupo de "Pods" idênticos(réplicas).
# "Pods"(grupo de um ou mais conteineres) 

kubectl get deployments #no namespace atual
#demo
kubectl describe deployments/demo #mais especifico

#---------------------Reconciliation loop----------------------------------------#
kubectl get pods --selector app=demo 		# Verificando Pod em execucação:
#demo544930
kubectl delete pods --selector app=demo 	#excluindo Pod
kubectl get pods --selector app=demo 		# Verificando Pod em execucação:
#demo544930 --O kubernetes subiu de novo 
kubectl delete all --selector app=demo# 	#limpeza: deleta 'pod', 'service' and 'deployent.apps'







##################################
#   Executando uma aplicação     #
##################################
#1-Exemplo: com Dockerfile
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

#2-Config "kubectl" para executar Kubernetes local com "minikube"
sudo minikube start
sudo kubectl run myytallo --image=ytpessoa/myytallo --port=9999 --labels app=myytallo 
#deployments.apps "myytallo" created
sudo kubectl port-forward deploy/myytallo 9999:8888
kubectl get deployments
# NAME       READY   UP-TO-DATE   AVAILABLE   AGE
# myytallo   1/1     1            1           9m21s
$ kubectl describe deployments/myytallo
# Name:                   myytallo
# Namespace:              default
$ kubectl get pods --selector app=myytallo  #se Pod está run
# NAME                       READY   STATUS    RESTARTS   AGE
# myytallo-6749c798b-hv6gw   1/1     Running   0          13m
$ kubectl delete pods --selector app=myytallo
#pod "myytallo-6749c798b-hv6gw" deleted
$ kubectl get pods --selector app=myytallo
#pod foi criado novamente: laço de reconciliação
# NAME                       READY   STATUS    RESTARTS   AGE
# myytallo-6749c798b-x8kkp   1/1     Running   0          67s

#####################################################
#   Executando uma aplicação  com YAML kubernetes   #
#####################################################
$ kubectl apply -f deployment.yaml 
#deployment.apps "demo" created
$ kubectl get pods --selector app=demo
$ kubectl apply -f service.yaml #para se conectar ao pod
$ kubectl port-forward service/demo 9999:8888 # conectando serviço 'demo' em máquina local
$ ls example01-YAML/ #limpeza
# deployment.yaml  service.yaml
$ kubectl delete -f example01/



kubectl get nodes
kubectl describe pod/demo-dev



#####################################################
#   HELM para instalar recursos no cluster K8s      #
#####################################################

#1-Autorizar o helm a acessar o cluster
$ ls
#helm-auth-yaml
$ kubectl apply -f example02-helm/helm-auth.yaml
 #serviceaccount/'tiller' created
 #clusterrolebinding.rbac.authorization.k8s.io/'tiller' created

#2-Inicializar o helm para acessar o cluster
$ helm init --service-account tiller
# $HELM_HOME has been configured at /home/ytallo/.helm.
#Tiller (the Helm server-side component) has been installed into your Kubernetes Cluster.

$ helm version
# Client: &version.Version{SemVer:"v2.16.1", GitCommit:"bbdfe5e7803a12bbdf97e94cd847859890cf4050", GitTreeState:"clean"}
# Server: &version.Version{SemVer:"v2.16.1", GitCommit:"bbdfe5e7803a12bbdf97e94cd847859890cf4050", GitTreeState:"clean"}

#3-Instalando um Helm chart para depoly da aplicação 'demo':
$ kubectl delete all --selector app=demo #limpando qualquer deploy anterior
# pod "demo-57457fb5fb-m7vvx" deleted
# service "demo-service" deleted
# replicaset.apps "demo-57457fb5fb" deleted
$ ls
#Chart.yaml  demo  helm-auth.yaml  production-values.yaml  staging-values.yaml  templates  values.yaml
$ helm install --name demo .
# NAME:   demo
# LAST DEPLOYED: Sun Feb  2 15:59:12 2020
# NAMESPACE: default
# STATUS: DEPLOYED

# RESOURCES:
# ==> v1/Deployment
# NAME  AGE
# demo  0s

# ==> v1/Pod(related)
# NAME                   AGE
# demo-57457fb5fb-m7vvx  0s

# ==> v1/Service
# NAME          AGE
# demo-service  0s

$ helm del --purge demo #apagar
#release "demo" deleted

$ helm list #quais releases estao executando
# NAME    REVISION        UPDATED                         STATUS          CHART           APP VERSION     NAMESPACE
# demo    1               Sun Feb  2 16:10:30 2020        DEPLOYED        demo-1.0.1                      default  


#####################################################
#  NAMESPACES                                       #
#####################################################
$ kubectl get namespaces
# NAME              STATUS   AGE
# default           Active   16h
# kube-node-lease   Active   16h
# kube-public       Active   16h
# kube-system       Active   16h
$ kubectl get pods -n kube-system 
#lista de pods no namespace kube-system
# NAME                               READY   STATUS    RESTARTS   AGE
# coredns-6955765f44-7955j           1/1     Running   1          16h
# coredns-6955765f44-bmk6r           1/1     Running   1          16h
# etcd-minikube                      1/1     Running   1          16h
# kube-addon-manager-minikube        1/1     Running   1          16h
# kube-apiserver-minikube            1/1     Running   22         16h
# kube-controller-manager-minikube   1/1     Running   10         16h
# kube-proxy-99vjt                   1/1     Running   1          16h
# kube-scheduler-minikube            1/1     Running   10         16h
# storage-provisioner                1/1     Running   2          16h
# tiller-deploy-969865475-s7vxw      1/1     Running   0          34m



