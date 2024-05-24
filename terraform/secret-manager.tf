resource "aws_secretsmanager_secret" "ecom_secretmanager" {
  name = "${var.env}_ecom_secretmanager"
}
