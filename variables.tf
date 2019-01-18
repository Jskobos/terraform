variable access_token {
  description = "Your Linode API v4 access token"
}

variable node_count {
  description = "Number of back-end nodes for your NodeBalancer"
  default = 2
}

variable web_count {
  description = "Number of Linode webserver instances to build"
  default = 10
}

variable region {
  description = "Datacenter where your resources will be created"
  default = "us-east"
}

variable "ssh_key" {
  description = "The local file location of the SSH key that will be transferred to each Linode."
  default = "~/.ssh/id_rsa.pub"
}

resource "random_string" "password" {
  length = 32
  special = true
  upper = true
  lower = true
  number = true
}