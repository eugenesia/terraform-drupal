# Configure DigitalOcean provider.
provider digitalocean {
  token = "${var.do_token}"
}

# Create a droplet.
resource digitalocean_droplet desktop {
  image     = "ubuntu-18-04-x64"
  name      = "ubuntu-desktop"
  region    = "lon1"
  size      = "512mb"                                   # $5/mth
  ssh_keys  = [4066671, 17252294]
  user_data = "${data.template_file.userdata.rendered}"
}

# Put the droplet under a domain.
resource digitalocean_record desktop {
  domain = "do.eugenesia.net"
  type   = "A"
  name   = "drupal1"
  value  = "${digitalocean_droplet.desktop.ipv4_address}"
  ttl    = 180
}

# Render userdata.sh with variables.
data template_file userdata {
  template = "${file("userdata.sh")}"

  vars {
    # Swapfile of 1GB.
    swap_size = "${var.swap_size}"
  }
}
