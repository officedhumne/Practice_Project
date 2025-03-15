variable "ami" {
    description = "passing ami value"
    type = string
    default = ""
  
}
variable "instance_type" {
    type = string
    default = ""
  
}
variable "key_name" {
   type = string
    default = ""
  
}
variable "name" {
  description = "The name of the EC2 instance."
  default = ""
}
variable "aws_access_key" {
  type        = string
  description = "The AWS Access Key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "The AWS Secret Key"
  sensitive   = true
}
