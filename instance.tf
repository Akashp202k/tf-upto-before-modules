provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

# variable "access_key" {
#   type = string
# }

# variable "security_key" {
#   type = string
# }

resource "aws_instance" "tf-ec2-1" {
  # ami             = var.amiId
  ami             = data.aws_ami.awsAmiData.id // in this way we can get updated ami id directly from aws 
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.tf-sg-1-L.name}"] ## because security group can be multiple its type is list
  key_name        = "vmkey"

  tags = {
    Name = "${var.tag-1}"
  }
  // <<-EOF works with identation also but <<EOF should not contain identation
  #   user_data = <<-EOF
  #   #!/bin/bash
  #   # Use this for your user data (script from top to bottom)
  #   # install httpd (Linux 2 version)
  #   sudo yum update -y
  #   sudo yum install -y httpd
  #   sudo systemctl start httpd
  #   sudo systemctl enable httpd
  #   sudo echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  # EOF


  # trying other way to read script data from making script.sh file using file() function

  user_data = file("${path.module}/script.sh")

  connection { # this connection apply to all provisioners
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/vmkey.pem")
    host        = self.public_ip
  }

  # file ,local-exec,remote-exec
  # provisioner "file" {
  #   source      = "readME.txt"      // local-machine
  #   destination = "/tmp/readME.txt" // remote-machine
  #   # connection will apply directly declared above to all provisioners if we want can assigne different 
  #   # connections to individual we can assign here also

  # }

  # provisioner "file" {
  #   content     = "this content.txt is created using content in terraform "
  #   destination = "/tmp/content.txt"

  # }

  # provisioner "local-exec" {
  #   command = "echo ${self.public_ip} > /tmp/mypublicip.txt "
  # }

  # provisioner "local-exec" {
  #   working_dir = "/tmp/"
  #   command="echo ${self.public_ip} > myPublicIpWithWorkingDir.txt "
  # }


  # provisioner "local-exec" {
  #   interpreter=[
  #     "/usr/bin/python","-c"
  #   ]

  #   command = "print('hello from ec2-instance')"
  # }

  # provisioner "local-exec" {

  #   command="ssh -i vmkey.pem ec2-user@${self.public_ip} && yes"
  # }
  # provisioner "local-exec" {

  #   command="yes"
  # }


  // local-exec with environment
  provisioner "local-exec" {

    command = "echo $Instance_Ip > env_vars.txt"
    environment = {
      Topic       = "Info about instance attributes"
      Instance_Ip = "${self.public_ip}"
    }
  }

  # # tryout to open vs code on local machine
  # provisioner "local-exec" {
  #     command = "code ."
  # }

  provisioner "local-exec" {


    command = "echo Executed at Creation time"

  }

  // local-exec "when" to decide when to execute the provisioner 
  provisioner "local-exec" {

    when    = destroy
    command = "echo Executed at destroy time"

  }


  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo yum update -y",
  #     "sudo yum install -y httpd",
  #     "sudo systemctl start httpd",
  #     "sudo systemctl enable httpd",


  #   ]
  # }

  #  provisioner "remote-exec" {
  #   script="./testscript.sh"
  # }

  # provisioner "remote-exec" {
  #   script="./script.sh"
  # }
}

