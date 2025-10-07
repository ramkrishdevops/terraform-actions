# Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "${var.name_prefix}-key"
  public_key = var.public_key
}

# EC2 Instance
resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  tags = merge(var.tags, { Name = "${var.name_prefix}-ec2" })
}

