output "system.public_ip" {
  description = "public ip server web"
  value       = "${aws_instance.system.public_ip}"
}

output "system.private_ip" {
  description = "private ip server web"
  value       = "${aws_instance.system.private_ip}"
}
