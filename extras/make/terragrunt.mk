## Terragrunt
.PHONY: terragrunt.help
TERRAFORM_VERSION := 0.10.0
TERRAFORM_DIR:=$(PROVISION_DIR)/terraform
terragrunt := terragrunt

terragrunt.help:
	@echo '    terragrunt:'
	@echo ''
	@echo '        terragrunt                 Apply all'
	@echo '        terragrunt.init            Init download dependences terraform'
	@echo '        terragrunt.encrypt         encrypt by stage'
	@echo '        terragrunt.decrypt         decrypt by stage'
	@echo '        terragrunt.plan            plan by stage'
	@echo '        terragrunt.apply           apply by stage'
	@echo '        terragrunt.output          output by stage'
	@echo '        terragrunt.refresh         refresh by stage'
	@echo '        terragrunt.destroy         destroy by stage'
	@echo ''

terragrunt: clean
	@cd "${TERRAFORM_DIR}/sa-east-1/" && $(terragrunt) apply-all --terragrunt-source-update

terragrunt.encrypt: clean
	@ansible-vault encrypt "${TERRAFORM_DIR}/sa-east-1/${stage}/variables.tf" \
		--vault-password-file "${HOME}/${PROJECT}.txt" && echo $(MESSAGE_HAPPY)

terragrunt.decrypt: clean
	@ansible-vault decrypt "${TERRAFORM_DIR}/sa-east-1/${stage}/variables.tf" \
		--vault-password-file "${HOME}/${PROJECT}.txt" && echo $(MESSAGE_HAPPY)

terragrunt.init: clean
	@cd "${TERRAFORM_DIR}/sa-east-1/${stage}/" && $(terragrunt) init --terragrunt-source-update

terragrunt.plan: clean
	@cd "${TERRAFORM_DIR}/sa-east-1/${stage}/" && $(terragrunt) plan --terragrunt-source-update

terragrunt.apply: clean
	@cd "${TERRAFORM_DIR}/sa-east-1/${stage}/" && $(terragrunt) apply --terragrunt-source-update

terragrunt.destroy: clean
	@cd "${TERRAFORM_DIR}/sa-east-1/${stage}/" && $(terragrunt) destroy --terragrunt-source-update

terragrunt.output: clean
	@cd "${TERRAFORM_DIR}/sa-east-1/${stage}/" && $(terragrunt) output --terragrunt-source-update

terragrunt.refresh: clean
	@cd "${TERRAFORM_DIR}/sa-east-1/${stage}/" && $(terragrunt) refresh
