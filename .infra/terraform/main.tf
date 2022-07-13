terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

resource "local_file" "ans_inv" {
  content = templatefile("${path.module}/templates/inv.tpl",
    {
#      aws_names = aws_route53_record.vps.*.name
      #vps_names = values(var.devs)
      app_ip = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
      log_ip = yandex_compute_instance.log.*.network_interface.0.nat_ip_address
      prom_ip = yandex_compute_instance.prom.*.network_interface.0.nat_ip_address
    }
  )
  filename = "${path.module}/../inventory/dev"
}


resource "null_resource" "AnsiblePlaybook" {
  provisioner "local-exec" {
    command = "ansible-playbook -i '${path.module}/../inventory/dev' '${path.module}/../ansible/do-final.yml' --vault-password-file ~/.keys/vault_password"
  }
  depends_on = [
    local_file.ans_inv
  ]
}
