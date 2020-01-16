#Create the VPC

resource "aws_vpc" "main" {
  cidr_block       = "${var.default_cidr}"
  instance_tenancy = "dedicated"

  tags = {
    Name = "${var.vpc_name}"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
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
    FismaID = "${var.fisma_id}"    
  }
}

# Configure Route Tables


## Route Tables for Nat Gateways

resource "aws_route_table" "nat_gw_a" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_a.id 
  }

  tags = {
    Name = "${var.project_name}-nat-gw-a"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"    
    FismaID = "${var.fisma_id}"     
  }
}

resource "aws_route_table" "nat_gw_b" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_b.id 
  }

  tags = {
    Name = "${var.project_name}-nat-gw-b"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"    
    FismaID = "${var.fisma_id}"     
  }
}

resource "aws_route_table" "internet_gw" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id 
  }

  tags = {
    Name = "${var.project_name}-internet-gw"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"    
    FismaID = "${var.fisma_id}"     
  }
}



# Route table to subnet associations

## Private Subnets

resource "aws_route_table_association" "private_1_a" {
  subnet_id      = aws_subnet.private_1_a.id
  route_table_id = aws_route_table.nat_gw_a.id
}

resource "aws_route_table_association" "private_1_b" {
  subnet_id      = aws_subnet.private_1_b.id
  route_table_id = aws_route_table.nat_gw_b.id
}

resource "aws_route_table_association" "private_2_a" {
  subnet_id      = aws_subnet.private_2_a.id
  route_table_id = aws_route_table.nat_gw_a.id
}

resource "aws_route_table_association" "private_2_b" {
  subnet_id      = aws_subnet.private_2_b.id
  route_table_id = aws_route_table.nat_gw_b.id
}

## Public Subnets

resource "aws_route_table_association" "public_1_a" {
  subnet_id      = aws_subnet.public_1_a.id
  route_table_id = aws_route_table.internet_gw.id
}

resource "aws_route_table_association" "public_1_b" {
  subnet_id      = aws_subnet.public_1_b.id
  route_table_id = aws_route_table.internet_gw.id
}


# Configure Subnets

## Private Subnets

resource "aws_subnet" "private_1_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "${var.project_name}-private-1-a"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
  }
}

resource "aws_subnet" "private_2_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "${var.project_name}-private-2-a"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
  }
}

resource "aws_subnet" "private_1_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "${var.project_name}-private-1-b"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
  }
}

resource "aws_subnet" "private_2_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "${var.project_name}-private-2-b"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
  }
}



## Public Subnets

resource "aws_subnet" "public_1_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.101.0/24"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "${var.project_name}-public-1-a"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
  }
}

resource "aws_subnet" "public_1_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.102.0/24"
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "${var.project_name}-public-1-b"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
  }
}

# Configure NAT Gateways

resource "aws_eip" "nat_gw_a" {
  vpc      = true
  tags = {
    Name = "${var.project_name}-nat-gw-a"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"
  }  
}

resource "aws_eip" "nat_gw_b" {
  vpc      = true
  tags = {
    Name = "${var.project_name}-nat-gw-b"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"
  }  
}

resource "aws_nat_gateway" "nat_gw_a" {

  allocation_id = aws_eip.nat_gw_a.id
  #Assign the subnet ID based on the subnet assigned to the nat gateway.
  subnet_id = aws_subnet.public_1_a.id
  tags = {
    Name = "${var.project_name}-nat-gw-a"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
  }
}


resource "aws_nat_gateway" "nat_gw_b" {

  allocation_id = aws_eip.nat_gw_b.id
  #Assign the subnet ID based on the subnet assigned to the nat gateway.
  subnet_id = aws_subnet.public_1_b.id

  tags = {
    Name = "${var.project_name}-nat-gw-b"
    Terraform = "true"
    Environment = "${var.appenv}"
    ProjectName = "${var.project_name}"
    FismaID = "${var.fisma_id}"    
  }
}