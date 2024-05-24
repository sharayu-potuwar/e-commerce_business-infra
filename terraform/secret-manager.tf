resource "aws_secretsmanager_secret" "ecom_secretmanager" {
  name = "${var.env}_ecom_db_secret"
  recovery_window_in_days = 0
}
