resource "aws_security_group" "template_sg" {
  vpc_id = aws_vpc.myvpc.id
  name   = "template_sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  # Limiter l'accès HTTP (port 80) à partir de n'importe où
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block]
  }
    ingress {
    from_port        =  22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${aws_instance.bastion.private_ip}/32"]
  }
}
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.myvpc.id
  name   = "bastion_sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  # Limiter l'accès SSH (port 20) à partir de n'importe où
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}