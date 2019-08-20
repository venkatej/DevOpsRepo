# Reference: https://www.linuxschoolonline.com/use-ansible-to-build-and-manage-aws-ec2-instances/
# Reference: https://www.agix.com.au/build-an-ec2-using-ansible-step-by-step/
# Reference: https://packaging.python.org/guides/installing-using-linux-tools/
# https://foxutech.com/how-to-create-ec2-instance-using-ansible/

rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum install -y ansible

yum install python-pip python-wheel

pip install --upgrade pip

pip install boto botocore boto3







