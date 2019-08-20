https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/

https://portworx.com/tutorial-kubernetes-persistent-volumes/

https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

mkdir /mnt/nginx_vol

    echo "<center><h1>I am from $hostname</h1></center>" > /mnt/nginx_vol/index.html

kubectl create -f https://raw.githubusercontent.com/DevOpsPlatform/Phase-2/master/kubernetes/yml/PV/nginx-pv-volume.yml

kubectl get pv

kubectl create -f https://raw.githubusercontent.com/DevOpsPlatform/Phase-2/master/kubernetes/yml/PV/nginx-pv-claim.yaml

kubectl get pv

kubectl create -f https://raw.githubusercontent.com/DevOpsPlatform/Phase-2/master/kubernetes/yml/PV/nginx-pv-deploy.yml  --validate=false

