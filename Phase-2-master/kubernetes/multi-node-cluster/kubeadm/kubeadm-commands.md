### kubeadm commands: https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/

kubeadm init

kubeadm join --token [token] [master-ip]:[master-port] --discovery-token-ca-cert-hash sha256:[hash]

kubeadm reset

kubeadm token list

kubeadm token generate

kubeadm token create

If you don’t have the value of --discovery-token-ca-cert-hash, you can get it by running the following command chain on the master node:

    openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
       openssl dgst -sha256 -hex | sed 's/^.* //'

kubeadm token create --print-join-command

kubeadm config

kubeadm upgrade



