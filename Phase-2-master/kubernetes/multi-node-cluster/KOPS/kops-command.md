
Refer: https://github.com/kubernetes/kops/blob/master/docs/commands.md

Ex: kops create cluster

       kkops create cluster \
                  --node-count 3 \
                  --zones us-west-2a,us-west-2b,us-west-2c \
                  --master-zones us-west-2a,us-west-2b,us-west-2c \
                  --dns-zone example.com \
                  --node-size t2.medium \
                  --master-size t2.medium \
                  --node-security-groups sg-12345678 \
                  --master-security-groups sg-12345678,i-abcd1234 \
                  --topology private \
                  --networking weave \
                  --cloud-labels "Team=Dev,Owner=John Doe" \
                  --image 293135079892/k8s-1.4-debian-jessie-amd64-hvm-ebs-2016-11-16 \
                  ${CLUSTER-NAME}


