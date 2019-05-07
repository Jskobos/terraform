resource "linode_instance" "base-linode" {
    count  = "${var.node_count}"
    label  = "example-instance-${count.index + 1}"
    tags = ["nodebalancer"]
    region = "${var.region}"
    type = "g6-nanode-1"
    image = "linode/ubuntu18.10"
    root_pass = "${random_string.password.result}"
    private_ip = true
    backups_enabled = true
    provisioner "remote-exec" {
        inline = [
            # install NGINX
            "export PATH=$PATH:/usr/bin",

            "apt-get -q update",
            "mkdir -p /var/www/html/",
            "mkdir -p /var/www/html/healthcheck",
            "echo healthcheck > /var/www/html/healthcheck/index.html",
            "echo node ${count.index + 1} > /var/www/html/index.html",
            "apt-get -q -y install nginx",
        ]

        connection {
            type = "ssh"
            user = "root"
            password = "${random_string.password.result}"
        }
    }
}
