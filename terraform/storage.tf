resource "random_string" "db-password" {
    length  = 32
    upper   = true
    numeric = true
    special = false
}


resource "aws_db_instance" "registration" {
    identifier             = "${var.env}-e-commerce"
    instance_class         = "db.t3.micro"
    allocated_storage      = 5
    engine                 = "postgres"
    engine_version         = "16.1"
    username               = "ecom_user"
    password               = random_string.db-password.result
    publicly_accessible    = true
    skip_final_snapshot    = true
}

resource "aws_s3_bucket" "ecom_bucket" {
  count = try(var.env == "dev" ?  1 : 0)
  bucket = "ecom-email-sourcecode-bucket"
}

