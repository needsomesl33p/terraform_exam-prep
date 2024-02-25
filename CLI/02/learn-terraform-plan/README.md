# Create a Terraform Plan

This repo is a companion repo to the [Create a Terraform Plan](https://developer.hashicorp.com/terraform/tutorials/cli/plan) tutorial.
It contains Terraform configuration you can use to learn how Terraform generates an execution plan.

## Further commands

### Create a plan
```
terraform plan
terraform plan -out "tfplan"
terraform show tfplan
terraform show -json tfplan | jq
terraform show -json "tfplan" >  tfplan.json
jq '.configuration.provider_config' tfplan.json
jq '.configuration.root_module.resources' tfplan.json
jq '.configuration.root_module.module_calls' tfplan.json
jq '.configuration.root_module.module_calls.hello.expressions.hellos.references' tfplan.json
jq '.resource_changes[] | select( .address == "module.ec2-instance.aws_instance.main")' tfplan.json
```

### Review the plan

```
jq '.planned_values' tfplan.json

```

### Apply a saved plan

```terraform apply tfplan```

### Modify Configuration

What can you store in ```terraform.tfvars``` file? Is it recommended to push .tfvar file to VCS?

### Create & Review a new plan

```
terraform plan -out "tfplan-input-var"
terraform show -json tfplan-input-var | jq > tfplan-input-var.json
jq '.prior_state' tfplan-input-var.json
jq '.resource_changes[] | select( .address == "module.hello.random_pet.server")' tfplan-input-var.json
```

### Clean up infrastructure

```
terraform plan -destroy -out "tfplan-destroy"
terraform apply "tfplan-destroy"
```

The `terraform destroy` command is a shortcut that creates a destroy plan and then waits for you to approve it. Saving a destroy plan allows you to review it before applying, just like a regular saved plan.