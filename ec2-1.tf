resource "aws_instance" "ec2-terraform1" {
	ami = "ami-066784287e358dad1"
	instance_type = "t2.small"
	tags = {
		Name: "ec2-terraform1-separado"
	}

}