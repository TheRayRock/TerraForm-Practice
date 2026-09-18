# Terraform Practice 🚀

This project is a basic **Terraform practice project** for learning how to create and manage AWS infrastructure using Terraform.

## 📁 Project Structure

```text
TerraForm-Practice/
│
├── ec2.tf                # EC2 instance configuration
├── provider.tf           # AWS provider configuration
├── terraform.tf          # Terraform configuration
├── variable.tf           # Input variables
├── outputs.tf            # Output values
├── install_nginx.sh      # Script to install Nginx
├── .gitignore
└── README.md
```

## 🛠️ Prerequisites

Before running this project, make sure you have:

* [Terraform](https://developer.hashicorp.com/terraform/install) installed
* AWS account
* AWS CLI installed
* AWS credentials configured
* An AWS key pair/public key required by the Terraform configuration

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

# 🚀 How to Run Terraform

## 1. Clone the Repository

```bash
git clone https://github.com/TheRayRock/TerraForm-Practice.git
```

Go inside the project:

```bash
cd TerraForm-Practice
```

---

## 2. Initialize Terraform

Run:

```bash
terraform init
```

`terraform init` prepares the Terraform working directory and downloads the required providers and modules.

---

## 3. Format Terraform Files

Run:

```bash
terraform fmt
```

This formats Terraform files into Terraform's standard style.

You can also check which files would be changed:

```bash
terraform fmt -check
```

---

## 4. Validate the Configuration

Run:

```bash
terraform validate
```

This checks whether the Terraform configuration is syntactically correct and internally valid.

---

## 5. Create a Terraform Plan

Run:

```bash
terraform plan
```

This shows what Terraform plans to create, modify, or delete **without actually making those changes**.

---

## 6. Create the AWS Infrastructure

Run:

```bash
terraform apply
```

Terraform will show the planned changes and ask for confirmation.

Type:

```text
yes
```

Terraform will then create the resources defined in your configuration.

You can also use:

```bash
terraform apply -auto-approve
```

⚠️ Use `-auto-approve` carefully because Terraform will not ask for confirmation.

---

## 7. View Terraform Outputs

After applying the configuration:

```bash
terraform output
```

To see a specific output:

```bash
terraform output <output_name>
```

---

# 🗑️ Destroy Infrastructure

When you finish practicing, destroy the resources to avoid unnecessary AWS charges:

```bash
terraform destroy
```

Terraform will ask for confirmation.

Type:

```text
yes
```

`terraform destroy` removes the infrastructure managed by the Terraform configuration.

You can also preview what will be destroyed:

```bash
terraform plan -destroy
```

---

# 🔄 Basic Terraform Workflow

The most common Terraform workflow is:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

When you are finished:

```bash
terraform destroy
```

In simple words:

```text
init
 ↓
Prepare Terraform

fmt
 ↓
Format code

validate
 ↓
Check code

plan
 ↓
See what will happen

apply
 ↓
Create / Update infrastructure

destroy
 ↓
Delete infrastructure
```

Terraform's core workflow is **Init → Plan → Apply**, with `destroy` used when you want to remove the managed infrastructure.

---

# 🔐 AWS Credentials

Terraform needs permission to access AWS.

You can configure AWS credentials using the AWS CLI:

```bash
aws configure
```

It will ask for:

```text
AWS Access Key ID
AWS Secret Access Key
Default region name
Default output format
```

For example:

```text
AWS Access Key ID:     YOUR_ACCESS_KEY
AWS Secret Access Key: YOUR_SECRET_KEY
Default region name:  ap-south-1
Default output format: json
```

⚠️ **Never commit AWS access keys, secret keys, private keys, or other secrets to GitHub.**

---

# 🔑 SSH Key

If your EC2 configuration uses an SSH key pair, make sure the required public key file exists before running Terraform.

Example:

```text
terraform-key-ec2.pub
```

Never upload your private key:

```text
terraform-key-ec2
```

to GitHub.

Add private keys and other secrets to `.gitignore`.

---

# 📌 Useful Terraform Commands

| Command                   | Purpose                                  |
| ------------------------- | ---------------------------------------- |
| `terraform init`          | Initialize Terraform                     |
| `terraform fmt`           | Format Terraform files                   |
| `terraform validate`      | Validate configuration                   |
| `terraform plan`          | Preview changes                          |
| `terraform apply`         | Create/update infrastructure             |
| `terraform output`        | Show outputs                             |
| `terraform show`          | Show current state/plan information      |
| `terraform state list`    | List resources in Terraform state        |
| `terraform destroy`       | Delete infrastructure                    |
| `terraform plan -destroy` | Preview resources that will be destroyed |
| `terraform version`       | Show Terraform version                   |
| `terraform`               | Show available commands                  |

---

# ⚠️ Important

Terraform manages real AWS infrastructure.

Before running:

```bash
terraform apply
```

always review:

```bash
terraform plan
```

After your practice, run:

```bash
terraform destroy
```

to remove resources you no longer need.

## 📚 References

* [Terraform CLI Documentation](https://developer.hashicorp.com/terraform/cli?utm_source=chatgpt.com)
* [Terraform Workflow Documentation](https://developer.hashicorp.com/terraform/cli/run?utm_source=chatgpt.com)
* [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs?utm_source=chatgpt.com)

## 👨‍💻 Author

**TheRayRock**

GitHub: https://github.com/TheRayRock
