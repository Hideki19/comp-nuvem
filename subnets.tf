resource "aws_subnet" "subrede_publica" {
  vpc_id            = aws_vpc.vpc_aula_iac_3.id
  cidr_block        = "10.10.10.0/26"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subrede_publica"
  }

  // determina se as instâncias executadas na VPC recebem nomes de host DNS públicos que correspondem a seus endereços IPpúblicos.
  enable_resource_name_dns_a_record_on_launch = true

  // Determina que uma EC2 criada nessa sub-rede recebe automaticamente um endereço IPv4 público
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subrede_privada" {
  vpc_id            = aws_vpc.vpc_aula_iac_3.id
  cidr_block        = "10.10.10.64/26"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subrede_privada"
  }
}