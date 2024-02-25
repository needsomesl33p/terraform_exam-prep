# Learn Terraform Provider Versioning

This repo is a companion repo to the [Lock and Upgrade Provider Versions tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/provider-versioning), containing Terraform configuration files to provision a S3 bucket.


### Lock and upgrade provider versions

When multiple users or automation tools run the same Terraform configuration, they should all use the same versions of their required providers. There are two ways for you to manage provider versions in your configuration.

1. Specify provider version constraints in your configuration's terraform block.
2. Use the dependency lock file


If you do not scope provider version appropriately, Terraform will download the latest provider version that fulfills the version constraint. This may lead to unexpected infrastructure changes.

### Review configuration

This directory is a pre-initialized Terraform project with three files: main.tf, terraform.tf, and `.terraform.lock.hcl`. HashiCorp has released a newer version of the AWS provider since this workspace was first initialized.

```
terraform init 

- Installing hashicorp/aws v5.25.0...
- Installed hashicorp/aws v5.25.0 (signed by HashiCorp)
- Installing hashicorp/random v3.1.0...
- Installed hashicorp/random v3.1.0 (signed by HashiCorp)
```

__You should include the lock file in your version control repository to ensure that Terraform uses the same provider versions across your team and in ephemeral remote execution environments.__

### What happens if you don't have lock file?

If Terraform did not find a lock file, it would download the latest versions of the providers that fulfill the version constraints you defined in the `required_providers` block.

### What does terraform init -upgrade do?

The -upgrade flag will upgrade all providers to the latest version consistent within the version constraints specified in your configuration.
Notice that Terraform installs the latest version of the AWS provider.

```
- Finding hashicorp/random versions matching "3.1.0"...
- Finding hashicorp/aws versions matching ">= 4.5.0"...
- Using previously-installed hashicorp/random v3.1.0
- Installing hashicorp/aws v5.38.0...
- Installed hashicorp/aws v5.38.0 (signed by HashiCorp)
```

`cat .terraform.lock.hcl`

```
provider "registry.terraform.io/hashicorp/aws" {
  version     = "5.38.0"
  constraints = ">= 4.5.0"
```

Provider install results:
```
      #version = ">= 4.5.0" => 5.38
      #version = "~> 5.0.0" => 5.0.1 rightmost!
      #version = "~> 5.5.0" => 5.5.0
      #version = "~> 5.0" => 5.38
      #version = ">= 5.0.0, <= 5.30" => 5.30
```
