# odp-tf-aws-ref-arch-vpc

The `odp-tf-aws-ref-arch-vpc` module is used to configure your projects VPC and related resources to ODP Reference Archictecture standards.

# ODP Terraform 

## Overview <a name="s1"></a>

The MODULE  module is used to configure X resources.

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
| project  |  string |   Project name to that makes up part of prefix for resources. |
|  |  string |    |
|   |  string |   Prefix where config exports are stored. |
|  |  string |    |


### Outputs

The following variables need to be set either by setting proper environment variables or editing the variables.tf file:

| Variable      |  Type  |  Description  |
|---          |---        |---  | 
|   |   |    |

## Module Setup <a name="s5"></a>


### Required IAM


### Example


```



```


## Resources Created <a name="s6"></a>

