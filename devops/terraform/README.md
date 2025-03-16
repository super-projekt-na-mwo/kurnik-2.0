To create the infrastructure use commands:

```
terraform init -migrate-state
terraform validate
terraform plan -out=new-plan.tfplan
terraform apply "new-plan.tfplan"
#or
terraform init -migrate-state -backend-config=backend-config.hcl
terraform validate
terraform plan -var-file="credentials.tfvars" -out=new-plan.tfplan
terraform apply "new-plan.tfplan"
```

Bucket structure

```
gs://<bucket_name>
│── terraform/state/default.tfstate  # Infrastucture description
│── terraform/state/default.tflock   # !
```