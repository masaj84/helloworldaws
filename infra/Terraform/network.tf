resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.aws-vpc.id
  #cidr_block             = "172.31.100.0/24"
  cidr_block              = element(var.public_subnets, count.index)
  
  #only for FRANKFURT
  availability_zone       = element(var.availability_zones, count.index)
  
  count                   = length(var.public_subnets)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.app_name}-public-subnet-${count.index + 1}"
    Environment = var.app_environment
  }
}

resource "aws_network_interface" "network-interface" {
  subnet_id   = aws_subnet.public[0].id

  tags = {
    Name = var.aws_network_interface
  }
}

resource "aws_default_route_table" "route-table" {
  #vpc_id = aws_vpc.aws-vpc.id
  default_route_table_id = aws_vpc.aws-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "network-interface"
  }
}