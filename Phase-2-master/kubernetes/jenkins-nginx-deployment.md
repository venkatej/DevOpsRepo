### two containers in a single pod

kubectl create -f [nginx-jenkins.yml](yml/nginx-jenkins.yml.yml)

kubectl get all -o wide

kubectl describe pod [pod-name]

kubectl exec -it [pod-name] -- bin/bash

find / -name "nginx" 

find / -name "jenkins"

exit (or) Ctrl + p + q

kubectl exec -it [pod-name] -c jenkins-container -- bin/bash

cd /var/jenkins_home/

exit (or) Ctrl + p + q

kubectl exec -it [pod-name] -c nginx-container -- bin/bash

cd /usr/share/nginx/html

exit (or) Ctrl + p + q

kubectl cp [source] [destination]

case-1: if you want to copy the content from local host to container

  [source] = local host path
  [destination] = [pod-name]:[container-path] -c [container-name]

  syntax: kubectl cp [local-host-file-or-dir-path] [pod-name]:[container-path] -c [container-name]

  ex: kubectl cp sample.html jen-nginx-deployment-6dc6c78687-5h8hr:/usr/share/nginx/html/ -c nginx-container

  kubectl exec [pod-name] -c nginx-container ls /usr/share/nginx/html/

case-1: if you want to copy the content from container to local host

  [source] = [pod-name]:[container-path] -c [container-name]
  [destination] = local host path

  syntax: kubectl cp [pod-name]:[container-path] -c [container-name] [local-host-file-or-dir-path]
  
  ex: kubectl cp jen-nginx-deployment-6dc6c78687-5h8hr:/usr/share/nginx/html/sample.html -c nginx-container ./sample.html

kubectl expose deployment.apps/jen-nginx-deployment --type=NodePort

kubectl get all (or) kubectl get svc

http://[public-ip]:[nginx-node-port]

http://[public-ip]:[jenkins-node-port]




