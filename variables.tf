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
  description "Map of subnets"
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
  decription "Map of nat gateways"
  default = {}


}
   