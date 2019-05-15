provider "scaleway" {
  region = "${var.region}"
  organization = "${var.organization}"
  token        = "${var.scw_token}"
}

data "scaleway_image" "terraformwordpressgeorges" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}

resource "scaleway_server" "terraformwordpressgeorges" {
  name  = "terraformwordpressgeorges"
  image = "${data.scaleway_image.terraformwordpressgeorges.id}"
  type  = "START1-S"
}
resource "scaleway_ip" "ip" {
  server = "${scaleway_server.terraformwordpressgeorges.id}"
}


resource "scaleway_volume" "terraformwordpressgeorges" {
  name       = "terraformwordpressgeorgesvolume"
  size_in_gb = 50
  type       = "l_ssd"
}
