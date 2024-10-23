# aws-courses

### Week 0
This CloudFormation template launches an EC2 instance with customizable instance type and AMI. It accepts two parameters: InstanceType (defaulting to t2.micro) and ImageId (with a few allowed AMIs). The instance is created with a specified SSH key, and the template outputs the instance's public IP and ID.
```
aws cloudformation create-stack \\
--stack-name week0 \\
--template-body file://week0/rlazoryshchak-ec2-instance.yml \\
--parameters '[{"ParameterKey":"ImageId","ParameterValue":"ami-03d5c68bab01f3496"}]'
```

### Week 1
This CloudFormation template creates an auto-scaling EC2 environment. It defines two security groups for SSH (port 22) and HTTP (port 80) access, a launch template specifying instance details like the AMI and instance type, and an auto-scaling group that manages 2-4 EC2 instances. The instances are pre-configured to install Java on launch.
```
aws cloudformation create-stack \\
--stack-name week1 \\
--template-body file://week1/rlazoryshchak-asg.yml \\
--parameters '[{"ParameterKey":"InstanceType","ParameterValue":"t2.micro"}]'
```

### Week 2
This Terraform configuration creates an EC2 instance with SSH and HTTP security groups, associates an IAM role allowing S3 access, and uses a remote-exec provisioner to copy a file from an S3 bucket to the instance. The instance is accessed via SSH using a provided key and user.
```
sh init-s3.sh
terraform init
terraform apply
```

### Week 3
This Terraform script provisions an EC2 instance with SSH, HTTP, and RDS security groups, an RDS PostgreSQL database, and a DynamoDB table. It configures an IAM role allowing S3 and DynamoDB access, and retrieves SQL and script files from S3. The RDS endpoint is outputted for further use.
```
sh init.sh
terraform init
terraform apply
```

### Week 4
This Terraform script provisions three EC2 instances:

 - Public EC2: In a public subnet with a public IP, running a basic HTTP server.
 - Private EC2: In a private subnet, no public IP, also running an HTTP server.
 - NAT EC2: In a public subnet, acting as a NAT instance to allow private EC2 outbound traffic.
```
terraform init
terraform apply
```

### Week 5
This Terraform script provisions an EC2 instance in AWS with IAM permissions for SQS and SNS. It also creates an SNS topic and an SQS queue. The EC2 instance is associated with an IAM role that allows it to interact with these services. Outputs include the public IP of the EC2 instance, the ARN of the SNS topic, and the URL of the SQS queue.
```
terraform init
terraform apply
```
