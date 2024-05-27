variable "ami" {
    description = "value"
    type = string
  
}

variable "main_cidr" {
    description = "value of first VPC CIDR"
    type = string
  
}

variable "second_cidr" {
    description = "value of second VPC CIDR"
    type = string
  
}

variable "peer_owner_id" {
    description = "aws account id for peering"
    type = string  
}

variable "vpc_1_subnet" {
    description = "value"
    type = string
  
}

variable "rt-1_cidr" {
    description = "rt-1 cidr"
    type = string
  
}

variable "vpc_2_subnet" {
    description = "value"
    type = string
  
}

variable "rt-2_cidr" {
    description = "rt-1 cidr"
    type = string
  
}