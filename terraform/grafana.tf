resource "vsphere_vm" "grafana_vsphere_instance" {

  template_name = "packer-base-vsphere-1424186188-vm"
  vm_name = "grafana.ngrayson.banno-internal.com"
  memory_mb = "2048"
  cpus = "2"
  customization_specification = "Ubuntu"

  count = "1"

  connection {
    type = "ssh"
    host = "${self.ip_address}"
    user = "bannoadmin"
    key_file = "~/.ssh/id_rsa"
    timeout = "30s"
  }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo hostnamectl set-hostname ${self.vm_name}",
#       "echo ${self.ip_address} ${concat("mesos-slave", count.index)} ${self.vm_name)} | sudo tee -a /etc/hosts"
#     ]
#   }

#     provisioner "file" {
#     source = "${path.module}/scripts/mutate.sh"
#     destination = "/tmp/mutate.sh"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod +x /tmp/mutate.sh",
#       "sudo /tmp/mutate.sh ${var.env_name} docker",
#     ]
#   }

#   provisioner "file" {
#     source = "${path.module}/scripts/users.sh"
#     destination = "/tmp/users.sh"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod +x /tmp/users.sh",
#       "sudo /tmp/users.sh"
#     ]
#   }

#   provisioner "file" {
#     source = "${path.module}/scripts/remove-initial-keypair.sh"
#     destination = "/tmp/remove-initial-keypair.sh"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod +x /tmp/remove-initial-keypair.sh"
#     ]
#   }
# }

# resource "aws_route53_record" "grafana_vsphere_internal_dns" {
#   name = "${concat("mesos-lb-slave", count.index, ".", var.env_name, ".cfia.", var.internal_tld)}"

#   count = "${var.grafana_vsphere_count}"

#   zone_id = "${var.route53_zone_id}"
#   type = "A"
#   ttl = "1"
#   records = ["${element(vsphere_vm.grafana_vsphere_instance.*.ip_address, count.index)}"]
}
