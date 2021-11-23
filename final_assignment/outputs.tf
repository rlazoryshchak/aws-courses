output "rds_link" {
  value = module.postgres_instance.rds_link
}

output "sns_topic_arn" {
  value = aws_sns_topic.sns_topic.arn
}

output "sqs_queue_url" {
  value = aws_sqs_queue.sqs_queue.id
}

output "load-balancer-link" {
  value = module.ec2.load-balancer-link
}