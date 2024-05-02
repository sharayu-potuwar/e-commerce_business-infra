resource "aws_secretsmanager_secret" "ecom_secretmanager" {
  name = "${var.env}_ecom_secretmanager"
}

resource "aws_secretsmanager_secret_version" "ecom_sm_version" {
  secret_id     = aws_secretsmanager_secret.ecom_secretmanager.id
  secret_string = "zPFJ6Pl25lZAzyE7jMytDIWUcpmqr5Ul"
}