resource "tls_private_key" "ec2-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2-key" {
  key_name   = "jenkins-key" # Create a "myKey" to AWS!!
  public_key = tls_private_key.ec2-key.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename = "jenkins.pem"
  content  = tls_private_key.ec2-key.private_key_pem
}