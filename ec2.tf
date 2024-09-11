resource "aws_instance" "ec2-iac-aula3" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2-iac-aula3-publica"
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 30
    volume_type = "gp3"
  }

  key_name = "aula_iac"

  subnet_id = aws_subnet.subrede_publica.id

  vpc_security_group_ids = [aws_security_group.sg_publica.id]

}

resource "aws_instance" "ec2-iac-aula2-2" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2-iac-aula3-privada"
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 30
    volume_type = "gp3"
  }

  key_name = "aula_iac"

  subnet_id = aws_subnet.subrede_privada.id

  vpc_security_group_ids = [aws_security_group.sg_privada.id]

}