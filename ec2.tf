
  #create server

  resource "aws_instance" "test" {
    ami = "ami-0e0d6e610ffe146fe"
    instance_type = "t3.micro"
    key_name = "first"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true
    
    }
# This block can be used to retrieve the admin password using the key pair
  
  
  
  data "aws_instance" "windows_instance" {
  instance_id = "i-0c06e0f3adb929356"  # Replace with your EC2 instance ID
}

  resource "null_resource" "upload_file" {
  depends_on = [data.aws_instance.windows_instance]

    
  

# Upload file
  provisioner "file" {
   source      = "D:/Terrafarm/Practice_Project/file.txt"  # Local file path
    destination = "C:/Windows/Temp/file.txt"  # EC2 destination path
  


     #Connect using WinRM
  connection {
    type     = "winrm"
     host     = data.aws_instance.windows_instance.public_ip
     user     = "Administrator"
      password ="WG)2E9*(LFFto2WBrOp-?D?$qoGg(v7Z"  # Avoid hardcoding passwords
      port     = 5986
   
     insecure    = true
  }
  }
  }
  

output "instance_id" {
  value = data.aws_instance.windows_instance.id
}


/*
output "windows_password" {
  value = aws_instance.windows_instance.password_data
}




/*
provisioner "remote-exec" {
  inline = [
    "Enable-PSRemoting -Force",
    "Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' -Name 'LocalAccountTokenFilterPolicy' -Value 1"
  ]
}
 # Disable the Windows Firewall using remote-exec
  provisioner "remote-exec" {
    inline = [
      # Disable the firewall for all profiles (Public, Private, Domain)
      "Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled False"
    ]
  }
  
   
  # Local-exec provisioner to run a command on your local machine
  provisioner "local-exec" {
    command = "echo 'File upload completed!'"
  }

 provisioner "remote-exec" {
    inline = [
      "if (Test-Path 'C:/Windows/Temp/file.txt') { Write-Output 'File exists!' } else { Write-Output 'File not found!' }"
    ]
  
  }*/
 

  

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
  