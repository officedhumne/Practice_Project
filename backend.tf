terraform {
  backend "s3" {
    bucket         = "ruchabucket"  # Replace with your S3 bucket name
    key            = "terraform.tfstate"  # Path in the S3 bucket where the state file will be stored
    region         = "eu-north-1"                  # The AWS region for your S3 bucket
  }
}