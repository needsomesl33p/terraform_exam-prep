# Migrate State to Terraform Cloud

This is a companion repository for the Hashicorp [Terraform Cloud workspace state migration](https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate) tutorial.

The repository contains configuration you can use to learn how to migrate your existing state file to a Terraform Cloud workspace.


###

We need to reinit the infra after the terraform was configured to use `cloud`.

`terraform init`

```
Initializing Terraform Cloud...
Do you wish to proceed?
  As part of migrating to Terraform Cloud, Terraform can optionally copy your
  current workspace state to the configured Terraform Cloud workspace.

  Answer "yes" to copy the latest state snapshot to the configured
  Terraform Cloud workspace.

  Answer "no" to ignore the existing state and just activate the configured
  Terraform Cloud workspace with its existing state, if any.

  Should Terraform migrate your existing state?

  Enter a value: yes


Initializing provider plugins...
- Reusing previous version of hashicorp/random from the dependency lock file
- Using previously-installed hashicorp/random v3.3.2

Terraform Cloud has been successfully initialized!
```

### Initiate a run in the new workspace

Adding a new var in the cloud/org/workspace: https://app.terraform.io/

`rm terraform.tfstate` -> it was not needed for me
`terraform apply`

`pet_name : "steadily-luckily-basically-social-javelin"`
