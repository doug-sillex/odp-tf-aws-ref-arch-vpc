# odp-tf-aws-ref-arch-vpc



# ODP Terraform 

## Overview <a name="s1"></a>

The `odp-tf-aws-ref-arch-vpc` module is used to configure your projects VPC and related resources to ODP Reference Archictecture standards.


## Table of Contents <a name="s2"></a>

* [Overview](#s1)
* [Table of Conents](#s2)
* [Module Contents](#s3)
* [Module Variables](#s4)
* [Module Setup](#s5)
* [Resources Created](#s6)


## Module Contents <a name="s3"></a>

| Folder / File      |  Description  |
|---          |---    |
| main.tf   |   Main Terraform code |
| variables.tf   |   Required Variables |
| output.tf   |   Output variables |
| example/      |  Example directory that contains the configuration necessary to deploy the project. |
| .circleci   | CI Pipeline code for validating module.  Requires working example in `example` directory. |

## Module Variables  <a name="s4"></a>


### Inputs

The following variables need to be set either by setting proper environment variables or editing the variables.tf file:

| Variable      |  Type  |  Description  |
|---          |---        |---  | 
| project_name  |  string |   Project name to that makes up part of prefix for resources. ||  
|vpc_name   |  string |  Name of the VPC you are deploying  |  
|fisma_id  |  string |  FISMA ID to tag resources with  |
|default_cidr  |  string |  Default IP range for the VPC  |
|private_1_a  |  string | Default IP range for the Private 1 Subnet in AZ a   |
|private_1_b  |  string | Default IP range for the Private 1 Subnet in AZ b      |
|private_2_a  |  string | Default IP range for the Private 2 Subnet in AZ a      |
|private_2_b  |  string | Default IP range for the Private 2 Subnet in AZ b      |
|public_1_a  |  string | Default IP range for the Public Subnet in AZ a      |
|public_1_b  |  string | Default IP range for the Public Subnet in AZ a     |




### Outputs

The following variables need to be set either by setting proper environment variables or editing the variables.tf file:

| Variable      |  Type  |  Description  |
|---          |---        |---  | 
|  aws_vpc_id |  string |  ID of the VPC created  |
private_1_a_id |  string | ID of the Private Subnet 1 in AZ a   |
private_2_a_id |  string | ID of the Private Subnet 2 in AZ a       |
private_1_b_id |  string | ID of the Private Subnet 1 in AZ b       |
private_2_b_id |  string | ID of the Private Subnet 2 in AZ b       |
public_1_a_id |  string | ID of the Public Subnet in AZ a      |
public_1_b_id |  string | ID of the Public Subnet in AZ b       |

## Module Setup <a name="s5"></a>




### Example


```
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
```


## Resources Created <a name="s6"></a>

*** Note: All resources will be named with a prefix of the value of the `project_name` variable to make it easier to find resources deployed using this module. ***

VPC
* Route Tables 
* Nat Gateways
  * 1 Nat Gateway in Public Subnet in AZ a of desired region
    * 1 Elastic IP
  * 1 Nat Gateway in Public Subnet in AZ b of desired region
    * 1 Elastic IP  
* Internet Gateway
* 2 Private Subnets in AZ a of desired region
  * Route table with gateway of Nat Gateway in AZ a of desired region
* 2 Private Subntes in AZ b of desired region
  * Route table with gateway of Nat Gateway in AZ a of desired region
* 1 Public Subnet in AZ a of desired region
  * Route table with gateway of Internet Gateway
* 1 Public Subnet in AZ b of desired region
  * Route table with gateway of Internet Gateway