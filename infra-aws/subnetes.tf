########   Public Subnets  ########
# Public Subnet 1
resource "aws_subnet" "public-subnet-1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block= var.subnets[2]
    availability_zone = var.availability_zone[0]
    tags ={
        Name = "public-subnet-1"
        
    }
    }
# Public Subnet 2
resource "aws_subnet" "public-subnet-2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block= var.subnets[3]
    availability_zone = var.availability_zone[1]
    tags ={
        Name = "public-subnet-2"
        
    }
    }
#### private subnets ####
# Private Subnet 1
resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block= var.subnets[0]
    availability_zone = var.availability_zone[0]
    tags ={
        Name = "private-subnet-1"
        
    }
    }
# Private Subnet 2
resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block= var.subnets[1]
    availability_zone = var.availability_zone[1]
    tags ={
        Name = "private-subnet-2"
        
    }
    }

