resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_aula_iac_3.id

  tags = {
    Name = "igw_vpc_aula_iac_3"
  }
}