
  #create server

  resource "aws_instance" "test" {
    ami = "ami-00d65612a46d1c5f3"
    instance_type = "t3.micro"
    key_name = "first"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true

  }


