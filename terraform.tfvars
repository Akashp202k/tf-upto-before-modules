security-group-name = "tf-sg-1"
# amiId               = "ami-0cff7528ff583bf9a" //ami-0cff7528ff583bf9a
region  = "us-east-1"
keyName = "vmkey.pem"
ports   = [22, 80, 443, 3306, 27017]
# ami-id=data.aws_ami.awsAmiData.id