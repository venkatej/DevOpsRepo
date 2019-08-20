
#### Create a dashboard for cluster

      kubectl apply -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.10.0.yaml
      
   
   **Form the dashboard url**: https://*master-url*/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
    
   ex: https://api-venkat-k8s-local-2ej051-1706456420.us-east-2.elb.amazonaws.com/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
   
   Run the command *kubectl cluster-info* to know the [master-url]. Copy the first URL from the below list.
   
   ![image](https://user-images.githubusercontent.com/24622526/48543751-27a54780-e8e8-11e8-91d5-26ee3e137c44.png)


  Launch the dashboard URL in any browser,
  
  ![image](https://user-images.githubusercontent.com/24622526/48543684-0e9c9680-e8e8-11e8-9008-0fd924a99749.png)

  Enter the credentials:
  
  * Username: admin
  * Password: Get the *admin* password token by running the command: *kops get secrets kube --type secret -oplaintext*.
    

#### Accessing Dashboard:

Choose the second option *Token* and generate the token by running the command *kops get secrets admin --type secret -oplaintext*

![image](https://user-images.githubusercontent.com/24622526/48541627-0b52dc00-e8e3-11e8-9ebc-4a2f3ca22b69.png)

#### Dashboard after login:

![image](https://user-images.githubusercontent.com/24622526/48541595-f0806780-e8e2-11e8-9447-58ae74fc3139.png)

#### Create the deployment.

![image](https://user-images.githubusercontent.com/24622526/48541837-93d17c80-e8e3-11e8-85ac-8320952e236c.png)

#### Image details

![image](https://user-images.githubusercontent.com/24622526/48541986-fdea2180-e8e3-11e8-863f-f88714b0885c.png)

#### Deployment status

![image](https://user-images.githubusercontent.com/24622526/48541704-3c331100-e8e3-11e8-87b4-0d1338c88711.png)

#### After the deployment

![image](https://user-images.githubusercontent.com/24622526/48541786-73092700-e8e3-11e8-90a2-2bd53e3dc8c1.png)

#### Port details and access the app

![image](https://user-images.githubusercontent.com/24622526/48542510-553cc180-e8e5-11e8-9400-26f9b47da1d7.png)

#### Create the deployment for sonarqube

![image](https://user-images.githubusercontent.com/24622526/48542320-dc3d6a00-e8e4-11e8-9c0c-9a1da53cafe5.png)

#### Failed status of sonar

![image](https://user-images.githubusercontent.com/24622526/48542596-9634d600-e8e5-11e8-9b82-e71dfee3d85f.png)

#### Nodes

![image](https://user-images.githubusercontent.com/24622526/48542806-1fe4a380-e8e6-11e8-89f3-1a8782bcd1e9.png)

#### Deployments

![image](https://user-images.githubusercontent.com/24622526/48542881-4a366100-e8e6-11e8-957f-c7dc38324830.png)


#### Pods

![image](https://user-images.githubusercontent.com/24622526/48542675-cda38280-e8e5-11e8-9301-8b257ddbf688.png)


#### Replica Sets

![image](https://user-images.githubusercontent.com/24622526/48542935-620de500-e8e6-11e8-9cf3-fd527bda2d02.png)


#### Services

![image](https://user-images.githubusercontent.com/24622526/48542975-7ce05980-e8e6-11e8-8b11-888b8f099af6.png)
