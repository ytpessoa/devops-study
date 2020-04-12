

####################################
# Install Docker Engine            #
####################################
-Install Docker Engine

sudo docker run hello-world


####################################
# Install Minikube                 #
####################################
-Install kubectl

####################################
# Docker                           #
####################################

$ docker container run -p 9999:8888 --name hello cloudnatived/demo:hello

####################################
# Kubernetesr                      #
####################################


kubectl get secret -n kube-system
kubectl get deployments -n kube-system
kubectl get services -n kube-system



***Namespace:

$ kubectl get namespaces
$ kubectl get pods -n prod ;lista de pods no namespace prod

--demo.yaml---
...
apiVersion:v1
kind:Namespace
metadata:
	name:demo
...
-------------	
$ kubectl apply -f demo.yaml




********RBAC: controle de acesso baseado em ROLES*******

-Ver se o RBAC está ativado de um Kubernetes self-hosted:

$ kubectl describe pod -n kube-system -l component=kube-apiserver
	
	outut:--authorization-mode = ...,RBAC

-Permissões da Role "edit":
$ kubectl describe clusterrole/edit



-Como acessar logs da API do GKE

-Ler livro a sessão "Visualizando os logs de um contêiner"




=====Projeto All-timing
RBAC-Controle de acesso baseado em papéis(ROLES)  do GKE


RBAC é integrado ao Kubernetes

1- ativar a API Google Kubernetes Engine
2- Instalar  SDK do CLoud 
3- Defina o ID do projeto Padrão:
gcloud config set project [PROJECT_ID]
4 - Se você estiver trabalhando com clusters zonais ou regionais:
gcloud config set compute/zone [COMPUTE_ZONE]
gcloud config set compute/region [COMPUTE_REGION]
5 - Atualize o gcloud
gcloud components update
6 - Inicializar um usuário a permitir que eles criem RBAC Roles e ClusterRoles:
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user [USER_ACCOUNT]
[USER_ACCOUNT] pelo endereço de e-mail de login do Google Cloud do usuário de destino.



GKE: RBAC <-> Cloud IAM

RBAC é um componente principal do Kubernetes e permite que você crie e conceda roles (conjuntos de permissões) para qualquer objeto ou tipo de objeto dentro do cluster.

Cloud IAM: opera em nível de projeto para vários produtos do Google Cloud

-O Cloud IAM e o Kubernetes RBAC são integrados.
-Os usuários do Google Cloud não têm nenhum Kubernetes RBAC RoleBindings.










Como configurar o acesso a clusters para a kubectl 

-Configurar o cliente(kubectl) para autenticar usando contas do Google cloud e acessar o cluster

-Precisará escolher com qual cluster a kubectl se comunica. 
Para definir um cluster padrão para a kubectl, defina o contexto atual no arquivo kubeconfig do Kubernetes

https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl?hl=pt-br#authentication


1- ativar a API Google Kubernetes Engine
2- Instalar  SDK do CLoud 
3- Defina o ID do projeto Padrão:
gcloud config set project [PROJECT_ID]
4 - Se você estiver trabalhando com clusters zonais ou regionais:
gcloud config set compute/zone [COMPUTE_ZONE]
gcloud config set compute/region [COMPUTE_REGION]
5 - Atualize o gcloud
gcloud components update
6 - Inicializar um usuário a permitir que eles criem RBAC Roles e ClusterRoles:
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user [USER_ACCOUNT]
[USER_ACCOUNT] pelo endereço de e-mail de login do Google Cloud do usuário de destino.






Arquivo de configuração do Kubernetes
-Configurando Acesso Multicluster: https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/


Kubeconfig: arquivo YAML para armazenar informações de autenticação de cluster para kubectl. Contém uma lista de contextos para os quais a kubectl se refere ao executar comandos. 
-Por padrão, o arquivo é salvo em $HOME/.kube/config.


Contexto é um grupo de parâmetros de acesso. 
Cada contexto contém um cluster do Kubernetes, um usuário e um namespace. 
O contexto atual é o cluster que é o padrão para kubectl no momento: todos os comandos kubectl são executados nesse cluster.

Quando você cria um cluster usando:

local-host$ gcloud container clusters create my-cluster

uma entrada é adicionada automaticamente a kubeconfig em seu ambiente(local-host, próprio computador), e o contexto atual muda para esse cluster.

Para adicionar, ao seu kubeconfig, cluster criados a partir de outro computador:
https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl?hl=pt-br#generate_kubeconfig_entry

endpoint de cluster: endereço IP do servidor da API Kubernetes que a kubectl e outros serviços usam para se comunicar com o mestre do cluster.
$ gcloud container clusters describe 
no campo endpoint.

Consegue o endpoint de cluster como parte da atualização de kubeconfig.
$ gcloud container clusters get-credentials

Há dois valores de endpoint exclusivos: 
-privateEndpoint, que é um endereço IP interno, e 
-publicEndpoint, que é um externo.















