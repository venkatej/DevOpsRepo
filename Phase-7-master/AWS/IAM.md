#### 1. create user with policies

#### 2. create user with MFA. example with S3 bucket.

#### 3. Create user with groups.

#### 4. Login User from AWS console.

#### 5. List the users using AWS CLI. - aws configure, aws iam list-users

#### 6. Creating group & user using AWS CLI.

      aws iam create-group --group-name ec2admins

      aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --group-name ec2admins
      aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonRoute53FullAccess --group-name ec2admins
      aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --group-name ec2admins
      aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/IAMFullAccess --group-name ec2admins
      aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess --group-name ec2admins

      aws iam create-user --user-name user1

      aws iam add-user-to-group --user-name user1 --group-name ec2admins

      aws iam create-access-key --user-name user1
