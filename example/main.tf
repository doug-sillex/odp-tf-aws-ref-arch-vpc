
provider "aws" {
  region     = var.aws_region
}



module "vpc" {
  source = "../"

  vpc_name = "${var.project_name}-${var.appenv}"
  default_cidr = "10.0.0.0/16"

  subnets = {
    private-1 = { 
      name =  "${var.project_name}-private-a1"
      cidr =  "10.0.1.0/24"
      availability_zone = "${var.aws_region}a"
      route_table = "route-table-a"
    },
    private-2 = { 
      name =  "${var.project_name}-private-a2"
      cidr =  "10.0.2.0/24"
      availability_zone = "${var.aws_region}a"
      route_table = "route-table-a"
    },
    private-3 = { 
      name =  "${var.project_name}-private-b1"
      cidr =  "10.0.3.0/24"
      availability_zone = "${var.aws_region}b"
      route_table = "route-table-b"
    },
    private-4 = { 
      name =  "${var.project_name}-private-b2"
      cidr =  "10.0.4.0/24"
      availability_zone = "${var.aws_region}b"
      gateway = "nat-${var.project_name}-${var.aws_region}b" 
      route_table = "route-table-b"
    },    
    public-1 = { 
      name =  "${var.project_name}-public-a"
      cidr =  "10.0.101.0/24"
      availability_zone = "${var.aws_region}a"
      route_table = "route-table-internet"
    },
    public-2 = { 
      name =  "${var.project_name}-public-b"
      cidr =  "10.0.102.0/24"
      availability_zone = "${var.aws_region}b"
      route_table = "route-table-internet"
    }
  }

  nat_gateways = {
    nat-gateway-a = { 
      name = "nat-${var.project_name}-${var.aws_region}a"
      subnet = "public-1"
    },
    nat-gateway-b = { 
      name = "nat-${var.project_name}-${var.aws_region}b"
      subnet = "public-2"
    }
  }

  route_tables = {
    route-table-a = {
      name = "${var.project_name}-${var.aws_region}a"
      gateway = "nat-gateway-a"
    }
    route-table-b = {
      name = "${var.project_name}-${var.aws_region}b"
      gateway = "nat-gateway-b"
    }    
    route-table-internet = {
      name = "${var.project_name}-internet"
      gateway = "internet"
    }        
  }




}

