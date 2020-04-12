

printenv | grep "TF_VAR"


gcloud projects list
gcloud config set project [PROJECT_ID]

Comando utilizado:
kubergrunt helm configure --helm-home ~/.helm --tiller-namespace "kube-system" --resource-namespace "kube-system" --kubectl-context-name 

gcloud auth list
gcloud config set project [PROJECT_ID]

kubectl get secret -n kube-system
kubectl get deployments -n kube-system
kubectl get services -n kube-system
kubectl get rolebinding -n kube-system
kubectl get apiservices -n kube-system
kubectl delete secret tiller-client-fa2dd58e4c30bb0a12fa21f6fac01530-certs -n kube-system 


$ helm delete --purge --no-hooks kubedb-catalog
$ helm delete --purge --no-hooks kubedb-operator



kubectl get apis --all-namespaces | grep "krew"
kubectl get secret --all-namespaces | grep "krew"


##########
HELM
##########
source ~/.helm/env




############
Postgres
############
cd git-lab-ce:
$ kubectl apply -f kubedb.yaml -n gitlab

kubectl edit pg gitlab-postgres -n gitlab
termi

#########Senha do banco
$ kubectl get secrets -n gitlab
gitlab-postgres-auth 

$ kubectl describe secret gitlab-postgres-auth -n gitlab

$ kubectl get secrets -n demo quick-postgres-auth -o jsonpath='{.data.\POSTGRES_USER}' | base64 -d postgres



