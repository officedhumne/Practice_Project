
  #create server

  resource "aws_instance" "test" {
    ami = "ami-0e0d6e610ffe146fe"
    instance_type = "t3.micro"
    key_name = "first"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true


    # Connect using WinRM
  connection {
    type     = "winrm"
    user     = "Administrator"
    password = "e$;P4kM?-6iuuEy?(PB4l(11P0P1vhwh"  # Avoid hardcoding passwords
    host     = self.public_ip
  }
   #Connect via WinRM (Windows Remote Management)
  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, World!' > C:/Windows/Temp/hello.txt"
    ]
  }
  # Upload file
  provisioner "file" {
   source      = "D:/Terrafarm/Practice_Project/file.txt"  # Local file path
    destination = "C:/Windows/Temp/file.txt"  # EC2 destination path
  }
  }

   # Execute remote commands (e.g., PowerShell)
  #provisioner "remote-exec" {
   # inline = [
    #  "powershell.exe -ExecutionPolicy Bypass -File C:\\New folder\\file.ps1"
    #]
  

  #}

 

    # set the Administrator password
  #net user Administrator "ec2admin" / add





 ##provisioner "file" {
#source = "file.txt"  # Path to the local file on your machine
    #destination = "C:\\path\\to\\destination\\file.txt"  # Path on the remote Windows instance

  #connection {
     # type        = "winrm"
     #user        = "Administrator"  # Windows user
     # password    = "your-password"  # Your Windows password or another secure method
     # host        = self.public_ip  # Public IP of the Windows instance
   # }
 # }

  #inline = [
     # "powershell.exe -Command \"Write-Host 'File Uploaded Successfully'\""
   # ]

    ##connection {
      #type        = "winrm"
      #user        = "Administrator"
      ##password    = "your-password"
      #host        = self.public_ip
    #}
  ##} 
# Use file provisioner to upload a local file to the instance
  