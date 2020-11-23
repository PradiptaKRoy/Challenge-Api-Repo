resource "tls_private_key" "centos8_private_key" {
 algorithm = "RSA"
 rsa_bits = 4096
}
resource "local_file" "private_key" {
 content = tls_private_key.centos8_private_key.private_key_pem
 filename = "centos8_key.pem"
 file_permission = 0400
}
resource "aws_key_pair" "centos8_key" {
 key_name = "centos8"
 public_key = tls_private_key.centos8_private_key.public_key_openssh
}
