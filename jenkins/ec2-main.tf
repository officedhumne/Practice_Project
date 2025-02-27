resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.dev.id
    key_name = var.key_name
    vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
    tags = {
      Name = "dev-ec2"
    }
 

}