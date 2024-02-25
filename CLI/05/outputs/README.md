# Outputs

### Query outputs
`terraform apply -var bucket_name="poos-bucket001"`

`terraform apply -var environment="development"`

`terraform apply -var environment="stage"`

`terraform apply -var environment="production"`

`terraform output`

`terraform output bucket_id`

`terraform output -raw bucket_id`

`terraform output -json`


### Attention

Use terraform output to query the database password by name, and notice that Terraform will not redact the value when you specify the output by name.

```
terraform output "secret_output"
"arn:aws:s3:::prod-piglets-bucket001"
```

**!!! The state file does not hide the secrets:**

`terraform show -json | jq ".values.outputs"`

```
...
  "environment": {
    "sensitive": false,
    "value": "prod",
    "type": "string"
  },
  "secret_output": {
    "sensitive": true,
    "value": "arn:aws:s3:::prod-piglets-bucket001",
    "type": "string"
  }
  ...
  ```

