data "aws_ami" "awsAmiData" {
  most_recent = true

  owners = ["137112412989"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220606.1-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

output "AMI_ID" {
  value = data.aws_ami.awsAmiData.id
}

# variable "ami-id" {
#   type=string
# }