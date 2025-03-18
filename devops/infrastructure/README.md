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

Folder structure
```
devops/infrastructure/
├── .github/
│   └── workflows/            # Pliki konfiguracyjne CI/CD (np. GitHub Actions)
├── .terraform/               # Folder tworzony automatycznie przez Terraform (nie commitujemy go)
├── envs/
│   └── dev/                  # Konfiguracja Terraform dla środowiska deweloperskiego
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── modules/                  # Zbiór modułów Terraform
│   ├── firebase/             # Moduł odpowiedzialny za konfigurację Firebase
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── project/              # Moduł do tworzenia i zarządzania projektem GCP
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── storage/              # Moduł do tworzenia i konfiguracji GCS (bucket na Terraform state)
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── .gitignore                
├── main.tf                   # Główna konfiguracja Terraform i backendu
├── providers.tf              # Definicje providerów (google-beta)
├── variables.tf              # Zbiór zmiennych globalnych
├── versions.tf               # Wymagane wersje Terraform i providerów
└── terraform.tfvars          # Wartości zmiennych (ID projektu)
```