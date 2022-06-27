security-group-name = "dev-ws-sg"
# amiId               = "ami-0cff7528ff583bf9a" //ami-0cff7528ff583bf9a
region  = "us-east-2"
keyName = "vmkey.pem"
ports   = [22, 80, 443, 3306, 27017]
# ami-id=data.aws_ami.awsAmiData.id