#
# Security group resources
#

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "main" {
  name = "${var.namespace}-${var.stage}-main"
  description = "permission internet, ssh"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
