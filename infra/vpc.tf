resource "yandex_vpc_network" "infra_network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "infra_subnet" {
  network_id     = yandex_vpc_network.infra_network.id
  count          = length(var.net_cidr)
  name           = var.net_cidr[count.index].name
  zone           = var.net_cidr[count.index].zone
  v4_cidr_blocks = [var.net_cidr[count.index].prefix]
}

resource "yandex_vpc_security_group" "infra_sg" {
  name       = "${var.vpc_name}-sg"
  network_id = yandex_vpc_network.infra_network.id

  ingress {
    protocol       = "TCP"
    description    = "SSH"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
