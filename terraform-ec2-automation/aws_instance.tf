resource "aws_instance" "this" {
  ami                         = data.aws_ami.amazon_linux_2.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  user_data                   = data.local_file.user_data.content
  subnet_id                   = data.aws_subnets.public.ids[0]
  iam_instance_profile        = aws_iam_instance_profile.default.name
  key_name                    = aws_key_pair.default.key_name

  vpc_security_group_ids = [
    aws_security_group.default.id
  ]

  tags = {
    Name = "terraform-startup"
  }
}

data "local_file" "user_data" {
  filename = "${path.module}/resources/user_data_script.sh"
}
