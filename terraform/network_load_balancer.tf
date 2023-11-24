resource "yandex_lb_network_load_balancer" "foo" {
  name = "test-load-balancer-1"
  deletion_protection = "true"
  listener {
    name        = "test-listener"
    port        = 80
    target_port = 3000
    protocol    = "tcp"
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = var.network_id
    healthcheck {
      name                = "http"
      interval            = 2
      timeout             = 1
      unhealthy_threshold = 2
      healthy_threshold   = 2
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}