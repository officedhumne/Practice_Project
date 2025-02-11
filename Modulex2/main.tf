resource "aws_instance" "test" {
ami = var.amiid
instance_type = var.instance_type
key_name = var.key_name

}