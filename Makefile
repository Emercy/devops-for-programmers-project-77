config:
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --ask-vault-pass -t config
deploy:
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --vault-password-file "ansible/vault-password-file"
edit_vault:
	cp ansible/group_vars/webservers/vault-password-file ~/
	chmod -x ~/ansible/vault-password-file
	ansible-vault edit ansible/group_vars/webservers/vault.yml --vault-password-file "~/ansible/vault-password-file"
install_req:
	ansible-galaxy install -r requirements.yml
vm_list:
	yc compute instance list
vm_start:
	yc compute instance start first-instance
vm_restart:
	yc compute instance restart first-instance