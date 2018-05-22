# DO NOT COMMIT
variable "namespace" {
  default = "mining"
}

variable "stage" {
  default = "prod"
}

# AWS
variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "aws_instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "sa-east-1"
}

variable "amis" {
  type        = "map"
  description = "AMIs by region"
  default = {
    "us-west-2" = "ami-0def3275"
    "us-east-1" = "ami-43a15f3e" # ubuntu 16.04 LTS
    "sa-east-1" = "ami-423d772e"
  }
}

variable "availability_zone" {
  description = "The availability zone"
  default = "sa-east-1"
}

variable "aws_key_path" {
  default = "~/.ssh/mining-prod.pem"
}

variable "key_name" {
  default = "mining"
}

variable "availability_zone_ebs" {
  default = "sa-east-1"
}

variable "key_public" {
  default = ""
}

