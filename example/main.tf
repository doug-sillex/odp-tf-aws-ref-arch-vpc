
provider "aws" {
  region     = "${var.aws_region}"
}

module "vpc" {
  source = "../"
  project_name = "${var.project_name}"
  appenv = "${var.appenv}"
  vpc_name = "${var.project_name}-${var.appenv}"
  default_cidr = "10.0.0.0/16"
  fisma_id = "${var.fisma_id}"
  default_cidr = "${var.default_cidr}"
  private_1_a  = "${var.private_1_a}" 
  private_1_b  = "${var.private_1_b}" 
  private_2_a  = "${var.private_2_a}" 
  private_2_b  = "${var.private_2_b}" 
  public_1_a   = "${var.public_1_a}"  
  public_1_b   = "${var.public_1_b}"   
}

