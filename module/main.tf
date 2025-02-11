module "test"{
  source = "../Modulex2"
amiid = "ami-00d65612a46d1c5f3"
instance_type ="t3.micro"
key_name = "first"
}
