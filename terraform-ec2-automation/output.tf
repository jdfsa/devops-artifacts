output "instance_ip_address" {
  value = aws_instance.this.public_ip
}
