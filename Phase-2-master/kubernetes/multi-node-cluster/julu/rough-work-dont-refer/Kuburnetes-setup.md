
* Reference: https://kubernetes.io/docs/getting-started-guides/ubuntu/installation/

* Reference: https://kubernetes.io/docs/tasks/access-application-cluster/service-access-application-cluster/#objectives

# Launch an AWS Ubuntu machine and login as route user.

	apt install juju-2.0 -y

# 1. Add the cloud & credentials

  * Command: juju add-credential aws

        Output:

        root@ip-172-31-2-89:~# juju add-credential aws
        Enter credential name: my_aws_creds

        Using auth-type "access-key".

        Enter access-key: AKIA********EVTOIQ


        Enter secret-key:

        Credential "my_aws_creds" added locally for cloud "aws".

# 2. Create an instance on AWS EC2. A new instance will be created in AWS with the instance name 'juju-controller-machine-0' and machine type t2.medium.

	* Command: juju bootstrap aws/us-east-2
	
	Output:
		root@ip-172-31-2-89:~# juju bootstrap aws/us-east-2
		Creating Juju controller "aws-us-east-2" on aws/us-east-2
		Looking for packaged Juju agent version 2.4.0 for amd64
		Launching controller instance(s) on aws/us-east-2...
		 - i-029ce605929c7924e (arch=amd64 mem=4G cores=2)us-east-2a"
		Installing Juju agent on bootstrap instance
		Fetching Juju GUI 2.13.2
		Waiting for address
		Attempting to connect to 172.31.10.23:22 #Private ip
		Attempting to connect to 18.191.254.105:22 #public ip
		Connected to 18.191.254.105
		Running machine configuration script...
		Bootstrap agent now started
		Contacting Juju controller at 18.191.254.105 to verify accessibility...
		Bootstrap complete, "aws-us-east-2" controller now available
		Controller machines are in the "controller" model
		Initial model "default" added

	
# 3. Launch a Kubernetes cluster

	juju deploy canonical-kubernetes

	Output:

	Located bundle "cs:bundle/canonical-kubernetes-218"
	Resolving charm: cs:~containers/easyrsa-50
	Resolving charm: cs:~containers/etcd-96
	Resolving charm: cs:~containers/flannel-66
	Resolving charm: cs:~containers/kubeapi-load-balancer-69
	Resolving charm: cs:~containers/kubernetes-master-122
	Resolving charm: cs:~containers/kubernetes-worker-138
	Executing changes:
	- upload charm cs:~containers/easyrsa-50 for series xenial
	- deploy application easyrsa on xenial using cs:~containers/easyrsa-50
	  added resource easyrsa
	- set annotations for easyrsa
	- upload charm cs:~containers/etcd-96 for series xenial
	- deploy application etcd on xenial using cs:~containers/etcd-96
	  added resource etcd
	  added resource snapshot
	- set annotations for etcd
	- upload charm cs:~containers/flannel-66 for series xenial
	- deploy application flannel on xenial using cs:~containers/flannel-66
	  added resource flannel-amd64
	  added resource flannel-arm64
	  added resource flannel-s390x
	- set annotations for flannel
	- upload charm cs:~containers/kubeapi-load-balancer-69 for series xenial
	- deploy application kubeapi-load-balancer on xenial using cs:~containers/kubeapi-load-balancer-69
	- expose kubeapi-load-balancer
	- set annotations for kubeapi-load-balancer
	- upload charm cs:~containers/kubernetes-master-122 for series xenial
	- deploy application kubernetes-master on xenial using cs:~containers/kubernetes-master-122
	  added resource cdk-addons
	  added resource kube-apiserver
	  added resource kube-controller-manager
	  added resource kube-scheduler
	  added resource kubectl
	- set annotations for kubernetes-master
	- upload charm cs:~containers/kubernetes-worker-138 for series xenial
	- deploy application kubernetes-worker on xenial using cs:~containers/kubernetes-worker-138
	  added resource cni-amd64
	  added resource cni-arm64
	  added resource cni-s390x
	  added resource kube-proxy
	  added resource kubectl
	  added resource kubelet
	- expose kubernetes-worker
	- set annotations for kubernetes-worker
	- add relation kubernetes-master:kube-api-endpoint - kubeapi-load-balancer:apiserver
	- add relation kubernetes-master:loadbalancer - kubeapi-load-balancer:loadbalancer
	- add relation kubernetes-master:kube-control - kubernetes-worker:kube-control
	- add relation kubernetes-master:certificates - easyrsa:client
	- add relation etcd:certificates - easyrsa:client
	- add relation kubernetes-master:etcd - etcd:db
	- add relation kubernetes-worker:certificates - easyrsa:client
	- add relation kubernetes-worker:kube-api-endpoint - kubeapi-load-balancer:website
	- add relation kubeapi-load-balancer:certificates - easyrsa:client
	- add relation flannel:etcd - etcd:db
	- add relation flannel:cni - kubernetes-master:cni
	- add relation flannel:cni - kubernetes-worker:cni
	- add unit easyrsa/0 to new machine 0
	- add unit etcd/0 to new machine 1
	- add unit etcd/1 to new machine 2
	- add unit etcd/2 to new machine 3
	- add unit kubeapi-load-balancer/0 to new machine 4
	- add unit kubernetes-master/0 to new machine 5
	- add unit kubernetes-master/1 to new machine 6
	- add unit kubernetes-worker/0 to new machine 7
	- add unit kubernetes-worker/1 to new machine 8
	- add unit kubernetes-worker/2 to new machine 9
	Deploy of bundle completed.

![image](https://user-images.githubusercontent.com/24622526/44193393-2d8d6000-a122-11e8-8515-541f9dcf80f8.png)

# 4. Monitoring:

* command: juju status (Or) watch -c juju status --color
	
		Output:
		
		Model    Controller     Cloud/Region   Version  SLA          Timestamp
		default  aws-us-east-2  aws/us-east-2  2.4.0    unsupported  07:04:56Z

		App                    Version  Status   Scale  Charm                  Store       Rev  OS      Notes
		easyrsa                3.0.1    active       1  easyrsa                jujucharms   50  ubuntu
		etcd                   3.2.9    waiting    2/3  etcd                   jujucharms   96  ubuntu
		flannel                0.10.0   active       3  flannel                jujucharms   66  ubuntu
		kubeapi-load-balancer  1.10.3   active       1  kubeapi-load-balancer  jujucharms   69  ubuntu  exposed
		kubernetes-master      1.11.2   waiting    1/2  kubernetes-master      jujucharms  122  ubuntu
		kubernetes-worker      1.11.2   waiting    2/3  kubernetes-worker      jujucharms  138  ubuntu  exposed

		Unit                      Workload  Agent       Machine  Public address  Ports           Message
		easyrsa/0*                active    idle        0        18.218.121.172                  Certificate Authority connected.
		etcd/0*                   active    idle        1        18.222.163.211  2379/tcp        Healthy with 2 known peers
		etcd/1                    active    idle        2        18.216.242.90   2379/tcp        Healthy with 2 known peers
		etcd/2                    waiting   allocating  3                                        waiting for machine
		kubeapi-load-balancer/0*  active    idle        4        18.191.12.26    443/tcp         Loadbalancer ready.
		kubernetes-master/0       waiting   allocating  5                                        waiting for machine
		kubernetes-master/1*      active    idle        6        18.222.179.121  6443/tcp        Kubernetes master running.
		  flannel/0*              active    idle                 18.222.179.121                  Flannel subnet 10.1.90.1/24
		kubernetes-worker/0*      active    idle        7        13.59.123.100   80/tcp,443/tcp  Kubernetes worker running.
		  flannel/1               active    idle                 13.59.123.100                   Flannel subnet 10.1.69.1/24
		kubernetes-worker/1       waiting   allocating  8                                        waiting for machine
		kubernetes-worker/2       active    idle        9        18.220.122.157  80/tcp,443/tcp  Kubernetes worker running.
		  flannel/2               active    idle                 18.220.122.157                  Flannel subnet 10.1.17.1/24

		Entity  Meter status  Message
		model   amber         user verification pending

		Machine  State    DNS             Inst id              Series  AZ          Message
		0        started  18.218.121.172  i-09547ce0be8b43832  xenial  us-east-2a  running
		1        started  18.222.163.211  i-0f09a38394d4ec769  xenial  us-east-2a  running
		2        started  18.216.242.90   i-0397f6f6131343f8d  xenial  us-east-2b  running
		3        down                     pending              xenial              cannot run instances: You have requested more instances (6) than your current instance limit of 5 allows for the specified instance type. Please visit http://aws.amazon.com/contact-us/ec2-request to request an adjustment to this limit. (InstanceLimitExceeded)
		4        started  18.191.12.26    i-0e43d09505af4cb65  xenial  us-east-2c  running
		5        down                     pending              xenial              cannot run instances: You have requested more instances (6) than your current instance limit of 5 allows for the specified instance type. Please visit http://aws.amazon.com/contact-us/ec2-request to request an adjustment to this limit. (InstanceLimitExceeded)
		6        started  18.222.179.121  i-073581c733040a14f  xenial  us-east-2a  running
		7        started  13.59.123.100   i-00c81b8bb296e9e50  xenial  us-east-2a  running
		8        down                     pending              xenial              cannot run instances: You have requested more instances (3) than your current instance limit of 2 allows for the specified instance type. Please visit http://aws.amazon.com/contact-us/ec2-request to request an adjustment to this limit. (InstanceLimitExceeded)
		9        started  18.220.122.157  i-03913cc1b3aa9b0f7  xenial  us-east-2b  running


![image](https://user-images.githubusercontent.com/24622526/44193680-32064880-a123-11e8-875a-dc13cfc362a5.png)

# 5. mkdir -p ~/.kube

# 6. juju scp kubernetes-master/0:/home/ubuntu/config ~/.kube/config 

	If there is any error : ERROR no available address(es)

	or check the julu status and give the active kubernetes-master 
	
	
	juju scp kubernetes-master/1:/home/ubuntu/config ~/.kube/config

	No output
	
# 7. Installing kubectl on ubuntu machine.

	sudo snap install kubectl --classic
	
	# Output: kubectl 1.11.2 from 'canonical' installed

# 8. Health Check

* Command: kubectl cluster-info
	
		Output:

		Kubernetes master is running at https://18.191.12.26:443
		Heapster is running at https://18.191.12.26:443/api/v1/namespaces/kube-system/services/heapster/proxy
		KubeDNS is running at https://18.191.12.26:443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
		kubernetes-dashboard is running at https://18.191.12.26:443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy
		Metrics-server is running at https://18.191.12.26:443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy
		Grafana is running at https://18.191.12.26:443/api/v1/namespaces/kube-system/services/monitoring-grafana/proxy
		InfluxDB is running at https://18.191.12.26:443/api/v1/namespaces/kube-system/services/monitoring-influxdb:http/proxy

		To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

# 9. Scale up cluster: https://jujucharms.com/docs/2.3/charms-constraints

# 10. Scale out cluster:

	juju add-unit kubernetes-worker
	
	Or 
	
	juju add-unit -n3 kubernetes-worker

	# Reference : https://jujucharms.com/docs/stable/reference-constraints
	
![image](https://user-images.githubusercontent.com/24622526/44199437-a77a1500-a133-11e8-8b05-c2b61ebbe47e.png)


# 11. Use the juju switch command to get the current controller name:

	root@ip-172-31-2-89:~# juju switch

	aws-us-east-2:admin/default
	
# Shutdown all the machines

# 12. Run the below command, this will shutdown and terminate all running instances on that cloud

* command: juju destroy-controller aws-us-east-2 --destroy-all-models

		root@ip-172-31-2-89:~# juju destroy-controller aws-us-east-2 --destroy-all-models
		WARNING! This command will destroy the "aws-us-east-2" controller.
		This includes all machines, applications, data and other resources.

		Continue? (y/N):y
		Destroying controller
		Waiting for hosted model resources to be reclaimed
		Waiting on 1 model, 15 machines, 6 applications
		Waiting on 1 model, 15 machines, 6 applications
		Waiting on 1 model, 15 machines, 6 applications
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 15 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 13 machines
		Waiting on 1 model, 4 machines
		All hosted models reclaimed, cleaning up controller machines

	
![image](https://user-images.githubusercontent.com/24622526/44194857-cc1bc000-a126-11e8-88c7-d803213b385d.png)

![image](https://user-images.githubusercontent.com/24622526/44195040-67ad3080-a127-11e8-9cf1-15b237c3e12f.png)

