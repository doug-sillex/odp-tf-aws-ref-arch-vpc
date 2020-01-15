variable "aws_region" {
  type = string
  description = "Default region used by some modules"
  default = "us-east-1"
}

variable "project_name" {
  type = string
  description = "Project name"
  default = "vpc-example"
}

variable "vpc_name" {
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
}    

variable "nat_gateways" {
  type = map
  description = "Map of nat gateways"
}
   

variable "route_tables" {
  type = map
  description = "Route tables"
}   