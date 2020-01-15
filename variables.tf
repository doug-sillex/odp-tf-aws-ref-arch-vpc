variable "aws_region" {
  type = string
  description = "Default region used by some modules"
  default = "us-east-1"
}

variable "project" {
  type = string
  description = "Project name"
  default = "vpc-example"
}


variable "appenv" {
  type = string
  description = "Environment for deployment."
  default = "test"

}

variable "default_cidr" {
  type = string
  description = "Default subnet in CIDR notation."
  default = "10.0.0.0/16"
}


variable "subnets" {
  type = map
  description = "Map of subnets"
  default =  {
    subnet1 = { 
      name =  "example-vpc-private-a1"
      cidr =  "10.0.1.0/24"
      availability_zone = "$us_east_1a"
    },
    subnet2 = { 
      name =  "example-vpc-private-a2"
      cidr =  "10.0.2.0/24"
      availability_zone = "us_east_1a"
    }
  }
}    

variable "nat_gateways" {
  type = map
  description = "Map of nat gateways"
  default = {
    nat-gateway-1 = { 
      name = "private-a"
      subnet = "example-vpc-private-a1"
    },
    nat-gateway-2 = { 
      name = "private-b"
      subnet = "example-vpc-private-a2"
    }
  }
}
   

variable "route_tables" {
  description = "Route tables"
  default = {
    route_table1 = {
      name = "private-a"
      gateway = "private-a" 
    }
    route_table2 = {
      name = "private-b"
      gateway = "private-b" 
    }
    route_table3 = {
      name = "public-a"
      gateway = "internet-default" 
    }
    route_table4 = {
      name = "public-b"
      gateway = "internet-default" 
    }    
  }
}   