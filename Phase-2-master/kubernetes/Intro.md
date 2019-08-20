Reference-1: https://kubernetes.io/docs/tutorials/kubernetes-basics/

Reference-2: https://github.com/kubernetes/kubernetes

### Install kubectl on Redhat

https://kubernetes.io/docs/tasks/tools/install-kubectl/#before-you-begin

    cat <<EOF > /etc/yum.repos.d/kubernetes.repo
    [kubernetes]
    name=Kubernetes
    baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
    enabled=1
    gpgcheck=1
    repo_gpgcheck=1
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    EOF

    yum install -y kubectl

    kubectl version

    kubectl cluster-info
    



