terraform {
  cloud {
    organization = "emercy"

    workspaces {
      name = "yc_mega_workspace"
    }
  }
}