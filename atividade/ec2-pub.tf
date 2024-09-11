resource "aws_instance" "ec2-iac-atividade1-pub" {
    ami = "ami-066784287e358dad1"
	instance_type = "t2.micro"
	tags = {
		Name: "ec2-iac-atividade1-pub"
	}

	subnet_id = aws_subnet.subnet-iac-atividade1-pub.id
}