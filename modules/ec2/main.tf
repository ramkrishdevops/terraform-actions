# VPC
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(var.tags, { Name = "${var.name_prefix}-vpc" })
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone
  tags = merge(var.tags, { Name = "${var.name_prefix}-public-subnet" })
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "${var.name_prefix}-igw" })
}

# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = merge(var.tags, { Name = "${var.name_prefix}-public-rt" })
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group
resource "aws_security_group" "instance_sg" {
  name        = "${var.name_prefix}-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.this.id
  tags = merge(var.tags, { Name = "${var.name_prefix}-sg" })

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidrs
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Key pair (expects a public key provided)
resource "aws_key_pair" "deployer" {
  key_name   = "${var.name_prefix}-key"
  public_key = var.public_key
}

# EC2 instance
resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  tags = merge(var.tags, { Name = "${var.name_prefix}-ec2" })
}

