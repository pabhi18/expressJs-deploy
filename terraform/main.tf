resource "aws_security_group" "expressJs_sg" {
  name        = "expressJs-sg"
  description = "Allow traffic on ports 3000, 80, and 443"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "expressJs-sg"
  }
}

resource "aws_instance" "expressJs-app" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  key_name                    = var.key_pair
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.expressJs_sg.id]

  tags = {
    Name = "expressJs-app"
  }
}
