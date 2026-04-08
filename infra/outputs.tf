output "vm_1_name" {
  description = "Name of created VM"
  value       = yandex_compute_instance.vm_1.name
}

output "vm_1_public_ip" {
  description = "Public IP address of created VM"
  value       = yandex_compute_instance.vm_1.network_interface.0.nat_ip_address
}
