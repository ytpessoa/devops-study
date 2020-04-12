kubectl apply -f deployment.yaml 
kubectl get pods -o wide
# NAME                    READY   STATUS    RESTARTS   AGE   IP           NODE   NOMINATED NODE   READINESS GATES
# demo-7cbf698c44-pdklx   1/1     Running   0          14m   172.17.0.4   m01    <none>           <none>

kubectl apply -f service.yaml # web-browser -> Service -> Pod
kubectl get services -o wide
# NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE   SELECTOR
# demo         ClusterIP   10.107.180.10   <none>        9999/TCP   14s   app=demo

kubectl port-forward service/demo 9999:8888 # localhost:Pod                            

kubectl delete -f projects01/
