# Define the provider (e.g., AWS, Azure)
provider "aws" {
  region = "us-west-2"
}

# Define an AWS EC2 instance resource
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

# Output the instance ID after deployment
output "instance_id" {
  value = aws_instance.example.id
}