resource "aws_instance" "ec2-terraform1" {
	ami = "ami-066784287e358dad1"
	instance_type = "t2.small"

    # Volume de armazenamento
    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 40
        volume_type = "gp3"
    }
    
    tags = {
		Name: "ec2-terraform1-separado"
	}

}
