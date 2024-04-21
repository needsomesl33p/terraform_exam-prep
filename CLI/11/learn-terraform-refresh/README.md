# Learn Terraform - Use Refresh-Only Plans and Applies

This is a companion repository for the [Use Refresh-Only Mode to Sync Terraform
State](https://developer.hashicorp.com/terraform/tutorials/state/refresh) tutorial. It contains Terraform
configuration files for you to use to learn how to safely refresh your Terraform state file.


### Run a refresh-only plan

`terraform plan -refresh-only`
`terraform apply -refresh-only`



### Review Terraform's refresh functionality

In previous versions of Terraform, the only way to refresh your state file was by using the terraform refresh subcommand. However, this was less safe than the -refresh-only plan and apply mode since it would automatically overwrite your state file without giving you the option to review the modifications first. In this case, that would mean automatically dropping all of your resources from your state file.

