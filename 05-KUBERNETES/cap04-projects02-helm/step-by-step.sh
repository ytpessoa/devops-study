# HELM: GERENCIADOR DE PACOTES PARA k8s
# POD(unidade básica): grupo de conteineres que são escalonados
# Deployment: gerencia Pods de maneira declarativa(YAML): implanta, escalona, atualiza e reinicia PODs
# Service: balanceador de carga ou proxy para acesso aos Pods correspondente: IP ou nome DNS único
# Escalonador: põe os Pods pra rodar nos Nós.


# 1 Cluster
kubectl cluster-info
# Kubernetes master is running at https://192.168.99.100:8443
# KubeDNS is running at https://192.168.99.100:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
kubectl config get-contexts
# CURRENT   NAME       CLUSTER    AUTHINFO   NAMESPACE
# *         minikube   minikube   minikube   
kubectl config use-context minikube
# Switched to context "minikube".

# 2 Installing helm


# 3 Authorize helm to access cluster
kubectl apply -f helm-auth.yaml 
# serviceaccount/tiller created
# clusterrolebinding.rbac.authorization.k8s.io/tiller created

# 4 Acesso o cluster com o Helm
# helm client -> serviceaccount(tiller) -> cluster
helm init --service-account tiller #deprecated
helm init --output yaml > tiller.yaml
    # change to apps/v1
    # add the selector field:
        # ...
        # selector:
        # matchLabels:
        #   app: helm
        #   name: tiller
        # ...

kubectl apply -f tiller.yaml 
# deployment.apps/tiller-deploy created
# service/tiller-deploy created

# 5 Limpando recursos:

kubectl delete all --selector app=demo


# 6 Instalando um chart no cluster para instalar a aplicação "demo":
demo/
├── Chart.yaml
├── production-values.yaml
├── staging-values.yaml
├── templates
│   ├── deployment.yaml
│   └── service.yaml
└── values.yaml

helm install --name demo demo/
# release(instãncia de um chart em execucação no cluser): "demo"

#Listando releases:
helm list
# NAME    REVISION        UPDATED                         STATUS          CHART   
#         APP VERSION     NAMESPACE
# demo    1               Thu Mar 19 20:03:12 2020        DEPLOYED        demo-1.0
# .1                      default  

# Lista de recursos Kubernetes associados ao release "demo":
helm status demo
# LAST DEPLOYED: Thu Mar 19 20:03:12 2020
# NAMESPACE: default
# STATUS: DEPLOYED

# RESOURCES:
# ==> v1/Deployment
# NAME  READY  UP-TO-DATE  AVAILABLE  AGE
# demo  1/1    1           1          5m52s

# ==> v1/Pod(related)
# NAME                   READY  STATUS   RESTARTS  AGE
# demo-57457fb5fb-b8hwj  1/1    Running  0         5m52s

# ==> v1/Service
# NAME          TYPE          CLUSTER-IP      EXTERNAL-IP  PORT(S)       AGE
# demo-service  LoadBalancer  10.105.105.161  <pending>    80:30113/TCP  5m52s


#Acessando a aplicação
kubectl get service
# NAME           TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
# demo-service   LoadBalancer   10.105.105.161   <pending>     80:30113/TCP   16m
kubectl port-forward service/demo-service 9999:80
# Forwarding from 127.0.0.1:9999 -> 8888
http://127.0.0.1:9999/




