# aws-courses

### Week 0
```
aws cloudformation create-stack \\
--stack-name week0 \\
--template-body file://week0/rlazoryshchak-ec2-instance.yml \\
--parameters '[{"ParameterKey":"ImageId","ParameterValue":"ami-03d5c68bab01f3496"}]'
```

### Week 1
```
aws cloudformation create-stack \\
--stack-name week1 \\
--template-body file://week1/rlazoryshchak-asg.yml \\
--parameters '[{"ParameterKey":"InstanceType","ParameterValue":"t2.micro"}]'
```

### Week 2
```
sh init-s3.sh
terraform init
terraform apply
```

### Week 3
```
sh init.sh
terraform init
terraform apply
```

### Week 4
```
terraform init
terraform apply
```

### Week 5
```
terraform init
terraform apply
```