terraform {
  cloud {
    organization = "emercy"

    workspaces {
      name = "my-app-prod"
    }
  }
}