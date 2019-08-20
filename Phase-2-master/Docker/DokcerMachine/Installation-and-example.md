
* Reference for docker-machine installation: https://docs.docker.com/machine/install-machine/#install-machine-directly
* Reference for docker machine docs: https://docs.docker.com/machine/
* Referecne for Docker with AWS example: https://docs.docker.com/machine/drivers/aws/
* Referecne for Docker with AWS example: https://stackoverflow.com/questions/45658541/docker-machine-connect-to-existing-aws-machine/46228588#46228588
* Referecne for Docker with AWS example: http://docker-k8s-lab.readthedocs.io/en/latest/docker/docker-machine-aws.html
* Docker supporting drivers: https://docs.docker.com/machine/drivers/

### Install AWS CLI

    apt-get update -y && apt-get install awscli -y

### Install docker on Ubuntu.

[Dokcer-Installation-Ubuntu](https://github.com/DevOpsBasicSetup/Phase-2/blob/master/Docker/DockerEngine/2.1.Dokcer-Installation-Ubuntu.md)

### Install docker-machine on Ubuntu:

    base=https://github.com/docker/machine/releases/download/v0.14.0 &&
      curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
      sudo install /tmp/docker-machine /usr/local/bin/docker-machine
      
      docker-machine version
      
### Example: Create an AWS EC2 instance using docker-machine.

#### Follow the below steps.

* Note: In this practice, better if you create VPC/Subnet to secure your virtual machines before you create IAM user. If you create IAM user without VPC, remove the IAM user & change your AWS account password immidiately, otherwise your EC2 service will be locked for some hours.

* Creare IAM in AWS.  Refer: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html#create-an-iam-user
    * Services --> Security, Identity & Compliance --> IAM --> Users --> Add User.
    * Provide Username.
    * Check this box "AWS Management Console access".
    * Choose "Custom password" and enter the password. (check the box "show passowrd" to check what you are typing.)
    * Uncheck the box "Users must create a new password at next sign-in". and then click on the button "Next: Permissions"
    * Create Group.
    * Give the group name.
    * Choose "AdministratorAccess" from the list of policies. and then click on the button "Next: Review"
    * Finally click on "Create User" button.
    
* Create access key & secret key for the IAM user.
    * Go to Users --> Security Credentials --> Create Access Key --> Copy the Access Key Id & Secret Access Key.
    
* Configure AWS credentials in docker host.

    aws configure
    
        root@ip-172-31-18-41:~# aws configure
        AWS Access Key ID [None]: ************
        AWS Secret Access Key [None]: *******
        Default region name [None]: us-east-2
        Default output format [None]: json

* Run the below command

        docker-machine create --driver amazonec2 --amazonec2-region us-east-2 docker-node-1
    
By default ubuntu image will be installed on the instance. Give the Redhat Linux amazon AMI to create an instance with redhat os.
    
    docker-machine create --driver amazonec2 --amazonec2-access-key ${Access Key Id} --amazonec2-secret-key ${Secret Access Key} --amazonec2-open-port 8000 --amazonec2-region us-east-2 --amazonec2-ami ami-03291866 aws-instance-name

Go to EC2 instances: 

![image](https://user-images.githubusercontent.com/24622526/43895229-0f2f6238-9bc4-11e8-9f96-6e4473041f9e.png)

#### docker-machine ls
    
![image](https://user-images.githubusercontent.com/24622526/43895159-ddf1d836-9bc3-11e8-8e71-ee14adc928c7.png)

### Connect to the AWS machines/instances which are created by docker-machine.

#### Using docker: docker-machine ssh aws-sandbox20

![image](https://user-images.githubusercontent.com/24622526/43895278-47288282-9bc4-11e8-80d3-41d10877c9ff.png)

#### from local git bash:

* If we need to connect to AWS instance from git bash we need .pem file with private key.
* Copy the private key of the instance from docker machine.
* Run the below command to know where the private key stored in docker machine.

    docker-machine inspect aws-sandbox21
    
![image](https://user-images.githubusercontent.com/24622526/43895396-b703c8b4-9bc4-11e8-892b-70b05073945a.png)

* Shown in above pic, private key of the instance "aws-sandbox21"  is there in the path "SSHKeyPath": "/root/.docker/machine/machines/aws-sandbox21/id_rsa"
* cat /root/.docker/machine/machines/aws-sandbox21/id_rsa
* Copy the private key and paste it in your notepad and save the file with the name "aws-sandbox21.pem".
* Go to AWS EC2 instances --> Select the instacne "aws-sandbox21" --> Connect --> Copy the SSH command.

![image](https://user-images.githubusercontent.com/24622526/43895860-352353e4-9bc6-11e8-8298-b26a759c86a3.png)

* Open git bash terminal, paste the command.
* Connect to your instance.

![image](https://user-images.githubusercontent.com/24622526/43895919-7c8f84dc-9bc6-11e8-8715-8d46902e3a1d.png)


### Cretae AWS EC2 instance using VPC

    docker-machine create --driver amazonec2 --amazonec2-access-key AKIA******* --amazonec2-secret-key 2ORa7Qv***************Dt3jEAe --amazonec2-vpc-id vpc-fsdff4335rrwg43w --amazonec2-subnet-id subnet-daf42f432f54g6y6h6h --amazonec2-region us-east-2 aws-sandbox-ubuntu
    

    
