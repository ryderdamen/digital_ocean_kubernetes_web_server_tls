.PHONY: init
init:
	@cd terraform && terraform init

.PHONY: plan
plan:
	@cd terraform && terraform plan -var-file="testing.tfvars"

.PHONY: apply
apply:
	@cd terraform && terraform apply -auto-approve -var-file="testing.tfvars"

.PHONY: destroy
destroy:
	@cd terraform && terraform destroy -var-file="testing.tfvars"
