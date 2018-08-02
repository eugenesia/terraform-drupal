variable do_token {
  description = "DigitalOcean token."
}

variable swap_size {
  description = "Size of swapfile in gigabytes."
  default     = 2
}

variable server_image {
  description = "Image for server."
  default     = "ubuntu-18-04-x64"
}

variable server_name {
  description = "Name of server."
  default     = "drupal1"
}

variable php_version {
  description = "PHP version."
  default     = "7.2"
}

variable mysql_password {
  description = "MySQL password."
}

variable drupal_password {
  description = "Drupal password for root user."
}
