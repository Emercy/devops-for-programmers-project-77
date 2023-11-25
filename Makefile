config:
	ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass -t config
deploy:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file "~/vault-password-file"
edit_vault:
	cp group_vars/webservers/vault-password-file ~/
	chmod -x ~/vault-password-file
	ansible-vault edit group_vars/webservers/vault.yml --vault-password-file "~/vault-password-file"
install_req:
	ansible-galaxy install -r requirements.yml