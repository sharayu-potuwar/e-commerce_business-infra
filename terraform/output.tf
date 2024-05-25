output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.registration.address
  sensitive   = false
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.registration.port
  sensitive   = false
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.registration.username
  sensitive   = false
}

output "rds_password" {
  description = "RDS instance root password"
  value       = aws_db_instance.registration.password
  sensitive   = true
}