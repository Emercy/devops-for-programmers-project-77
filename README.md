### Hexlet tests and linter status:
[![Actions Status](https://github.com/Emercy/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Emercy/devops-for-programmers-project-77/actions)

## Requirements
* Terraform
* Ansible
* [Yandex CLI](https://cloud.yandex.ru/docs/cli/quickstart#install)
```
yc iam service-account create --name my_service_name # create service account
yc iam service-account list # show service account id
yc iam key create \
--service-account-id my_service_id \
--folder-name my_folder_name \
--output key.json
```

## Terraform
```
cd .\terraform
terraform init
terraform plan
terraform apply
terraform destroy
```

# Ansible
```
make config
make deploy
```

## Powershell env
```
$Env:YC_TOKEN=$(yc iam create-token)
$Env:YC_CLOUD_ID=$(yc config get cloud-id)
$Env:YC_FOLDER_ID=$(yc config get folder-id)
```

## Link
* [Yandex cloud Terraform](https://terraform-provider.yandexcloud.net)
* [YC instance group with network balancer](https://cloud.yandex.ru/docs/compute/operations/instance-groups/create-with-balancer?from=int-console-empty-state)