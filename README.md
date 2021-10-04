# aws-courses

### Week 0
```
aws cloudformation create-stack \\
--stack-name week0 \\
--template-body file://rlazoryshchak-ec2-instance.yml \\
--parameters '[{"ParameterKey":"ImageId","ParameterValue":"ami-03d5c68bab01f3496"}]'
```
