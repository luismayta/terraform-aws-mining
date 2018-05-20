terragrunt = {
  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  remote_state = {
    backend = "s3"
    config {
      encrypt        = true
      bucket         = "mr-robot-terraform-state"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      region         = "sa-east-1"
      dynamodb_table = "mining-sa-east-1"
    }
  }
  terraform {
    # Force Terraform to keep trying to acquire a lock for up to 20 minutes if someone else already has the lock
    extra_arguments "retry_lock" {
      arguments = [
        "-lock-timeout=20m"
      ]
      commands = [
        "init",
        "apply",
        "refresh",
        "import",
        "plan",
        "taint",
        "untaint",
        "destroy"
      ]

    }
  }
}
