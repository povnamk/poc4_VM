resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.linuxebs.id
  instance_id = aws_instance.linuxtf.id
}

resource "aws_instance" "linuxtf" {
  ami               = var.ami_id
  availability_zone = var.availability_zone
  instance_type     = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  #User Data attribute - creata text file inside EC2 instance_
  user_data = file("${path.module}/volume.sh")
 /* user_data = <<-EOF
                     #!/bin/bash
                     echo "Hello, World!" >hello.text
                   EOF*/

  tags = {
    Name = "HelloWorld"
  }
}
#Creating Security group
resource "aws_security_group" "allow_tls" {
  name        = var.sgname
  description = "Allow TLS inbound traffic"
  

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    name = "allow_tls"
  }
}

#Creating aws_keypair
resource "aws_key_pair" "linuxkeypair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa4096.public_key_openssh
}
# RSA key of size 4096 bits
resource "tls_private_key" "rsa4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tflocal" {
  content  = tls_private_key.rsa4096.private_key_pem
  filename = "${path.module}/tfkey"
}
resource "aws_ebs_volume" "linuxebs" {
  availability_zone = var.availability_zone
  size              = var.size
}