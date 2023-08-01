resource "aws_instance" "demo" {
  
  ami           = "ami-0f9ce67dcf718d332"
  count         = 1
  instance_type = var.instance_type
  tags = {
    Name = "test-serveur"
    terraform = true
    owner = "dev"
    env = "dev"
  }
}