output "nat_ec2_instance_id" {
  value = aws_instance.nat_instance.id
}

output "load-balancer-link" {
  value = aws_lb.load_balancer.dns_name
}