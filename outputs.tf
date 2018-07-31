output droplet_hostname {
  description = "Droplet hostname."
  value       = "${digitalocean_record.desktop.fqdn}"
}

output droplet_ip {
  description = "Droplet IP."
  value       = "${digitalocean_droplet.desktop.ipv4_address}"
}
