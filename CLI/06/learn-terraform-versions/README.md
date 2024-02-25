## Learn Terraform Versions

Learn how to manage different Terraform versions as part of a team.

Follow along with the tutorials for [Terraform Open Source](https://developer.hashicorp.com/terraform/tutorials/configuration-language/versions) or [Terraform Cloud](https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-versions).

### Review example configuration

HashiCorp uses the format `major.minor.patch` for Terraform versions.

Upgrading your Terraform version can have other consequences, such as requiring you to update your provider versions. Some version updates may refresh your state file version or require configuration file edits to implement new features. Use the required_version setting to control which versions of Terraform will work with your configurations to ensure that updates to your infrastructure are safe and predictable.

Get version:

`terraform version`

_Terraform v1.7.4_<br>
_on darwin_arm64_

### Inspect the Terraform state file

`grep -e '"version"' -e '"terraform_version"' terraform.tfstate`

1. State file version format
2. terraform version format

### When does terraform update the terraform version in the state file?

Terraform will update the `terraform_version` whenever you apply a change to your configuration using a newer Terraform version

Terraform will only update the state file `version` when a new version of Terraform requires a change to the state file's format

### What happens if you would like to apply with an older terraform version, which does not support state version?

In general, Terraform will continue to work with a given state file across minor version updates. For major or minor releases, Terraform will update the state file version if required, and give an error if you attempt to run an older version of Terraform using an unsupported state file version.

Once you use a newer version of Terraform's state file format on a given project, there is no supported way to revert to using an older state file version.

### Terraform version constraints

https://developer.hashicorp.com/terraform/language/expressions/version-constraints

