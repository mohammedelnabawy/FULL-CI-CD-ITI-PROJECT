data "aws_secretsmanager_secret" "by-arn" {
  arn = var.SECRET_ARN
}

data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.by-arn.id
}

data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"]
    filter {
        name   = "name"
        values =  ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230325"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.EC2_TYPE
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ec2.id
  subnet_id                   = var.pub_sub_1_id
  vpc_security_group_ids      = [aws_security_group.public-sec.id]

  provisioner "local-exec" {
    command = "echo '${self.public_ip}' > ./../ansible/inventory"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.8.9.zip" -o "awscliv2.zip"
              sudo apt update
              sudo apt install unzip -y
              sudo apt install openjdk-11-jdk -y
              sudo unzip awscliv2.zip
              sudo ./aws/install
              sudo mkdir /home/ubuntu/.aws/
              sudo touch /home/ubuntu/.aws/credentials
              echo '${tls_private_key.pk.private_key_openssh}' > /home/ubuntu/bastion.pem
              chmod 0400 /home/ubuntu/bastion.pem
              curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.2/2023-03-17/bin/linux/amd64/kubectl
              chmod +x ./kubectl
              mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
              echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
              mkdir /home/ubuntu/.aws
              echo "[eks-creator]" >> /home/ubuntu/.aws/credentials
              echo "aws_access_key_id = ${jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["access_key"]}" >> /home/ubuntu/.aws/credentials
              echo "aws_secret_access_key = ${jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["secret_key"]}" >> /home/ubuntu/.aws/credentials
              aws eks update-kubeconfig --region us-east-1 --name eks-cluster --profile=eks-creator
              EOF

  tags = {
    Name = "bastion"
  }
}