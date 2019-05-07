provider "linode" {
  token = "${var.access_token}"
}

resource "linode_instance" "web" {
  count = "${var.web_count}"
  image = "linode/ubuntu18.04"
  label = "webserver-${count.index + 1}"
  tags = ["terraform", "weblinode", "production"]
  region = "us-east"
  type = "g6-standard-2"
  authorized_keys = ["${chomp(file(var.ssh_key))}"]
  root_pass = "${random_string.password.result}"
  backups_enabled = true
}
