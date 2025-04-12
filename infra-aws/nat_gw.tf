# craete a nat gateway in public-subnet-1
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.allocate_ip.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "Nat Gateway"
  }
}
#### allocate an elastic ip address to nat_gatway ####
resource "aws_eip" "allocate_ip" {
  domain = "vpc"
}
