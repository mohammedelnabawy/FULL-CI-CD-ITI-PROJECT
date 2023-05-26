resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2" {
  key_name   = "bastion"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./../bastion.pem"
  }
}