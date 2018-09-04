output droplet_hostname {
  description = "Droplet hostname."
  value       = "${digitalocean_record.server.fqdn}"
}

output droplet_ip {
  description = "Droplet IP."
  value       = "${digitalocean_droplet.server.ipv4_address}"
}
