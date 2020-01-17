
provider "aws" {
  region     = "${var.aws_region}"
}

module "vpc" {
  source = "../"
  project_name = "${var.project_name}"
  appenv = "${var.appenv}"
  vpc_name = "${var.project_name}-${var.appenv}"
  fisma_id = "${var.fisma_id}"
  default_cidr = "${var.default_cidr}"
  private_1_a_cidr  = "${var.private_1_a_cidr}" 
  private_1_b_cidr  = "${var.private_1_b_cidr}" 
  private_2_a_cidr  = "${var.private_2_a_cidr}" 
  private_2_b_cidr  = "${var.private_2_b_cidr}" 
  public_1_a_cidr   = "${var.public_1_a_cidr}"  
  public_1_b_cidr   = "${var.public_1_b_cidr}"   
}

