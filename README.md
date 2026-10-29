# 🏗️ Terraform Multi-Environment Infrastructure (AWS)

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white) ![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazonwebservices&logoColor=white)

Reusable **Terraform module** that provisions the same application stack for **dev, staging and prod** on AWS, with per-environment sizing.

## 📦 What it provisions (per environment)

| Resource | Details |
|---|---|
| EC2 | Instance count and type per environment, gp3 root volume, Nginx installed via `user_data` |
| Security group | HTTP (80) and SSH (22) inbound, all outbound |
| Key pair | Environment-specific SSH key |
| S3 bucket | `<env>-<bucket_name>` |
| DynamoDB table | Pay-per-request, configurable hash key |

| Environment | Instances | Type |
|---|---|---|
| dev | 1 | t2.micro |
| staging | 1 | t2.micro |
| prod | 2 | t2.small |

## 📁 Structure

```
.
├── main.tf          # calls the module 3x (dev, staging, prod)
├── provider.tf      # AWS provider (us-east-1)
├── terraform.tf     # required providers
└── infra-app/       # reusable module
    ├── ec2.tf       # key pair, default VPC, security group, EC2
    ├── s3.tf
    ├── dynamo.tf
    └── variable.tf
```

## 🚀 Usage

```bash
terraform init
terraform plan
terraform apply
terraform destroy   # clean up
```

Requires AWS credentials configured locally and an SSH public key (`FINAL.pub`) for the key pair.

## 🔐 Production hardening (next steps)

- Restrict SSH (port 22) to a known CIDR or use SSM Session Manager instead
- Store state remotely in S3 with DynamoDB state locking
- Tag and encrypt S3 buckets, enable versioning
- Keep `.terraform/` out of version control

---

## 👤 Author

**Abdur Rehman** · DevSecOps Engineer · Founder of [ARTechOps](https://artechops.com)

[LinkedIn](https://www.linkedin.com/in/muhamad-abdur-rehman-81777b366/) · [GitHub](https://github.com/abdur-rehman-tech) · [artechops.com](https://artechops.com)
