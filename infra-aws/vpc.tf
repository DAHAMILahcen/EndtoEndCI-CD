resource "aws_vpc" "myvpc"{
    # Define  plage address ip ( praivate) for the vpc:
    cidr_block = var.cidr_block
    tags ={
        Name = "VPC-1"
        description = "the vpc will be used to deploy the resources"
    }
}