resource "aws_iam_instance_profile" "default" {
  name = "EC2SSMInstanceProfile"
  role = resource.aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name               = "EC2SSMInstanceProfileRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
        Sid = ""
      }
    ]
  })
}

data "aws_iam_policy" "ssm_managed_policy" {
  name = "AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = data.aws_iam_policy.ssm_managed_policy.arn
}
