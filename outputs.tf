output "SG-name" {
  value = aws_security_group.tf-sg-1-L.name
}

output "security-group-id" {
  value = aws_security_group.tf-sg-1-L.id
}

output "instance-id" {
  value = aws_instance.tf-ec2-1.id
}

output "instance-public-ip" {
  value = aws_instance.tf-ec2-1.public_ip
}

output "key-pair-name" {
  value = var.keyName
}

output "public-dns" {
  value = aws_instance.tf-ec2-1.public_dns
}