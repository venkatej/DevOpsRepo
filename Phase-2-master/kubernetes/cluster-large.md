Refer: https://kubernetes.io/docs/setup/cluster-large/

At v1.12, Kubernetes supports clusters with up to 5000 nodes. More specifically, we support configurations that meet all of the following criteria:

 * No more than 5000 nodes
 * No more than 150000 total pods
 * No more than 300000 total containers
 * No more than 100 pods per node
