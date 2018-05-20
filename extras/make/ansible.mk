# Ansible
.PHONY: ansible.help
USER:=ubuntu
ANSIBLE_DIR:=$(PROVISION_DIR)/ansible

ansible:
	make ansible.help

ansible.help:
	@echo '    Ansible:'
	@echo ''
	@echo '        ansible.encrypt            encrypt by stage'
	@echo '        ansible.decrypt            decrypt by stage'
	@echo '        ansible.update             Update Roles ansible by stage'
	@echo '        ansible.tag                Deploy tag by stage'
	@echo ''

ansible.encrypt: clean
	@ansible-vault encrypt "${ANSIBLE_DIR}/${stage}/vars/vars.yaml" \
		--vault-password-file "${HOME}/${PROJECT}-${stage}.txt" && echo $(MESSAGE_HAPPY)

ansible.decrypt: clean
	@ansible-vault decrypt "${ANSIBLE_DIR}/${stage}/vars/vars.yaml" \
		--vault-password-file "${HOME}/${PROJECT}-${stage}.txt" && echo $(MESSAGE_HAPPY)

ansible.update: clean
	@ansible-galaxy install -r "${ANSIBLE_DIR}/${stage}/"requirements.yml \
			   --roles-path "${ANSIBLE_DIR}/${stage}"/roles/contrib --force

ansible.tag: clean
	@ansible-playbook -v "${ANSIBLE_DIR}/${stage}/deploy.yaml" -i "${ANSIBLE_DIR}/${stage}/inventories/aws" \
					--user="${USER}" --private-key="${KEYS_DIR}/${PROJECT}-${stage}.pem" \
					--tags "${tags}" \
					--extra-vars "@${ANSIBLE_DIR}/${stage}/vars/vars.yaml" \
					--vault-password-file "${HOME}/${PROJECT}-${stage}.txt"
