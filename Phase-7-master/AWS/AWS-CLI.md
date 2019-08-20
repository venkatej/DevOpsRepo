### Install AWS CLI

refer: 
https://docs.aws.amazon.com/cli/latest/userguide/installing.html
https://docs.aws.amazon.com/cli/latest/userguide/tutorial-ec2-ubuntu.html

    apt-get update -y && apt-get install awscli -y

    Or

    apt-get update -y && apt-get install python3 python-pip -y

    pip install awscli

### AWS Commands:

    aws --version

    aws help

    aws [options] <command> <subcommand> [parameters]
  
aws configure

    root@ip-172-31-44-54:~# aws configure
    AWS Access Key ID [None]: AKIA*******PQ
    AWS Secret Access Key [None]: hrl****************Gq1OHjR1
    Default region name [None]: us-east-1
    Default output format [None]: json

1. EC2: https://docs.aws.amazon.com/cli/latest/reference/ec2/index.html

User should have *AmazonEC2FullAccess*.

        aws ec2 describe-instances

        aws ec2 describe-instances --output table

        aws ec2 describe-volumes --output text
        
        aws ec2 describe-regions --output table
        
        aws ec2 run-instances help
        
        aws ec2 describe-images help
        
        aws ec2 describe-images --filters "Name=tag:Name,Values=DevOpsWebApp"
        
        aws ec2 describe-images --filters "Name=tag:Name,Values=DevOpsWebApp" --query 'Images[*].{ID:ImageId}'
        
        aws ec2 run-instances --image-id ami-026b6eb3e6c3027e8 --count 1 --instance-type t2.micro --key-name aws-2
        
        aws ec2 run-instances --image-id ami-026b6eb3e6c3027e8 --count 1 --instance-type t2.micro --key-name aws-2 --security-group-ids sg-068402cee3c9b7f81
        
        aws ec2 create-tags --resources i-07f5dc2f7b4a019f0 --tags Key=Name,Value=MyInstance
        
        aws ec2 create-image --instance-id i-07f5dc2f7b4a019f0 --name "My server" --description "An AMI for my server"
        
        aws ec2 deregister-image --image-id ami-026b6eb3e6c3025435
              
        aws ec2 describe-instances --filters "Name=tag:Name,Values=MyInstance"
        
        aws ec2 describe-instances --filters "Name=tag:Name,Values=MyInstance" --output table
        
        aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro"
        
        aws ec2 terminate-instances --instance-ids i-07f5dc2f7b4a019f0 --output table
        
        

![image](https://user-images.githubusercontent.com/24622526/49352204-d618fd00-f6dc-11e8-9eab-3756290d7dbc.png)


        aws ec2 create-key-pair --key-name aws-3 --query 'KeyMaterial' --output text > aws-3.pem
        
        cat aws-3.pem
        
        aws ec2 run-instances --image-id ami-026b6eb3e6c3027e8 --count 1 --instance-type t2.micro --key-name aws-3
        
        chmod 400 aws-3.pem
        
        ssh -i "aws-3.pem" ubuntu@ec2-34-207-96-190.compute-1.amazonaws.com
        
        exit
        
        aws ec2 describe-key-pairs --key-name aws-2
        
        aws ec2 describe-key-pairs --key-name aws-3
        
        aws ec2 delete-key-pair --key-name aws-3
        
        aws ec2 create-security-group --group-name mySg --description "My security group"
        
        aws ec2 create-security-group --group-name mySg --description "My security group" --vpc-id vpc-1a2b3c4d
        
        aws ec2 describe-security-groups
        
        aws ec2 describe-security-groups --group-ids sg-0f6d2f1f102155f13
        
        aws ec2 authorize-security-group-ingress --group-id sg-0f6d2f1f102155f13 --protocol tcp --port 3389 --cidr 203.0.113.0/24
        
        aws ec2 authorize-security-group-ingress --group-id sg-0f6d2f1f102155f13 --protocol tcp --port 22 --cidr 0.0.0.0/0
        
2. IAM: https://docs.aws.amazon.com/cli/latest/reference/iam/

User should have *IAMFullAccess*.

        aws iam help
  
        aws iam create-user --user-name MyUser
        
        aws iam create-group --group-name MyIamGroup
        
        aws iam add-user-to-group --user-name MyUser --group-name MyIamGroup
        
        aws iam get-group --group-name MyIamGroup
        
        aws iam list-user-policies --user-name MyUser
        
        aws iam create-login-profile --user-name MyUser --password My!User1Login8P@ssword
        
        aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --user-name MyUser
        
        aws iam detach-user-policy --user-name MyUser --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess
        
        aws iam create-access-key --user-name MyUser
        
        aws iam delete-access-key --user-name MyUser --access-key-id AK******WTTQ
        
        aws iam remove-user-from-group --group-name MyIamGroup --user-name MyUser
        
        aws iam delete-group --group-name MyIamGroup
        
        aws iam delete-user --user-name MyUser
        
2. S3. : https://docs.aws.amazon.com/cli/latest/userguide/using-s3-commands.html

  User should have *AmazonS3FullAccess*.

        aws s3 help
        
        aws s3api help
        
        aws s3 ls
        
        create a bucket: aws s3 mb s3://mybucketsvn
        
        aws s3 ls s3://mybucketsvn
        
        aws s3 ls s3://bucket-name/path/
        
        echo "<center><h1>hello.." > index.html
        
        aws s3 cp index.html s3://mybucketsvn --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsersc
  
        aws s3 ls s3://mybucketsvn
        
        mkdir sample
        
        touch sample/sample.txt
        
        touch sample/sample2.txt
        
        aws s3 cp sample
        
        aws s3 cp /root/sample/ s3://mybucketsvn/ --recursive
        
        aws s3 ls s3://mybucketsvn/sample
        
        aws s3 rm s3://mybucketsvn/sample/sample.txt
        
        Remove bucket: aws s3 rb s3://mybucketsvn
        
        Remove bucket by force: aws s3 rb s3://bucket-name --force
        
        aws s3 ls
        
2. Create LB: https://docs.aws.amazon.com/elasticloadbalancing/latest/application/tutorial-application-load-balancer-cli.html

    aws elbv2 help
    
    2.1. TG
    
        aws elbv2 create-target-group --name DevOps-TG --protocol HTTP --port 8080 --vpc-id vpc-409c4f3a
        
        Note down the 'TargetGroupArn' from the output        
    
    2.2. LB
    
        aws elbv2 create-load-balancer --name DevOps-LB --subnets subnet-91a121cd subnet-59f2753e --security-groups sg-eba83ba7

        Note down the 'LoadBalancerArn' from the output
        
    2.3. Create Listener:
    
        Syntax: aws elbv2 create-listener --load-balancer-arn LoadBalancerArn --protocol HTTP --port 80  --default-actions Type=forward,TargetGroupArn=targetgroup-arn
    
        ex: aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:us-east-1:032654871437:loadbalancer/app/DevOps-LB/1bdda4c4ce80a2ae \
        --protocol HTTP --port 80  \
        --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:us-east-1:032654871437:targetgroup/DevOps-TG/4ef5d2163ec8a138

3. Create LC, ASG: EC2 full access is enough

    aws autoscaling help

    3.1. https://docs.aws.amazon.com/cli/latest/reference/autoscaling/create-launch-configuration.html
    
        aws autoscaling create-launch-configuration --launch-configuration-name DevOps-LC --key-name aws-2 --image-id ami-026b6eb3e6c3027e8 --instance-type t2.micro
            
    3.2. https://docs.aws.amazon.com/cli/latest/reference/autoscaling/create-auto-scaling-group.html

        aws autoscaling create-auto-scaling-group --auto-scaling-group-name DevOps-ASG --launch-configuration-name DevOps-LC --min-size 2 --max-size 3 --availability-zones us-east-1a

4. Attach LB/TG to ASG: https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-load-balancer-asg.html

        Syntax if it is application LB: aws autoscaling attach-load-balancer-target-groups --auto-scaling-group-name my-asg --target-group-arns my-targetgroup-arn

        aws autoscaling attach-load-balancer-target-groups --auto-scaling-group-name DevOps-ASG --target-group-arns arn:aws:elasticloadbalancing:us-east-1:032654871437:targetgroup/DevOps-TG/4ef5d2163ec8a138
        
        Detach TG from ASG: aws autoscaling detach-load-balancer-target-groups --auto-scaling-group-name my-asg --target-group-arns my-targetgroup-arn

5. Create VPC  

    5.1. Create VPC: 
    
        aws ec2 create-vpc --cidr-block 10.0.0.0/16
    
    5.2. Create subnets:
    
        aws ec2 create-subnet --vpc-id vpc-09f6375a987f12be6 --cidr-block 10.0.1.0/24
    
        aws ec2 create-subnet --vpc-id vpc-09f6375a987f12be6 --cidr-block 10.0.2.0/24
    
    5.3. Create IGW
    
        aws ec2 create-internet-gateway
    
    5.4. Attach IGW to VPC: 
    
        aws ec2 attach-internet-gateway --internet-gateway-id igw-0c8fc01622a6a123c --vpc-id vpc-09f6375a987f12be6
        
    5.5. Create Route Table
    
        aws ec2 create-route-table --vpc-id vpc-09f6375a987f12be6
        
    5.6. Add Internet Gateway Rule
    
        aws ec2 create-route --route-table-id rtb-0ebffecb4daac994c --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0c8fc01622a6a123c
        
    5.7. Associate Route Table to a Subnet
    
        aws ec2 associate-route-table --route-table-id rtb-0ebffecb4daac994c --subnet-id subnet-0e4f7715367789ab0
        
    5.8. Create Security group
    
        aws ec2 create-security-group --group-name devops-sg --vpc-id vpc-09f6375a987f12be6 --description "security group for devops"
        
        aws ec2 authorize-security-group-ingress --group-id sg-0c67435e72190e13d --protocol tcp --port 22 --cidr 0.0.0.0/0
        
        aws ec2 authorize-security-group-ingress --group-id sg-0c67435e72190e13d --protocol tcp --port 8080 --cidr 0.0.0.0/0
        
    5.9. Create Ec2 instacne:
    
        aws ec2 run-instances --image-id ami-026b6eb3e6c3027e8 --count 1 --instance-type t2.micro --key-name aws-2 --subnet-id subnet-0e4f7715367789ab0 --security-group-ids sg-0c67435e72190e13d --associate-public-ip-address
         
        
        
    
        
        
        


