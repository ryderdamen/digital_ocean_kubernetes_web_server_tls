.PHONY: init
init:
	@cd terraform && terraform init
	@cp terraform/production.tfvars.example terraform/production.tfvars

.PHONY: plan
plan:
	@cd terraform && terraform plan -var-file="production.tfvars"

.PHONY: apply
apply:
	@cd terraform && terraform apply -auto-approve -var-file="production.tfvars"

.PHONY: destroy
destroy:
	@cd terraform && terraform destroy -var-file="production.tfvars"
