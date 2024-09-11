terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc-iac-atividade1" {
  cidr_block       = "10.0.0.0/23"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-iac-atividade1"
  }
}

resource "aws_subnet" "subnet-iac-atividade1-pub" {
  vpc_id                                      = aws_vpc.vpc-iac-atividade1.id
  cidr_block                                  = "10.0.0.0/24"
  map_public_ip_on_launch                     = true
  enable_resource_name_dns_a_record_on_launch = true

  tags = {
    Name = "subnet-iac-atividade1-pub"
  }
}

resource "aws_subnet" "subnet-iac-atividade1-pri" {
  vpc_id     = aws_vpc.vpc-iac-atividade1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-iac-atividade1-pri"
  }
}

resource "aws_internet_gateway" "igw-iac-aula03" {
  vpc_id = aws_vpc.vpc-iac-atividade1

  tags = {
    Name : "igw-iac-aula03"
  }
}

resource "aws_route_table" "rt-iac-aula03" {
  vpc_id = aws_vpc.vpc-iac-atividade1

  tags = {
    Name : "rt-iac-aula03"
  }
}

resource "aws_route" "route" {
  route_table_id = aws_route_table.rt-iac-aula03
  gateway_id     = aws_internet_gateway.igw-iac-aula03
  
}

resource "aws_route_table_association" "rt-subnet-pub" {
  route_table_id = aws_route_table.rt-iac-aula03
  subnet_id = aws_subnet.subnet-iac-atividade1-pub
}

resource "aws_route_table_association" "rt-subnet-pri" {
  route_table_id = aws_route_table.rt-iac-aula03
  subnet_id = aws_subnet.subnet-iac-atividade1-pri
}
