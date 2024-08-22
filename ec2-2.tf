resource "aws_instance" "ec2-terraform2" {
	ami = "ami-066784287e358dad1"
	instance_type = "t2.micro"
	tags = {
		Name: "ec2-terraform2-separado"
	}

}