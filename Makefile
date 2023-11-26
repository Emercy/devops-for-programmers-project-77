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
token:
	yc config list