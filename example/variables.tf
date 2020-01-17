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

variable "appenv" {
  type = string
  description = "Environment for deployment."
  default = "test"

}


variable "fisma_id" {
  type = string
  description = "FismaID resources are associated with."
  default = "XXXXX"
}

# CIDR blocks for subnets

variable "default_cidr" {
  type = string
  description = "Default subnet in CIDR notation."
  default = "10.0.0.0/16"
}

variable "private_1_a_cidr" {
  type = string
  description = "CIDR Block for Private subnet"
  default = "10.0.1.0/24"
}

variable "private_1_b_cidr" {
  type = string
  description = "CIDR Block for Private subnet"
  default = "10.0.2.0/24"
}

variable "private_2_a_cidr" {
  type = string
  description = "CIDR Block for Private subnet"
  default = "10.0.3.0/24"
}

variable "private_2_b_cidr" {
  type = string
  description = "CIDR Block for Private subnet"
  default = "10.0.4.0/24"
}

variable "public_1_a_cidr" {
  type = string
  description = "CIDR Block for Public subnet"
  default = "10.0.101.0/24"
}

variable "public_1_b_cidr" {
  type = string
  description = "CIDR Block for Public subnet"
  default = "10.0.102.0/24"
}
