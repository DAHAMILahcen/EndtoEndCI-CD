variable "region" {
  type        = string
  default     = "us-east-1"
  description = " the region where resources will be deployed"
}
variable "cidr_block"{
    type = string
    default = "192.168.0.0/16"
}
variable  "availability_zone"{
    type = list(string)
    default = ["us-east-1a","us-east-1b"]
    description = "the availability zones are distributed in the region"
}
variable "subnets"{
    type = list( string)
    default = [ "192.168.1.0/24" ,"192.168.2.0/24","192.168.3.0/24","192.168.4.0/24" ]
    description=" the subnets will be used to deploy the resources"
}
variable "ami"{
    type = string
    default = "ami-084568db4383264d4"
    description = "the ami will be used to create the instances"
}