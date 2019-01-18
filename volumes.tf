resource "linode_volume" "volume" {
  label = "attached-volume"
  size = 20
  region = "${linode_instance.web.0.region}"
  linode_id = "${linode_instance.web.0.id}"
}

resource "linode_volume" "volume-unattached" {
  count = "${var.volume_count}"
  label = "volume-${count.index + 1}"
  size = 20
  region = "${var.region}"
}