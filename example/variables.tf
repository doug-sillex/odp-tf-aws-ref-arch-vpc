variable "default_cidr" {
  type = string
  description = "Default subnet in CIDR notation."
  default = "10.0.0.0/16"
}

variable "subnets" {
  type = map
  description "Map of subnets"
  default =  {
}    

variable "nat_gateways" {
  type = map
  decription "Map of nat gateways"
  default = {}
}

