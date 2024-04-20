# Import Terraform configuration

In this tutorial, you will create a Docker container with the Docker CLI. Then, you will declare an import block for the existing Docker container,

### Create a Docker container

`docker run --name hashicorp-learn --detach --publish "0.0.0.0:8080:80" nginx:latest` 

`docker context ls`

`colima start`

### Generate configuration

```
import {
  id = "FULL_CONTAINER_ID"
  to = docker_container.web
}
```

`terraform plan -generate-config-out=generated.tf`

This needs to the container id:

`docker inspect --format="{{.ID}}" hashicorp-learn`

> Notice that Terraform plans to replace the container after import due to the default value of the env parameter returned by the provider.

### Create image resource

Get the name of the `docker_image` resource:

`docker image inspect -f {{.RepoTags}} $(docker inspect --format="{{.Image}}" hashicorp-learn)`

> [!CAUTION]
> Do not replace the image value in the docker_container.web resource yet, or Terraform will destroy and recreate your container. Since Terraform did not yet load the docker_image.nginx resource into state, it does not have an image ID to compare with the hardcoded one, which will force replacement. The image resource must exist in state before you can reference it.

Replace:

`image             = "sha256:a6ac09e4d8a90af2fac86bcd7508777bee5261c602b5ad90b5869925a021ad12"`
to:
`image             = docker_image.nginx.image_id`