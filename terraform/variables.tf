variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "folder_id" {
  type    = string
  default = "b1g9hb2favm5l3b58hkk"
}

variable "cloud_id" {
  type    = string
  default = "b1gl9m66cj06blt604a9"
}

variable "network" {
  type    = string
  default = "ya-network"
}

variable "subnet" {
  type    = string
  default = "ya-network"
}

variable "subnet_v4_cidr_blocks" {
  type    = list(string)
  default = ["192.168.10.0/16"]
}

variable "nat" {
  type    = bool
  default = true
}

variable "image_family" {
  type    = string
  default = "debian-10"
}

variable "name" {
  type = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2
}

variable "disk_size" {
  type    = number
  default = 15
}

variable "disk_type" {
  type    = string
  default = "network-nvme"
}

variable "user_name" {
  default = ""
  type    = string
}

variable "user_pass" {
  default = ""
  type    = string
}

variable "admin_pass" {
  default = ""
  type    = string
}

variable "timeout_create" {
  default = "10m"
}

variable "timeout_delete" {
  default = "10m"
}

variable "ssh_key" {
  type    = string
  default = ""
}

variable "service_account_id" {
  type    = string
  default = ""
}

variable "token" {
  type    = string
  default = ""  
}