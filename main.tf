provider "aws" {
  region = "us-east-2" # Ohio
}

# Security Group with required rules
resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Allow all TCP plus SSH, HTTP, HTTPS, MySQL, Postgres"

  # Allow all TCP
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH (22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP (80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS (443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow MySQL (3306)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow PostgreSQL (5432)
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-security-group"
  }
}

# EC2 instance with user_data from file
resource "aws_instance" "app_server" {
  ami                         = "ami-0d1b5a8c13042c939"
  instance_type               = "t2.micro"
  key_name                    = "78" # Replace with your key pair name
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  user_data                   = file("Automatic-Application-Deployment.sh")

  tags = {
    Name = "jenkins-terraform-server"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}

output "instance_id" {
  value = aws_instance.app_server.id
}
