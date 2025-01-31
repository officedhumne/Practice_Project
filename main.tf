
resource "aws_s3_bucket" "example"{
bucket = "ruchabucket"
}



resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-state-lock-dynamo"
  hash_key     = "LockID"
  read_capacity = 5
  write_capacity = 5
  attribute {
    name = "LockID"
    type = "S"
  }

  }