resource "aws_key_pair" "bastion_key_pair" {
  key_name   = "bastion_key_pair"
  public_key = file("~/.ssh/id_rsa.pub") 
}

resource "aws_instance" "bastion" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet-2.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  key_name   = aws_key_pair.bastion_key_pair.key_name
  tags = {
    Name = "Bastion_instance"
  }
} 