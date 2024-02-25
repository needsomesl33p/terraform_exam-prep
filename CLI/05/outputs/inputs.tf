variable "primary_region" {
  type    = string
  default = "eu-central-1"

  # Test validation condition: terraform plan -var primary_region="ap-south-2"

  validation {
    condition     = substr(var.primary_region, 0, 2) == "eu" || substr(var.primary_region, 0, 2) == "us"
    error_message = "Unsupported or invalid region"
  }

  # 1 variable could have multiple validations

  validation {
    condition     = length(regexall("(?:eu|us)-.+", var.primary_region)) > 0
    error_message = "Region is not complete. Add geographic orientation"
  }
}

variable "tags" {
  type = map(any)
  default = {
    org           = "DevOps",
    environment   = "dev01"
    major_version = 5
    owner         = "devops@piglet.com"
  }
}

variable "sse_algorithm" {
  type    = string
  default = "AES256"

}

variable "bucket_name" {
  type    = string
  default = "piglets-bucket001"
}

variable "prefixes" {
  type = map(string)
  default = {
    development = "dev"
    stage       = "ua"
    production  = "prod"
  }
  description = "returns the shorthand prefix of the given environment"
}

variable "environment" {
  type        = string
  description = "The target environment of the deployment process"
  default     = ""
}

#Redact sensitive inputs
variable "secret" {
  description = "API secret"
  default     = "API-123456"
  sensitive   = true
}


