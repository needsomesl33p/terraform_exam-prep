# Learn Terraform State Management

This repo is a companion repo to the [Learn Terraform State Management](https://developer.hashicorp.com/terraform/tutorials/state/state-cli) tutorial.
It contains Terraform configuration you can use to learn how to create an AWS instance and security group, examine a state file, and then manipulate resources to observe how vital state is to your Terraform operations.

---
### Examine the state file

`mode: managed` = RESOURCE

`mode: data`    = DATA

Because your state file has a record of your dependencies, enforced by you with a depends_on attribute or by Terraform automatically, any changes to the dependencies will force a change to the dependent resource.

### Examine State with CLI

When Backend is not configured the state file is saved to the current working directory with the `.tfstate` extension.

`terraform show` - Show the current state or a saved plan

Run `terraform state list` to get the list of resource names and local identifiers in your state file.

### Replace a resource with CLI

terraform plan -replace="aws_instance.websrv"
terraform apply -replace="aws_instance.websrv"

### Move a resource to a different state file

Move the new EC2 instance resource you just created, aws_instance.example_new, to the old configuration's file

```
cd new_state

terraform state mv -state-out=../terraform.tfstate aws_instance.example_new aws_instance.example_new

terraform state list
```

Without adding the EC2 resource you moved to your configuration files, create a Terraform plan. Because the new EC2 instance is present in state but not in the configuration, Terraform plans to destroy the moved instance, and remove the resource from the state file.

```
data.aws_ami.ubuntu: Reading...
aws_security_group.sg_8080: Refreshing state... [id=sg-06d77d6d3398b9bb8]
aws_instance.websrv2: Refreshing state... [id=i-09aef21a35b2bf964]
data.aws_ami.ubuntu: Read complete after 1s [id=ami-061612d72693df8ce]
aws_instance.websrv: Refreshing state... [id=i-06a5c130677d90166]
```

To keep the resources we need to add the following terraform code to the configuration file:

```terraform
resource "aws_instance" "websrv2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_8080.id]
  user_data              = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              sed -i -e 's/80/8080/' /etc/apache2/ports.conf
              echo "Hello World" > /var/www/html/index.html
              systemctl restart apache2
              EOF
  tags = {
    Name = "terraform-learn-state-ec2"
  }
}
```

### Remove a resource from state

Use a `removed` block to remove specific resources from your state. This does not destroy the infrastructure itself, instead it indicates that your Terraform configuration will no longer manage the resource.

**The removed block was introduced in Terraform 1.7. Previous versions of Terraform used the terraform state rm command to remove resources from state. Ensure you are using the correct version of Terraform for this step.**

-> aws_instance.websrv was removed with the `removed` block

```
terraform state list              

data.aws_ami.ubuntu
aws_instance.websrv
aws_security_group.sg_8080`
```

**This tutorial uses terraform import to bring infrastructure under Terraform management. Terraform 1.5+ supports configuration-driven import, which lets you import multiple resources at once, review the import in your plan-and-apply workflow, and generate configuration for imported resources. Review the import tutorial to learn more.**

`terraform import aws_instance.websrc2 <INSTANCE_ID>`

### Refresh modified infrastructure

> [!NOTE]
> Terraform automatically performs a refresh during the `plan, apply, and destroy operations`. All of these commands will reconcile state by default, and have the potential to modify your state file.

The `terraform refresh` command updates the state file when physical resources change outside of the Terraform workflow. -> if you apply, etc this might be not needed