
##### volumes: https://kubernetes.io/docs/concepts/storage/volumes/

###### Ex-1: 

  kubectl create -f [nginx-vol-deploy.yml](https://github.com/DevOpsPlatform/Phase-2/blob/master/kubernetes/yml/nginx-vol-deploy.yml)

  kubectl create -f [nginx-vol-ser.yml](https://github.com/DevOpsPlatform/Phase-2/blob/master/kubernetes/yml/nginx-vol-ser.yml)

  vi sample.html

  kubectl cp sample.html [nginx-pod-name]:/usr/share/nginx/html/

  find / -name "sample.html"

  /var/lib/kubelet/pods/aba4a158-e5dc-11e8-91cf-024da053adc6/volumes/kubernetes.io~empty-dir/nginx-data/sample.html
  
  kubectl delete deploy/nginx-vol svc/nginx-vol
  
###### Ex-2: 

   kubectl create -f [jenkins-vol-deploy.yml](https://github.com/DevOpsPlatform/Phase-2/blob/master/kubernetes/yml/jenkins-vol-deploy.yml)
   
   kubectl create -f [jenkins-vol-service.yml](https://github.com/DevOpsPlatform/Phase-2/blob/master/kubernetes/yml/jenkins-vol-service.yml)
    
   find / -name "jenkins-vol"
  
   find / -name "jobs"
  
   /var/lib/kubelet/pods/6bdd4b58-e5e0-11e8-91cf-024da053adc6/volumes/kubernetes.io~empty-dir/jenkins-vol/
   
   kubectl delete deploy/jenkins-vol-deploy svc/jenkins-vol-deploy
  

