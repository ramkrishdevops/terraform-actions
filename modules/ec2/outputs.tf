output "public_ip" {
  value = aws_instance.myec23.public_ip
}

output "instance_id" {
  value = aws_instance.myec23.id
}

