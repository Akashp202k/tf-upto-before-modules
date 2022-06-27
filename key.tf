# resource "aws_key_pair" "vmUser-key" {
#   key_name   = var.keyName
#   public_key = file("${path.module}/id_rsa.pub")
# }
