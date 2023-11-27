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

variable "v4_cidr_blocks" {
  type    = list(string)
  default = ["192.168.10.0/24"]
}

variable "nat" {
  type    = bool
  default = true
}

variable "image_family" {
  type    = string
  default = "debian-10"
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
  default   = ""
  type      = string
  sensitive = true
}

variable "user_pass" {
  default   = ""
  type      = string
  sensitive = true
}

variable "admin_pass" {
  default   = ""
  type      = string
  sensitive = true
}

variable "timeout_create" {
  default = "10m"
}

variable "timeout_delete" {
  default = "10m"
}

variable "ssh_key" {
  type      = string
  default   = ""
  sensitive = true
}

variable "service_account_id" {
  type      = string
  default   = ""
  sensitive = true
}

variable "token" {
  type      = string
  default   = "" 
  sensitive = true
}

variable "public_ip" {
  type      = string
  default   = ""
  sensitive = true
}

variable "security_group_ids" {
  type    = string
  default = "enptuu5nvmgnctaap2j6"
}

variable "db_name" {
  type      = string
  default   = ""
  sensitive = true
}

variable "db_password" {
  type      = string
  default   = ""
  sensitive = true
}
