# Initialize a Terraform Working Directory

This is a companion repository to the ["Initialize a Terraform Working Directory"](https://developer.hashicorp.com/terraform/tutorials/cli/init) tutorial.

#### What does `terraform init` do?

1. Downloads the providers and modules
2. Creates a lock file 
3. Initializes backend configuration

#### What does `terraform get`? When do you use it?
`terraform init` vs `terraform get`?

`terraform get` downloads the new / defined version of the provider or module, but not initialize the backend.

#### What is the terraform lock file? Where can you find it?

Terraform's lock file, `.terraform.lock.hcl`, records the versions and hashes of the providers used in this run. This ensures consistent Terraform runs in different environments, since Terraform will download the versions recorded in the lock file for future runs by default.

#### What does `terraform validate` do?

Terraform can verify whether your configuration syntax is valid and internally consistent. This includes checking if your resources blocks have invalid or missing arguments. You must initialize your workspace before you can validate your configuration.


#### Does terraform have cache and invetory of providers and modules?

Yes. Terraform saves file `.terraform` folder. `Providers` and `modules` are in separated folders.

The `.terraform\modules\modules.json` file contains the required modules and their meta data.

#### Does the lock file influence the modules' version?

No. It influences the providers' version only.
Modules can be fetched and their version are maintained in different location:
```
.terraform
├── modules
│   ├── hello
│   │   ├── README.md
│   │   ├── providers.tf
│   │   └── random.tf
│   └── modules.json <----
└── providers
    └── registry.terraform.io
        └── hashicorp
            ├── aws
            │   └── 5.7.0
            │       └── darwin_arm64
            │           └── terraform-provider-aws_v5.7.0_x5
            └── random
                └── 3.1.0
                    └── darwin_arm64
                        └── terraform-provider-random_v3.1.0_x5

12 directories, 6 files
```

#### Why do you get the following message, when you update the provider version in the configuration?
```
Error: Failed to query available provider packages

or

Error: Module version requirements have changed
```

The .terrafrom.lock.hcl file has different records about the version numbers. During initialization, Terraform will download the provider versions specified by this file rather than the latest versions.
If the versions defined in the lock file's provider block do not match the versions defined in your configuration's required_providers block, Terraform will prompt you to re-initialize your configuration using the -upgrade flag. You will do this in the next section.