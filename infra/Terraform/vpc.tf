resource "aws_vpc" "aws-vpc" {
  #cidr_block           = "172.31.0.0/16"
  cidr_block           = "${var.vpc_cidr_block}"
  #id = "vpc-0fead40e24304ce5f"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "${var.app_name}-vpc"
    Environment = var.app_environment
  }
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_default_security_group" "security-group" {
    vpc_id = "${aws_vpc.aws-vpc.id}"
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
    // Terraform removes the default rule
    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}