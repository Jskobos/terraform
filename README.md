# Terraform Configs

Terraform configs for spinning up and down Linode infrastructure

## Setup

Install Terraform:

`brew install terraform`

Create a file `terraform.tfvars`. Each variable declared in `variables.tf` should be defined here using the following syntax:

`access_token = "aasfgawe34teargaa..."`

The only variable that is required is your Linode API access token. The other values have defaults that will be used if you don't
specify, but this is the easiest way to customize the # of Linodes, Volumes, etc. that are produced.

## Usage

Before running for the first time, run:

`terraform init`

This should install the Linode provider and any other dependencies.

Check the plan:

`terraform plan`

Review the console output; if there are no errors and the displayed plan looks good, run:

`terraform apply`

To tear down your infrastructure, use:

`terraform destroy`

To update e.g. the number of Linodes deployed, alter the relevant variable (in this case `web_count`). Then run
`terraform apply` again; Terraform will bring your Linode account's state in line with the updated plan.
