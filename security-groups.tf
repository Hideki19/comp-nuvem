resource "aws_security_group" "sg_publica" {
  name   = "sg_aula_iac_rede_publica"
  vpc_id = aws_vpc.vpc_aula_iac_3.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.porta_http
    to_port     = var.porta_http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.porta_http
    to_port     = var.porta_http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.porta_https
    to_port     = var.porta_https
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.porta_https
    to_port     = var.porta_https
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_privada" {
  name   = "sg_aula_iac_rede_privada"
  vpc_id = aws_vpc.vpc_aula_iac_3.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}