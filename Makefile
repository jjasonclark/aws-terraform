PWD=$(shell pwd)
NAME="aws-terraform"

.PHONY: tfapply
tfapply:
	terraform apply

.PHONY: awsinit
awsinit:
	aws cloudformation create-stack --stack-name $(NAME)-terraform-backend --template-body file://backend.yml --parameters ParameterKey=AppPrefix,ParameterValue=$(NAME) --capabilities CAPABILITY_NAMED_IAM

.PHONY: tfinit
tfinit:
	terraform init
