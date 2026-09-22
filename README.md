# Terraform AWS Practice 🚀

A hands-on **Terraform + AWS** project for learning how to create and manage AWS infrastructure using Infrastructure as Code (IaC).

This repository contains multiple Terraform practice projects covering:

* AWS EC2
* AWS VPC
* AWS Security Groups
* AWS Key Pair
* AWS S3
* Terraform Variables
* Terraform Outputs
* `for_each`
* Conditional expressions
* EC2 `user_data`
* Nginx installation
* Terraform state
* Basic Terraform CLI commands

---

# 📁 Project Structure

```text
TerraForm-Practice/
│
├── ec2.tf
├── vpc.tf
├── provider.tf
├── terraform.tf
├── variable.tf
├── outputs.tf
├── install_nginx.sh
│
├── terraformS3/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── ...
│
├── .gitignore
└── README.md
```

> The `terraformS3` directory contains a separate Terraform project for practicing AWS S3.

---

# 🏗️ Projects

## 1. AWS EC2 + VPC

The root directory contains Terraform configuration for creating AWS infrastructure.

It demonstrates:

* EC2 instances
* VPC
* Security Groups
* AWS Key Pair
* Nginx installation
* `for_each`
* Variables
* Outputs
* Conditional expressions
* `user_data`

The project creates multiple EC2 instances using Terraform `for_each`.

Example:

```text
EC2 Instance
     │
     ├── t3.micro
     │
     └── t3.small
```

---

# 2. AWS S3 Terraform Project 🪣

The `terraformS3` directory contains a separate Terraform project for practicing **Amazon S3**.

You can enter the directory using:

```bash
cd terraformS3
```

Then run the normal Terraform workflow:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

To remove the S3 infrastructure:

```bash
terraform destroy
```

---

## 🚀 Run the S3 Project

### Step 1 — Go to the S3 directory

From the repository root:

```bash
cd terraformS3
```

### Step 2 — Initialize Terraform

```bash
terraform init
```

### Step 3 — Format the Terraform files

```bash
terraform fmt
```

### Step 4 — Validate the configuration

```bash
terraform validate
```

### Step 5 — Preview the changes

```bash
terraform plan
```

### Step 6 — Create the S3 infrastructure

```bash
terraform apply
```

Enter:

```text
yes
```

when Terraform asks for confirmation.

You can also use:

```bash
terraform apply -auto-approve
```

### Step 7 — View outputs

```bash
terraform output
```

### Step 8 — Destroy the S3 infrastructure

When you finish practicing:

```bash
terraform destroy
```

Then enter:

```text
yes
```

---

# 🔄 Terraform Workflow

The basic workflow for both projects is:

```text
terraform init
       ↓
terraform fmt
       ↓
terraform validate
       ↓
terraform plan
       ↓
terraform apply
       ↓
terraform output
       ↓
terraform destroy
```

---

# 🛠️ Prerequisites

Before running the projects, install:

* Terraform
* AWS CLI
* AWS account
* AWS credentials

Check Terraform:

```bash
terraform --version
```

Check AWS CLI:

```bash
aws --version
```

Check AWS credentials:

```bash
aws sts get-caller-identity
```

---

# 🔐 Configure AWS Credentials

Configure AWS CLI:

```bash
aws configure
```

Enter:

```text
AWS Access Key ID
AWS Secret Access Key
Default region name
Default output format
```

Example:

```text
AWS Access Key ID:     YOUR_ACCESS_KEY
AWS Secret Access Key: YOUR_SECRET_KEY
Default region name:  ap-south-1
Default output format: json
```

Verify:

```bash
aws sts get-caller-identity
```

⚠️ Never commit AWS access keys or secret keys to GitHub.

---

# 📌 Useful Terraform Commands

| Command                           | Purpose                      |
| --------------------------------- | ---------------------------- |
| `terraform init`                  | Initialize Terraform         |
| `terraform fmt`                   | Format Terraform files       |
| `terraform fmt -check`            | Check formatting             |
| `terraform validate`              | Validate configuration       |
| `terraform plan`                  | Preview changes              |
| `terraform apply`                 | Create/update infrastructure |
| `terraform output`                | Show outputs                 |
| `terraform show`                  | Show Terraform state         |
| `terraform state list`            | List managed resources       |
| `terraform state show <resource>` | Show resource details        |
| `terraform console`               | Test Terraform expressions   |
| `terraform destroy`               | Delete infrastructure        |
| `terraform plan -destroy`         | Preview destruction          |
| `terraform version`               | Show Terraform version       |

---

# 🔑 Important: Run Terraform Separately

Because `terraformS3` is a **separate Terraform configuration**, run Terraform commands inside the correct directory.

For EC2/VPC:

```bash
cd TerraForm-Practice

terraform init
terraform plan
terraform apply
```

For S3:

```bash
cd TerraForm-Practice/terraformS3

terraform init
terraform plan
terraform apply
```

Each Terraform project has its own Terraform state.

---

# ⚠️ Security

Never commit:

```text
AWS Access Keys
AWS Secret Keys
Private SSH Keys
terraform.tfstate
terraform.tfstate.backup
```

Make sure sensitive files are included in `.gitignore`.

Also remember that Terraform creates **real AWS resources**, which may cost money.

When you finish practicing:

```bash
terraform destroy
```

---

# 📚 Learning Path

```text
Terraform Basics
       ↓
Providers
       ↓
Resources
       ↓
Variables
       ↓
Outputs
       ↓
Terraform State
       ↓
AWS EC2
       ↓
AWS VPC
       ↓
Security Groups
       ↓
for_each
       ↓
Conditional Expressions
       ↓
AWS S3
       ↓
Terraform Modules
       ↓
Remote State
       ↓
Terraform CI/CD
```

---

# 📖 References

* [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
* [Terraform CLI](https://developer.hashicorp.com/terraform/cli)
* [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [Amazon S3](https://aws.amazon.com/s3/)

---

# 👨‍💻 Author

**TheRayRock**

GitHub: https://github.com/TheRayRock
