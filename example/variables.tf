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
  default =  {}
}    

variable "nat_gateways" {
  description = "Map of nat gateways"
  default = {}
  }
}
   

variable "route_tables" {
  description = "Route tables"
  default = {}
}   