data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "public" {
  
  filter {
    name = "vpc-id"
    values = [
      data.aws_vpc.default.id
    ]
  }
  
  filter {
    name = "map-public-ip-on-launch"
    values = [true]
  }
}
