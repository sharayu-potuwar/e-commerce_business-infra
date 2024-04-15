output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.registration.address
  sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.registration.port
  sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.registration.username
  sensitive   = true
}

# output "rds_password" {
#   description = "RDS instance root username"
#   value       = aws_db_instance.registration.password
#   sensitive   = true
# }