config:
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --vault-password-file "~/vault-password-file" -t config
deploy:
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --vault-password-file "~/vault-password-file"
edit_vault:
	ansible-vault edit ansible/group_vars/webservers/vault.yml --vault-password-file "~/vault-password-file"
install_req:
	ansible-galaxy install -r ansible/requirements.yml
vm_list:
	yc compute instance list
vm_start:
	yc compute instance start first-instance
vm_restart:
	yc compute instance restart first-instance
token:
	yc config list