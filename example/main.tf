
provider "aws" {}


module "vpc" {
  source = "../../"

  vpc_name = "${var.project_name}-${var.appenv}"
  default_cidr = "10.0.0.0/16"

  subnets = {
    subnet-1 = { 
      name =  "${var.project_name}-private-a1"
      cidr =  "10.0.1.0/24"
      availability_zone = "${var.aws_region}a"
      route_table = "${var.project_name}-${var.aws_region}a"
    },
    subnet-2 = { 
      name =  "${var.project_name}-private-a2"
      cidr =  "10.0.2.0/24"
      availability_zone = "${var.aws_region}a"
      route_table = "${var.project_name}-${var.aws_region}a"
    },
    subnet-3 = { 
      name =  "${var.project_name}-private-b1"
      cidr =  "10.0.3.0/24/24"
      availability_zone = "${var.aws_region}b"
      route_table = ""
    },
    subnet-4 = { 
      name =  "${var.project_name}-private-b2"
      cidr =  "10.0.4.0/24"
      availability_zone = "${var.aws_region}b"
      gateway = "nat-${var.project_name}-${var.aws_region}b" 
      route_table = "${var.project_name}-${var.aws_region}b"
    },    
    subnet-5 = { 
      name =  "${var.project_name}-public-a"
      cidr =  "10.0.101.0/24"
      availability_zone = "${var.aws_region}a"
      route_table = ""
    },
    subnet-6 = { 
      name =  "${var.project_name}-public-b"
      cidr =  "10.0.102.0/24"
      availability_zone = "${var.aws_region}b"
      route_table = ""
    }
  }

  nat_gateways = {
    nat-gateway-1 = { 
      name = "nat-${var.project_name}-${var.aws_region}a"
      subnet = "${var.project_name}-public-a"
    },
    nat-gateway-2 = { 
      name = "nat-${var.project_name}-${var.aws_region}b"
      subnet = "${var.project_name}-public-b"
    }
  }

  route_tables = {
    route-table-1 = {
      name = "${var.project_name}-${var.aws_region}a"
      gateway = "nat-${var.project_name}-${var.aws_region}a"
    }
    route-table-2 = {
      name = "${var.project_name}-${var.aws_region}b"
      gateway = "nat-${var.project_name}-${var.aws_region}b"
    }    
  }


}

