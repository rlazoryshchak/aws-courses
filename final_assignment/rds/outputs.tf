output "rds_link" {
  value = aws_db_instance.postgres_instance.address
}
