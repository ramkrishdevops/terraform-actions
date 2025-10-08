# EC2 Instance
resource "aws_instance" "myec23" {
  ami                    = var.ec2_ami
  instance_type          = var.instance_type
 # vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  tags = merge(var.tags, { Name = "${var.name_prefix}-ec2" })

}

