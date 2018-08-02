variable do_token {
  description = "DigitalOcean token."
}

variable swap_size {
  description = "Size of swapfile in gigabytes."
  default     = 1
}

variable server_image {
  description = "Image for server."
  default     = "ubuntu-18-04-x64"
}

variable server_name {
  description = "Name of server."
  default     = "drupal1"
}
