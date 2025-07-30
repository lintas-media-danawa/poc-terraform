# Terraform Cloud Run Deployment

Infrastructure as Code untuk deployment Cloud Run service menggunakan Terraform dan GitHub Actions.

## 🚀 Fitur

- ✅ Automated deployment dengan GitHub Actions
- ✅ Cloud Run service dengan public access
- ✅ Artifact Registry integration
- ✅ Environment-based deployment (develop/main)

## 📁 Struktur Project

```
terraform-cloud-run/
├── .github/workflows/terraform.yml  # GitHub Actions workflow
├── main.tf                          # Cloud Run service configuration
├── provider.tf                      # Google Cloud provider
├── variables.tf                     # Variable definitions
├── outputs.tf                       # Output values
├── terraform.tfvars.example         # Example variables
└── README.md                        # Documentation
```

## 🔧 Setup

### 1. Prerequisites

- Google Cloud Project dengan billing enabled
- Service Account dengan permission yang cukup
- GitHub repository

### 2. Service Account Setup

Buat service account dengan role berikut:
- `roles/run.admin`
- `roles/artifactregistry.admin`
- `roles/iam.serviceAccountUser`

### 3. GitHub Secrets

Tambahkan secret di GitHub repository:
- `GCP_SA_KEY`: Content dari service account JSON key

### 4. Environment Variables

Update environment variables di `.github/workflows/terraform.yml`:
```yaml
env:
  GOOGLE_PROJECT_ID: "your-project-id"
  GOOGLE_REGION: "asia-southeast2"
```

## 🚀 Deployment

### Automatic Deployment

1. **Push ke branch `develop`**: Auto-deploy dengan `terraform apply`
2. **Push ke branch `main`**: Auto-deploy dengan `terraform apply`
3. **Pull Request ke `main`**: Run `terraform plan` untuk review

### Manual Deployment

```bash
# Clone repository
git clone <your-repo-url>
cd terraform-cloud-run

# Setup credentials
export GOOGLE_APPLICATION_CREDENTIALS="path/to/service-account.json"

# Initialize Terraform
terraform init

# Plan changes
terraform plan

# Apply changes
terraform apply
```

## 🔄 Workflow

1. **Develop Branch**: 
   - Push → Auto deploy ke development environment
   - Perfect untuk testing

2. **Main Branch**:
   - Push → Auto deploy ke production
   - Pull Request → Plan only (untuk review)

3. **Security**:
   - Service account key disimpan sebagai GitHub secret
   - Terraform state tidak di-commit ke repository

## 📊 Monitoring

Setelah deployment, cek:
- Cloud Run service: https://console.cloud.google.com/run
- GitHub Actions: https://github.com/your-repo/actions

## 🛠️ Troubleshooting

### Common Issues

1. **Permission Error (403)**:
   - Pastikan service account punya role yang cukup
   - Cek project ID dan region

2. **Image Not Found**:
   - Pastikan image name benar
   - Cek Artifact Registry permissions

3. **Terraform State Lock**:
   - Gunakan remote state backend (recommended)
   - Atau force unlock jika diperlukan

## 📝 Notes

- Service account key file (`*.json`) tidak di-commit ke repository
- Gunakan `terraform.tfvars.example` sebagai template
- Update image name sesuai kebutuhan aplikasi 