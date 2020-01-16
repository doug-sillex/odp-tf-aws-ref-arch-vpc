
provider "aws" {
  region     = var.aws_region
}

module "vpc" {
  source = "../"
  project_name = "${var.project_name}"
  appenv = "${var.appenv}"
  vpc_name = "${var.project_name}-${var.appenv}"
  default_cidr = "10.0.0.0/16"
  fisma_id = "${var.fisma_id}"

}

