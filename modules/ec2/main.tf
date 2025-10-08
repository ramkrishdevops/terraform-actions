# EC2 Instance
resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  tags = merge(var.tags, { Name = "${var.name_prefix}-ec2" })
}

