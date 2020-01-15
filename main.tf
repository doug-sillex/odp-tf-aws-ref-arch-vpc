#Create the VPC

resource "aws_vpc" "main" {
  cidr_block       = "${var.default_cidr}"
  instance_tenancy = "dedicated"

  tags = {
    Name = "${var.vpc_name}"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
  }
}

# Setup the Internet Gateway

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "${var.vpc_name}"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"    
  }
}

# Configure Route Tables


resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"
  for_each = var.route_tables
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id =  each.value["gateway"] != "internet" ? aws_internet_gateway.main.id : aws_nat_gateway.nat_gw[each.value["gateway"]].id
  }

  tags = {
    Name = each.value["name"]
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"     
  }
}

# Route table to subnet associations

resource "aws_route_table_association" "main" {
  for_each = var.subnets
  subnet_id      = aws_subnet.main[each.key].id
  route_table_id = aws_route_table.main[each.value["route_table"]].id
}

# Configure Subnets

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  for_each = var.subnets
  cidr_block = each.value["cidr"]
  availability_zone = each.value["availability_zone"]
  tags = {
    Name = each.value["name"]
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
  }
}


# Configure NAT Gateways

resource "aws_eip" "nat_gw" {
  for_each = var.nat_gateways

  vpc      = true
  tags = {
    Name = each.value["name"]
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
  }  
}

resource "aws_nat_gateway" "nat_gw" {

  for_each = var.nat_gateways

  allocation_id = aws_eip.nat_gw[each.key].id
  #Assign the subnet ID based on the subnet assigned to the nat gateway.
  subnet_id     = aws_subnet.main[each.value["subnet"]].id

  tags = {
    Name = each.value["name"]
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
  }
}