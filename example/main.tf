
module "vpc" {
  source = "../../"

  vpc_name = "${var.project_name}-${var.appenv}"
  default_cidr = "10.0.0.0/16"

  subnets = {
    subnet1 = { 
      name =  "${var.project_name}-private-a1"
      cidr =  "10.0.1.0/24"
      availability_zone = "${var.aws_region}a"
    },
    subnet2 = { 
      name =  "${var.project_name}-private-a2"
      cidr =  "10.0.2.0/24"
      availability_zone = "${var.aws_region}a"
    },
    subnet2 = { 
      name =  "${var.project_name}-private-b1"
      cidr =  "10.0.3.0/24/24"
      availability_zone = "${var.aws_region}b"
    },
    subnet4 = { 
      name =  "${var.project_name}-private-b2"
      cidr =  "10.0.4.0/24"
      availability_zone = "${var.aws_region}b"
    },    
    subnet5 = { 
      name =  "${var.project_name}-public-a"
      cidr =  "10.0.101.0/24"
      availability_zone = "${var.aws_region}a"
    },
    subnet6 = { 
      name =  "${var.project_name}-public-b"
      cidr =  "10.0.102.0/24"
      availability_zone = "${var.aws_region}b"
    }
  }

  nat_gateways = {
    nate_gateway_1 = { 
      name = "${var.project_name}-public-a"
      subnet = "${var.project_name}-public-a"
    },
    nate_gateway_2 = { 
      name = "${var.project_name}-public-b"
      subnet = "${var.project_name}-public-b"
    }
  }

}

