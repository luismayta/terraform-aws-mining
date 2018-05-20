terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }
  terraform {
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
        "destroy",
        "push"
      ]
    }
  }
}
