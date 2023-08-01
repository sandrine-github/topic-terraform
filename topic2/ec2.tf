resource "aws_instance" "server" {

  ami                         = "ami-0f9ce67dcf718d332"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ec2-key.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  user_data                   = file("jenkins.sh")
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  tags = {
    Name        = "jenkins-instance"
    Environment = "env"
  }
}