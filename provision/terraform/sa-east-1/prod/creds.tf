#
# AWS Key pair
#
resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}-${var.stage}"
  public_key = "${var.key_public}"

  lifecycle {
    create_before_destroy = true
  }
}
