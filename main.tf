# Configure DigitalOcean provider.
provider digitalocean {
  token = "${var.do_token}"
}

# Create a droplet.
resource digitalocean_droplet desktop {
  image  = "ubuntu-18-04-x64"
  name   = "ubuntu-desktop"
  region = "lon1"

  # size = "s-2vcpu-2gb"
  # size = "s-3vcpu-1gb"
  # size = "2gb"

  # CPU-optimised.
  # size = "c-1vcpu-2gb"
  size = "c-4"
  ssh_keys  = [4066671, 17252294]
  user_data = "${data.template_file.userdata.rendered}"
}

# Put the droplet under a domain.
resource digitalocean_record desktop {
  domain = "do.eugenesia.net"
  type   = "A"
  name   = "desktop"
  value  = "${digitalocean_droplet.desktop.ipv4_address}"
  ttl    = 180
}

# Render userdata.sh with variables.
data template_file userdata {
  template = "${file("userdata.sh")}"

  vars {
    vnc_password = "${var.vnc_password}"
  }
}
