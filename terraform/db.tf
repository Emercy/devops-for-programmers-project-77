resource "yandex_mdb_postgresql_cluster" "mypg" {
  name                = "mypg"
  environment         = "PRESTABLE"
  network_id          = yandex_vpc_network.network-1.id
  security_group_ids  = [var.security_group_ids]
  deletion_protection = false

  config {
    version = 15
    resources {
      resource_preset_id = "b1.medium"
      disk_type_id       = "network-ssd"
      disk_size          = "10"
    }
  }

  host {
    zone      = var.zone
    name      = "mypg-host-a"
    subnet_id = yandex_vpc_subnet.subnet-1.id
  }
}

resource "yandex_mdb_postgresql_database" "db1" {
  cluster_id = yandex_mdb_postgresql_cluster.mypg.id
  name       = var.db_name
  owner      = var.db_name
}

resource "yandex_mdb_postgresql_user" "user1" {
  cluster_id = yandex_mdb_postgresql_cluster.mypg.id
  name       = var.db_name
  password   = var.db_password
}

# resource "yandex_vpc_security_group" "pgsql-sg" {
#   name       = "pgsql-sg"
#   network_id = yandex_vpc_network.mynet.id

#   ingress {
#     description    = "PostgreSQL"
#     port           = 6432
#     protocol       = "TCP"
#     v4_cidr_blocks = [ "0.0.0.0/0" ]
#   }
# }