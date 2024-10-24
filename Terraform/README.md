# Terraform Module to Set Up A VPC with 2 Availability Zones

This folder contains a Terraform module to set up a VPC with 2 Availability Zones, 2 Public Subnets, and 2 Private Subnets. Additionally, this module also includes the Internet Gateway, NAT GAteways, and Route Tables that enabling the VPC hosted instances to communicate with the internet and, if needed, to be reachable from the Internet.


## Requirements
* Terraform >= 1.9.0

## How to Run

``` bash

# Create the required terraform authentication-related variables
export TF_VAR_aws_access_key_id="<aws_access_key_id>"
export TF_VAR_aws_access_key_secret="<aws_access_key_secret>"
export TF_VAR_aws_session_token="<aws_session_token>"

# Initialize Terraform - This command will download all provider plugins and 
# initialize the various modules
terraform init

# Execute the `terraform plan` command to visualize the AWS resources that will 
# be created by the current Terraform script
terraform plan

# If you think the ouput of `terraform plan` is acceptable, you may now
# apply the terraform script to generate the resources
terraform apply

# To destroy all resources created you may run the follwoing command.
terraform destroy

# Besides this, you may also filter the modules that you want to apply/destroy.
# Example: terraform apply -target=module.Networking
# Additionally, if you do not want to be prompted to accept the script's 
# execution, you may use the -auto-approve flag
# Example: terraform apply -auto-approve
```