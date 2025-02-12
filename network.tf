#create vpc#
resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name ="test server}"
  }
}

#create subnet

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.test.id
    cidr_block = "10.0.0.0/24"
    tags = {
      name = "public_subnet"
    }
  
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.test.id
    cidr_block = "10.0.1.0/24"
    tags = {
      name = "public_subnet"
    }
  
}

#internet gateway and attch to vpc

resource "aws_internet_gateway" "test" {
  vpc_id = aws_vpc.test.id
}
  #natgateway

  # Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  
}


#create route table

resource "aws_route_table" "test" {
    vpc_id = aws_vpc.test.id
    route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  
}
}
# subnet association

resource "aws_route_table_association" "test"{
route_table_id = aws_route_table.test.id
subnet_id = aws_subnet.public.id

} 
  
  #create security group

  resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    vpc_id = aws_vpc.test.id
    tags = {
      name = "test_sg"
    }
ingress {
    description = "tls from vpc"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress{
  description = "tls from vpc"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
}
  }


  # Create the NAT Gateway
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
}