## Learn Terraform - The Console Command

The Terraform console provides an interpreter that you can use to evaluate
Terraform expressions and explore your Terraform project's state.

Follow along with this Hashicorp [tutorial](https://developer.hashicorp.com/terraform/tutorials/cli/console).

### Explore Terraform state

> [!IMPORTANT] 
> Terraform's console loads your project's state and allows you to interactively evaluate Terraform expressions before using them in your configuration. Launch the console now.

`terraform console`
`> aws_s3_bucket.data`

`jsonencode({ arn = aws_s3_bucket.data.arn, id = aws_s3_bucket.data.id, region = aws_s3_bucket.data.region })`

`echo 'jsondecode(file("bucket_policy.json"))' | terraform console`
