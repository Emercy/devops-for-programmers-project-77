#resource "yandex_vpc_network" "foo" {}

resource "yandex_dns_zone" "zone1" {
  name        = "my-public-zone"
  description = "Test public zone"

  labels = {
    label1 = "test-public"
  }

  zone    = "emercy.ru."
  public  = true
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "emercy.ru."
  type    = "A"
  ttl     = 200
  data    = [var.public_ip]
}