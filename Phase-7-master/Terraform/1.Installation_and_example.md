Refer: 

* Intro: https://www.terraform.io/intro/index.html

* Install: https://learn.hashicorp.com/terraform/getting-started/install.html

* Setup the path: https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux-unix

* Providers(Terraform can support these provides) : https://www.terraform.io/docs/providers/index.html

1. Download the terraform binary package.

        wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip
        
2. unzip the package & path setup

        apt-get update -y && apt-get install unzip -y
        
        unzip terraform_0.11.10_linux_amd64.zip

        mv terraform /var/lib/terraform
        
        export PATH="$PATH:/var/lib/"  
        
                (or) 
        PATH="$PATH:/var/lib/" add this path in to the file ~/.profile or ~/.bash_profile

        source ~/.profile or source ~/.bash_profile
                
        
        terraform -version

3.  Examples: AWS

    3.1. Install awscli to configure the credentials.

        apt-get install awscli -y

    3.2. Create an user in IAM with "AmazonEC2FullAccess". 
    
        aws configure
        
        root@ip-172-31-45-245:~# aws configure
        AWS Access Key ID [None]: AKIAIE************FA
        AWS Secret Access Key [None]: mbC***************8wSfq3UytJ
        Default region name [None]: us-east-1
        Default output format [None]: json
        
    3.3. example.tf
    
        provider "aws" {
           region     = "us-east-1"
        }

        resource "aws_instance" "example" {
          ami           = "ami-0ac019f4fcb7cb7e6"
          instance_type = "t2.micro"
          availability_zone = "us-east-1a"
        }
        
     3.4. terraform init


         root@ip-172-31-45-245:~# terraform init

        Initializing provider plugins...
        - Checking for available provider plugins on https://releases.hashicorp.com...
        - Downloading plugin for provider "aws" (1.50.0)...

        The following providers do not have any version constraints in configuration,
        so the latest version was installed.

        To prevent automatic upgrades to new major versions that may contain breaking
        changes, it is recommended to add version = "..." constraints to the
        corresponding provider blocks in configuration, with the constraint strings
        suggested below.

        * provider.aws: version = "~> 1.50"

        Terraform has been successfully initialized!

        You may now begin working with Terraform. Try running "terraform plan" to see
        any changes that are required for your infrastructure. All Terraform commands
        should now work.

        If you ever set or change modules or backend configuration for Terraform,
        rerun this command to reinitialize your working directory. If you forget, other
        commands will detect it and remind you to do so if necessary.

    * note: Run the command to see the provider plugin details `terraform -version`.

    3.5. terraform apply
    
        root@ip-172-31-45-245:~# terraform apply

        An execution plan has been generated and is shown below.
        Resource actions are indicated with the following symbols:
          + create

        Terraform will perform the following actions:

          + aws_instance.example
              id:                           <computed>
              ami:                          "ami-0ac019f4fcb7cb7e6"
              arn:                          <computed>
              associate_public_ip_address:  <computed>
              availability_zone:            <computed>
              cpu_core_count:               <computed>
              cpu_threads_per_core:         <computed>
              ebs_block_device.#:           <computed>
              ephemeral_block_device.#:     <computed>
              get_password_data:            "false"
              instance_state:               <computed>
              instance_type:                "t2.micro"
              ipv6_address_count:           <computed>
              ipv6_addresses.#:             <computed>
              key_name:                     <computed>
              network_interface.#:          <computed>
              network_interface_id:         <computed>
              password_data:                <computed>
              placement_group:              <computed>
              primary_network_interface_id: <computed>
              private_dns:                  <computed>
              private_ip:                   <computed>
              public_dns:                   <computed>
              public_ip:                    <computed>
              root_block_device.#:          <computed>
              security_groups.#:            <computed>
              source_dest_check:            "true"
              subnet_id:                    <computed>
              tenancy:                      <computed>
              volume_tags.%:                <computed>
              vpc_security_group_ids.#:     <computed>


        Plan: 1 to add, 0 to change, 0 to destroy.

        Do you want to perform these actions?
          Terraform will perform the actions described above.
          Only 'yes' will be accepted to approve.

          Enter a value: yes

        aws_instance.example: Creating...
          ami:                          "" => "ami-0ac019f4fcb7cb7e6"
          arn:                          "" => "<computed>"
          associate_public_ip_address:  "" => "<computed>"
          availability_zone:            "" => "<computed>"
          cpu_core_count:               "" => "<computed>"
          cpu_threads_per_core:         "" => "<computed>"
          ebs_block_device.#:           "" => "<computed>"
          ephemeral_block_device.#:     "" => "<computed>"
          get_password_data:            "" => "false"
          instance_state:               "" => "<computed>"
          instance_type:                "" => "t2.micro"
          ipv6_address_count:           "" => "<computed>"
          ipv6_addresses.#:             "" => "<computed>"
          key_name:                     "" => "<computed>"
          network_interface.#:          "" => "<computed>"
          network_interface_id:         "" => "<computed>"
          password_data:                "" => "<computed>"
          placement_group:              "" => "<computed>"
          primary_network_interface_id: "" => "<computed>"
          private_dns:                  "" => "<computed>"
          private_ip:                   "" => "<computed>"
          public_dns:                   "" => "<computed>"
          public_ip:                    "" => "<computed>"
          root_block_device.#:          "" => "<computed>"
          security_groups.#:            "" => "<computed>"
          source_dest_check:            "" => "true"
          subnet_id:                    "" => "<computed>"
          tenancy:                      "" => "<computed>"
          volume_tags.%:                "" => "<computed>"
          vpc_security_group_ids.#:     "" => "<computed>"
        aws_instance.example: Still creating... (10s elapsed)
        aws_instance.example: Still creating... (20s elapsed)
        aws_instance.example: Still creating... (30s elapsed)
        aws_instance.example: Creation complete after 31s (ID: i-038bb9d97a99333d7)



    3.6. terraform show

               root@ip-172-31-45-245:~# terraform show
                aws_instance.example:
                  id = i-038bb9d97a99333d7
                  ami = ami-0ac019f4fcb7cb7e6
                  arn = arn:aws:ec2:us-east-1:032654871437:instance/i-038bb9d97a99333d7
                  associate_public_ip_address = true
                  availability_zone = us-east-1a
                  cpu_core_count = 1
                  cpu_threads_per_core = 1
                  credit_specification.# = 1
                  credit_specification.0.cpu_credits = standard
                  disable_api_termination = false
                  ebs_block_device.# = 0
                  ebs_optimized = false
                  ephemeral_block_device.# = 0
                  get_password_data = false
                  iam_instance_profile =
                  instance_state = running
                  instance_type = t2.micro
                  ipv6_addresses.# = 0
                  key_name =
                  monitoring = false
                  network_interface.# = 0
                  network_interface_id = eni-0e0bf40141ffe6f82
                  password_data =
                  placement_group =
                  primary_network_interface_id = eni-0e0bf40141ffe6f82
                  private_dns = ip-172-31-37-23.ec2.internal
                  private_ip = 172.31.37.23
                  public_dns = ec2-34-207-246-13.compute-1.amazonaws.com
                  public_ip = 34.207.246.13
                  root_block_device.# = 1
                  root_block_device.0.delete_on_termination = true
                  root_block_device.0.iops = 100
                  root_block_device.0.volume_id = vol-01db4015f547f2389
                  root_block_device.0.volume_size = 8
                  root_block_device.0.volume_type = gp2
                  security_groups.# = 1
                  security_groups.3814588639 = default
                  source_dest_check = true
                  subnet_id = subnet-91a121cd
                  tags.% = 0
                  tenancy = default
                  volume_tags.% = 0
                  vpc_security_group_ids.# = 1
                  vpc_security_group_ids.4153382048 = sg-eba83ba7

      ![image](https://user-images.githubusercontent.com/24622526/49490840-d7326180-f877-11e8-8aac-3c65adf1fb37.png)

      
      3.7. Chaging the infrastructure.
      
           Updating the availability zone from availability_zone = "us-east-1a" to "us-east-1b" in the file "example.tf".
           
           terraform apply
           
           root@ip-172-31-45-245:~# terraform apply
                aws_instance.example: Refreshing state... (ID: i-038bb9d97a99333d7)

                An execution plan has been generated and is shown below.
                Resource actions are indicated with the following symbols:
                -/+ destroy and then create replacement

                Terraform will perform the following actions:

                -/+ aws_instance.example (new resource required)
                      id:                           "i-038bb9d97a99333d7" => <computed> (forces new resource)
                      ami:                          "ami-0ac019f4fcb7cb7e6" => "ami-0ac019f4fcb7cb7e6"
                      arn:                          "arn:aws:ec2:us-east-1:032654871437:instance/i-038bb9d97a99333d7" => <computed>
                      associate_public_ip_address:  "true" => <computed>
                      availability_zone:            "us-east-1a" => "us-east-1b" (forces new resource)
                      cpu_core_count:               "1" => <computed>
                      cpu_threads_per_core:         "1" => <computed>
                      ebs_block_device.#:           "0" => <computed>
                      ephemeral_block_device.#:     "0" => <computed>
                      get_password_data:            "false" => "false"
                      instance_state:               "running" => <computed>
                      instance_type:                "t2.micro" => "t2.micro"
                      ipv6_address_count:           "" => <computed>
                      ipv6_addresses.#:             "0" => <computed>
                      key_name:                     "" => <computed>
                      network_interface.#:          "0" => <computed>
                      network_interface_id:         "eni-0e0bf40141ffe6f82" => <computed>
                      password_data:                "" => <computed>
                      placement_group:              "" => <computed>
                      primary_network_interface_id: "eni-0e0bf40141ffe6f82" => <computed>
                      private_dns:                  "ip-172-31-37-23.ec2.internal" => <computed>
                      private_ip:                   "172.31.37.23" => <computed>
                      public_dns:                   "ec2-34-207-246-13.compute-1.amazonaws.com" => <computed>
                      public_ip:                    "34.207.246.13" => <computed>
                      root_block_device.#:          "1" => <computed>
                      security_groups.#:            "1" => <computed>
                      source_dest_check:            "true" => "true"
                      subnet_id:                    "subnet-91a121cd" => <computed>
                      tenancy:                      "default" => <computed>
                      volume_tags.%:                "0" => <computed>
                      vpc_security_group_ids.#:     "1" => <computed>


                Plan: 1 to add, 0 to change, 1 to destroy.

                Do you want to perform these actions?
                  Terraform will perform the actions described above.
                  Only 'yes' will be accepted to approve.

                  Enter a value: yes

                aws_instance.example: Destroying... (ID: i-038bb9d97a99333d7)
                aws_instance.example: Still destroying... (ID: i-038bb9d97a99333d7, 10s elapsed)
                aws_instance.example: Still destroying... (ID: i-038bb9d97a99333d7, 20s elapsed)
                aws_instance.example: Still destroying... (ID: i-038bb9d97a99333d7, 30s elapsed)
                aws_instance.example: Still destroying... (ID: i-038bb9d97a99333d7, 40s elapsed)
                aws_instance.example: Still destroying... (ID: i-038bb9d97a99333d7, 50s elapsed)

                aws_instance.example: Destruction complete after 1m10s
                aws_instance.example: Creating...
                  ami:                          "" => "ami-0ac019f4fcb7cb7e6"
                  arn:                          "" => "<computed>"
                  associate_public_ip_address:  "" => "<computed>"
                  availability_zone:            "" => "us-east-1b"
                  cpu_core_count:               "" => "<computed>"
                  cpu_threads_per_core:         "" => "<computed>"
                  ebs_block_device.#:           "" => "<computed>"
                  ephemeral_block_device.#:     "" => "<computed>"
                  get_password_data:            "" => "false"
                  instance_state:               "" => "<computed>"
                  instance_type:                "" => "t2.micro"
                  ipv6_address_count:           "" => "<computed>"
                  ipv6_addresses.#:             "" => "<computed>"
                  key_name:                     "" => "<computed>"
                  network_interface.#:          "" => "<computed>"
                  network_interface_id:         "" => "<computed>"
                  password_data:                "" => "<computed>"
                  placement_group:              "" => "<computed>"
                  primary_network_interface_id: "" => "<computed>"
                  private_dns:                  "" => "<computed>"
                  private_ip:                   "" => "<computed>"
                  public_dns:                   "" => "<computed>"
                  public_ip:                    "" => "<computed>"
                  root_block_device.#:          "" => "<computed>"
                  security_groups.#:            "" => "<computed>"
                  source_dest_check:            "" => "true"
                  subnet_id:                    "" => "<computed>"
                  tenancy:                      "" => "<computed>"
                  volume_tags.%:                "" => "<computed>"
                  vpc_security_group_ids.#:     "" => "<computed>"
                aws_instance.example: Still creating... (10s elapsed)
                aws_instance.example: Still creating... (20s elapsed)
                aws_instance.example: Creation complete after 21s (ID: i-0773f0af9934b6784)

                Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
                root@ip-172-31-45-245:~#
           
           
       ![image](https://user-images.githubusercontent.com/24622526/49491008-8bcc8300-f878-11e8-8011-214aeabc15d2.png)

       ![image](https://user-images.githubusercontent.com/24622526/49491068-d221e200-f878-11e8-8d0c-1d7fe60d4bce.png)

     3.8. Destroy Infrastructure: terraform destroy
     
        root@ip-172-31-45-245:~# terraform destroy
        aws_instance.example: Refreshing state... (ID: i-0773f0af9934b6784)

        An execution plan has been generated and is shown below.
        Resource actions are indicated with the following symbols:
          - destroy

        Terraform will perform the following actions:

          - aws_instance.example


        Plan: 0 to add, 0 to change, 1 to destroy.

        Do you really want to destroy all resources?
          Terraform will destroy all your managed infrastructure, as shown above.
          There is no undo. Only 'yes' will be accepted to confirm.

          Enter a value: yes

        aws_instance.example: Destroying... (ID: i-0773f0af9934b6784)
        aws_instance.example: Still destroying... (ID: i-0773f0af9934b6784, 10s elapsed)
        aws_instance.example: Still destroying... (ID: i-0773f0af9934b6784, 20s elapsed)
        aws_instance.example: Still destroying... (ID: i-0773f0af9934b6784, 30s elapsed)
        aws_instance.example: Destruction complete after 40s

        Destroy complete! Resources: 1 destroyed.
        root@ip-172-31-45-245:~#

     ![image](https://user-images.githubusercontent.com/24622526/49491188-2e850180-f879-11e8-9d0e-513dada1bb7e.png)

     
     
     
           
