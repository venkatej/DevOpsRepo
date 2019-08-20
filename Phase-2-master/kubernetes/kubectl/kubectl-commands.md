### kubectl-commands: https://kubernetes.io/docs/reference/kubectl/overview/


https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

https://kubernetes.io/docs/reference/kubectl/cheatsheet/

    kubectl [command] [TYPE] [NAME] [flags]
    
    kubectl help

* kubectl cluster-info

* kubectl config view

* kubectl get pods --all-namespaces -o wide

* create the deployments/pods/containers

  kubectl create deployment [delployment-name] --image=[docker-image-name]
  
* create the service to expose the app

  kubectl create service [port-type]  [delployment-name] --tcp=8080:8080
  
* run the specific container

  kubectl run [deployment-name] --image=jenkins --replicas=2 --port=8080 --hostport=8888

* list the pods/nodes/deployments/services/[replicasets/rs]

  kubectl get [pods/pod/po]/[nodes/node/no]/[deploy/deployments]/[services/service/svc]/[replicasets/rs]

* list the pods/nodes/deployments/services by name

  kubectl get [pods/pod/po]/[nodes/node/no]/[deploy/deployments]/[services/service/svc]/[replicasets/rs] [name]

* kubectl get pod [pod-1] [pod-2]

* kubectl get pod/[pod-1] rs/[ra-name-1] deploy/[deployment-name]

* kubectl get pod [pod-name] -o=[yaml/json/name/wide]

* description(information) of the pods/nodes/deployments/services

  kubectl describe [pods/pod/po]/[nodes/node/no]/[deploy/deployments]/[services/service/svc]/[replicasets/rs] [name]

* delete pods/nodes/deployments/services

  kubectl delete [pods/pod/po]/[nodes/node/no]/[deploy/deployments]/[services/service/svc]/[replicasets/rs] [name] 
  
  or
  
  kubectl delete [pods/pod/po]/[nodes/node/no]/[deploy/deployments]/[services/service/svc]/[replicasets/rs] [name] --force
  
* kubectl delete [pods|nodes|deploy|svc] --all

* kubectl logs [pod name]

    kubectl logs [pod name]
    
    kubectl logs [pod name] --all-containers=true
    
    kubectl logs --tail=20 [pod name] # Display only the most recent 20 lines of output in pod nginx
    
    kubectl logs -f -c ruby web-1 # Begin streaming the logs of the ruby container in pod web-1
    
    kubectl logs -p -c ruby web-1 
    
    kubectl logs --since=1h nginx # Show all logs from pod nginx written in the last hour

* kubectl apply:

  ex: kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
  
* kubectl taint: By default, your cluster will not schedule pods on the master for security reasons. If you want to be able to schedule pods on the master, e.g. for a single-machine Kubernetes cluster for development, run below command. This will remove the node-role.kubernetes.io/master taint from any nodes that have it, including the master node, meaning that the scheduler will then be able to schedule pods everywhere.

  ex: kubectl taint nodes --all node-role.kubernetes.io/master-
  
* kubectl api-versions

* kubectl apply -f FILENAME [flags]

* kubectl [command] [TYPE] [NAME] --sort-by=<jsonpath_exp>

    ex: kubectl get pods --sort-by=.metadata.name
    
* kubectl get replicationcontroller <rc-name>

* kubectl exec POD [-c CONTAINER] [-i] [-t] [flags] [-- COMMAND [args...]]

    ex: kubectl exec [pod-name] date
    
    kubectl exec -ti <pod-name> /bin/bash --> it will interact with first created container
    
    kubectl exec -ti <pod-name> -c <container-name> /bin/bash --> it will interact with specified container, if you are not sure about the container name, describe pod.  kubectl describe pod [pod-name].
    
    kubectl exec -it [pod-name] -c [container-name] -- [command]
    
* kubectl plugin list

* kubectl cp [source] [destination]

     source : local-path
     destination: pod-name:container-path
     
     ex: kubectl cp index.html [nginx-pod-name]:[container-nginx-path]



  
  
