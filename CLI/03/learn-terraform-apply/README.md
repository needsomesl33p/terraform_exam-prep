# Apply Terraform Configuration

This repo is a companion repo to the [Apply Terraform Configuration tutorial](https://developer.hashicorp.com/terraform/tutorials/cli/apply).

### What happens when you issue the terraform apply command? (6 steps)

1. Lock your workspace's state. If Terraform detects an existing lock file (`.terraform.tfstate.lock.info`), it will report an error and exit.
2. Create a plan, and wait for you to approve it.
3. Execute the steps defined in the plan using the providers you installed when you initialized your configuration
4. Update your workspace's state with a snapshot of the new state of your resources.
5. Unlock your workspace's state.
6. Report the changes it made + outputs

### When Terraform encounters an error during an apply step, it will:

1. Log the error and report it to the console.
2. Update the state file with any changes to your resources.
3. Unlock the state file.
4. Exit.

### Common reasons for apply errors include:

- A change to a resource outside of Terraform's control.
- Networking or other transient errors.
- An expected error from the upstream API, such as a duplicate resource name or reaching a resource limit.
- An unexpected error from the upstream API, such as an internal server error.
- A bug in the Terraform provider code, or Terraform itself.

### What happens when you remove a resource outside of terraform? What would the terraform state file show? What happens when you try to apply again?

The next time you plan a change to this project, Terraform will update the current state of your resources from the underlying APIs using the providers you have installed. Terraform will notice that the bucket represented by the aws_s3_bucket.example resource no longer exists, and generate a plan to create it before creating the new aws_s3_object.example object.

### Replace Resources - Unhealthy EC2

```
terraform state list
terraform plan -replace "aws_s3_bucket.example"
terraform apply -replace "aws_s3_bucket.example"
terraform plan -target "aws_s3_bucket.example"
terraform apply -target "aws_s3_bucket.example"
```


