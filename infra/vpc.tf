resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags {
    Name = "main"
  }
}

resource "aws_internet_gateway" "vpc-internet-gateway-1a" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "vpc-internet-gateway-1a"
  }
}

resource "aws_subnet" "vpc-public-1a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "public-1a"
  }
}

resource "aws_subnet" "vpc-private-1a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.10.0/24"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "private-1a"
  }
}

resource "aws_subnet" "vpc-private-1b" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.20.0/24"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "private-1b"
  }
}

resource "aws_route_table" "vpc-public-route-table" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc-internet-gateway-1a.id}"
  }

  tags {
    Name = "vpc-route-table"
  }
}

resource "aws_route_table_association" "vpc-route-table-association-1a" {
  subnet_id      = "${aws_subnet.vpc-public-1a.id}"
  route_table_id = "${aws_route_table.vpc-public-route-table.id}"
}
