resource "aws_instance" "master1" {
  ami                         = var.ami
  instance_type               = "t2.medium"
  key_name                    = "sivamware"
  subnet_id                   = aws_subnet.public-subnet1.id
  vpc_security_group_ids      = ["${aws_security_group.rke-sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "master1"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo curl https://get.docker.com | bash
      sudo usermod -a -G docker ubuntu
      sudo usermod -a -G root ubuntu
      sudo systemctl daemon-reload
      sudo systemctl restart docker
      sudo reboot
  EOF
  root_block_device {
    volume_size = var.volumeSize
    volume_type = var.volumeType
    delete_on_termination = var.deleteOnTermination
  }
}

resource "aws_instance" "master2" {
  ami                         = var.ami
  instance_type               = "t2.medium"
  key_name                    = "sivamware"
  subnet_id                   = aws_subnet.public-subnet2.id
  vpc_security_group_ids      = ["${aws_security_group.rke-sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "master2"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo curl https://get.docker.com | bash
      sudo usermod -a -G docker ubuntu
      sudo usermod -a -G root ubuntu
      sudo systemctl daemon-reload
      sudo systemctl restart docker
      sudo reboot
  EOF
  root_block_device {
    volume_size = var.volumeSize
    volume_type = var.volumeType
    delete_on_termination = var.deleteOnTermination
  }
}

resource "aws_instance" "master3" {
  ami                         = var.ami
  instance_type               = "t2.medium"
  key_name                    = "sivamware"
  subnet_id                   = aws_subnet.public-subnet3.id
  vpc_security_group_ids      = ["${aws_security_group.rke-sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "master3"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo curl https://get.docker.com | bash
      sudo usermod -a -G docker ubuntu
      sudo usermod -a -G root ubuntu
      sudo systemctl daemon-reload
      sudo systemctl restart docker
      sudo reboot
  EOF
  root_block_device {
    volume_size = var.volumeSize
    volume_type = var.volumeType
    delete_on_termination = var.deleteOnTermination
  }
}