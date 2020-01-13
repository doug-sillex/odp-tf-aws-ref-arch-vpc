module "vpc" {
  source         = "../"
  aws_region        = "${var.aws_region}"
  project           = "${var.project}"  
}

