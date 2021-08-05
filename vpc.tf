## VPC

resource "aws_vpc" "VPC" {
  cidr_block = var.cidr

  tags = {
    "Name" = var.name
  }
}

## SUBNET

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet)
  cidr_block = element(var.public_subnet,count.index)
  map_public_ip_on_launch = false
  vpc_id = aws_vpc.VPC.id
  availability_zone = element(var.azs,count.index)

  tags = {
    Name = "${var.name}-Pub-${count.index+1}"
  }
}

## IGW

resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    Name = var.name
  }
}

resource "aws_eip" "igw_eip" {
  count = length(var.public_subnet)
  vpc = true

  tags = {
    Name = var.name
  }
}

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = aws_vpc.VPC.id

  tags = {
    Name = var.sg_name
  }
}

resource "aws_security_group_rule" "inbound" {
  type              = var.type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = aws_security_group.sg.id
}

resource "aws_vpc_endpoint" "transfer" {
  vpc_id = aws_vpc.VPC.id
  service_name = var.service_name
}