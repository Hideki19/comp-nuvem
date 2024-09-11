resource "aws_vpc" "vpc_aula_iac_3" {
  cidr_block = "10.10.10.0/25"
  tags = {
    Name = "vpc_aula_iac_3"
  }
}