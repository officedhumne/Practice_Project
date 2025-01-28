resource "aws_instance" "Dev" {
ami = var.amiid
instance_type = var.instance_type
key_name = var.key_name

}