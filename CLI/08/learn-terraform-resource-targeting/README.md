# Learn Terraform Resource Targeting

This repo is a companion repo to the [Terraform Resource Targeting tutorial](https://developer.hashicorp.com/terraform/tutorials/state/resource-targeting).

It contains Terraform configuration you can use to learn how to implement an S3 bucket and bucket objects with Terraform resource targeting.

### Target the S3 bucket name

Resource targeting updates resources that the target depends on, but not resources that depend on it:


```
terraform state list
terraform plan -target="random_pet.bucket_name"
terraform plan -target="module.s3_bucket"
terraform apply -target="random_pet.bucket_name"
terraform apply
```

### Target specific bucket objects

`terraform apply -target="aws_s3_object.objects[2]" -target="aws_s3_object.objects[3]"`
`terraform apply -target="aws_s3_object.objects[2]"`

Notice that Terraform updated all five of the random_pet.object_name resources, not just the name of the object you targeted. Both random_pet.object_name and aws_s3_object.object use count to provision multiple resources, and each bucket object refers to the name of the same index. However, because the entire aws_s3_bucket_objects.objects resource depends on the entire random_pet.object_names resource, Terraform updated all the names.