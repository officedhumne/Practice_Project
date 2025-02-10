resource "aws_instance" "Dev" {
ami = var.amiid
instance_type = var.instance_type
key_name = var.key_name

}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-state-lock"
  hash_key     = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }

  }