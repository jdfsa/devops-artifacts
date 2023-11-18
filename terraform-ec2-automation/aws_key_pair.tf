resource "aws_key_pair" "default" {
    key_name = "EC2DefaultKeyPair"
    public_key = tls_private_key.this.public_key_openssh
}

resource "tls_private_key" "this" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "local_file" "this" {
  filename = "${aws_key_pair.default.key_name}.pem"
  content = tls_private_key.this.private_key_pem
}
