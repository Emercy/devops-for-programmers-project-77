terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token                    = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone = var.zone
}

resource "yandex_iam_service_account" "ig-sa" {
  name        = "ig-sa"
  description = "service account to manage IG"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
}

resource "yandex_compute_instance_group" "ig-1" {
  name                = "fixed-ig-with-balancer"
  folder_id           = var.folder_id
  service_account_id  = yandex_iam_service_account.ig-sa.id
  deletion_protection = "false"
  instance_template {
    platform_id = "standard-v1"
    resources {
      memory        = var.memory
      cores         = var.cores
      core_fraction = 20
    }

    boot_disk {
      initialize_params {
        image_id = "fd8dmc4mqvmgp6oqgi7p"
        size     = var.disk_size
        type     = var.disk_type
      }
    }

    network_interface {
      network_id = yandex_vpc_network.network-1.id
      subnet_ids = ["${yandex_vpc_subnet.subnet-1.id}"]
    }

    metadata = {
      ssh-keys = var.ssh_key
    }
  }

  scale_policy {
    fixed_scale {
      size = 2
    }
  }

  allocation_policy {
    zones = [var.zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  load_balancer {
    target_group_name        = "target-group"
    target_group_description = "load balancer target group"
  }
}

resource "yandex_lb_network_load_balancer" "lb-1" {
  name = "network-load-balancer-1"

  listener {
    name = "network-load-balancer-1-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.ig-1.load_balancer.0.target_group_id

    healthcheck {
      name = "http"
      http_options {
        port = 3000
        path = ""
      }
    }
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = var.zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = var.v4_cidr_blocks
}