output "internal_ip" {
  description = "The internal IP address of the instance"
  value       = yandex_compute_instance.yc_instance.*.network_interface.0.ip_address
}

output "external_ip" {
  description = "The external IP address of the instance"
  value       = yandex_compute_instance.yc_instance.*.network_interface.0.nat_ip_address
}
