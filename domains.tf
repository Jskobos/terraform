resource "linode_domain" "foobar" {
  domain = "foobar.example"
  soa_email = "${var.email}"
  type = "master"
  tags = ["weblinode", "production"]
}

resource "linode_domain_record" "foobar" {
  domain_id = "${linode_domain.foobar.id}"
  name = "www"
  record_type = "CNAME"
  target = "foobar.example"
}