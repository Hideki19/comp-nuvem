resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_aula_iac_3.id

  tags = {
    Name = "rt_vpc_aula_iac_3"
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.rt.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "rt_subrede_publica" {
  subnet_id      = aws_subnet.subrede_publica.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rt_subrede_privada" {
  subnet_id      = aws_subnet.subrede_privada.id
  route_table_id = aws_route_table.rt.id
}
