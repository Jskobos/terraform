resource "linode_nodebalancer" "nodebalancer" {
  label = "nodebalancer-terraform"
  region = "${var.region}"
}

resource "linode_nodebalancer_config" "nb-config" {
  nodebalancer_id = "${linode_nodebalancer.nodebalancer.id}"
  port = 80
  protocol = "http"
  check = "http_body"
  check_path = "/healthcheck/"
  check_body = "healthcheck"
  check_attempts = 30
  check_timeout = 25
  check_interval = 30
  stickiness = "http_cookie"
  algorithm = "roundrobin"
}

resource "linode_nodebalancer_node" "nb-node" {
  count = "${var.node_count}"
  nodebalancer_id = "${linode_nodebalancer.nodebalancer.id}"
  config_id = "${linode_nodebalancer_config.nb-config.id}"
  label = "node-${count.index + 1}"
  address = "${element(linode_instance.base-linode.*.private_ip_address, count.index)}:80"
  mode = "accept"
}

output "nodebalancer_ip_address" {
  value = "${linode_nodebalancer.nodebalancer.ipv4}"
}
