
# aws instance
#

resource "aws_instance" "system" {
  ami           = "${lookup(var.amis, var.aws_region)}"
  instance_type = "${var.aws_instance_type}"
  key_name      = "${aws_key_pair.auth.key_name}"
  security_groups = [
    "${aws_security_group.main.name}",
  ]

  tags {
    Name        = "system-${var.namespace}-${var.stage}"
    Environment = "${var.stage}"
  }

  connection {
    # The default username for our AMI
    user        = "ubuntu"
    private_key = "${file("${var.aws_key_path}")}"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} ${self.private_ip} > file.txt"
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = "30"
    delete_on_termination = "true"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get install -y python vim git-core",
      "touch ~/provisioned",            # Troll
    ]
  }
}
