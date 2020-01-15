provider "aws" {
  region     = var.aws_region
}

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

## Default route table

resource "aws_route_table" "default" {
  vpc_id = "${aws_vpc.main.id}"
  for_each = var.subnets
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = {
    Name = each.value["name"]
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"     
  }
}

resource "aws_route_table" "routes" {
  vpc_id = "${aws_vpc.main.id}"
  for_each = var.subnets
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = each.value["gateway"]
  }

  tags = {
    Name = each.value["name"]
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"     
  }
}

# Route table to subnet associations

## MISSING :)

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
  subnet_id     = each.subnet

  tags = {
    Name = each.value["name"]
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
  }
}