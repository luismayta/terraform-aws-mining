#
# Terraform required version
#
terraform {
  required_version = ">= 0.10.0"
  backend "s3" {}
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
  version = ">=1.2.0"
}

provider "template" {
  version = ">=1.0.0"
}

provider "null" {
  version = ">=0.1.0"
}
