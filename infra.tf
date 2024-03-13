resource "aws_vpc" "rke" {
  cidr_block = var.cidr
  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "rke-igw" {
  vpc_id = aws_vpc.rke.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}

resource "aws_subnet" "public-subnet1" {
  vpc_id            = aws_vpc.rke.id
  cidr_block        = var.subnet1_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "Subnet-1-${var.vpc_name}"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id            = aws_vpc.rke.id
  cidr_block        = var.subnet2_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "Subnet-1-${var.vpc_name}"
  }
}

resource "aws_subnet" "public-subnet3" {
  vpc_id            = aws_vpc.rke.id
  cidr_block        = var.subnet3_cidr
  availability_zone = "us-east-1c"
  tags = {
    Name = "Subnet-3-${var.vpc_name}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.rke.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rke-igw.id
  }
}

resource "aws_route_table_association" "public1" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public-subnet1.id
}

resource "aws_route_table_association" "public2" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public-subnet2.id
}

resource "aws_route_table_association" "public3" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public-subnet3.id
}

resource "aws_security_group" "rke-sg" {
  name        = "Allow_All"
  description = "Allow All Traffic"
  vpc_id      = aws_vpc.rke.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}