# Terraform AWS Practice 🚀

A hands-on **Terraform + AWS** project created to learn how to provision and manage AWS infrastructure using Infrastructure as Code (IaC).

This project currently demonstrates:

* AWS EC2
* AWS VPC
* Security Groups
* AWS Key Pair
* Terraform Variables
* Terraform Outputs
* `for_each`
* Conditional expressions
* EC2 `user_data`
* Nginx installation
* Environment-based configuration
* Terraform state and basic CLI commands

---

## 🏗️ Architecture

```text
                         AWS
                          │
                          ▼
                    Default VPC
                          │
                          ▼
                  Security Group
                          │
              ┌───────────┴───────────┐
              │                       │
              ▼                       ▼
        EC2 - t3.micro          EC2 - t3.small
              │                       │
              └───────────┬───────────┘
                          │
                          ▼
                    Nginx Server
```

The project creates **two EC2 instances** using Terraform `for_each`:

```text
t3.micro
t3.small
```

The EC2 instances use the `install_nginx.sh` script through `user_data` to install Nginx automatically.

---

# 📁 Project Structure

```text
TerraForm-Practice/
│
├── ec2.tf                # EC2, security group and key pair
├── vpc.tf                # VPC configuration
├── provider.tf           # AWS provider configuration
├── terraform.tf          # Terraform/provider requirements
├── variable.tf           # Input variables
├── outputs.tf            # Terraform outputs
├── install_nginx.sh      # Nginx installation script
├── .gitignore            # Ignored files
└── README.md             # Project documentation
```

---

# 🛠️ Prerequisites

Before running this project, install:

* Terraform
* AWS CLI
* AWS account
* AWS credentials
* SSH public key

### Check Terraform

```bash
terraform --version
```

### Check AWS CLI

```bash
aws --version
```

### Check AWS credentials

```bash
aws sts get-caller-identity
```

---

# 🔐 Configure AWS Credentials

Configure your AWS credentials using:

```bash
aws configure
```

You will be asked for:

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

⚠️ **Never upload AWS access keys or secret keys to GitHub.**

---

# 🔑 SSH Key

The project expects a public SSH key:

```text
terraform-key-ec2.pub
```

The Terraform configuration uses this public key to create an AWS key pair.

Make sure the file exists in the project directory before running Terraform.

Never upload your private key:

```text
terraform-key-ec2
```

to GitHub.

---

# 🚀 How to Run

## 1. Clone the Repository

```bash
git clone https://github.com/TheRayRock/TerraForm-Practice.git
```

Go into the project:

```bash
cd TerraForm-Practice
```

---

## 2. Initialize Terraform

```bash
terraform init
```

This downloads the required providers and initializes the Terraform working directory.

---

## 3. Format Terraform Code

```bash
terraform fmt
```

Check formatting without changing files:

```bash
terraform fmt -check
```

---

## 4. Validate Configuration

```bash
terraform validate
```

This checks whether the Terraform configuration is valid.

---

## 5. Create a Terraform Plan

```bash
terraform plan
```

This shows what Terraform plans to create, update, or delete.

It does **not** create resources.

---

## 6. Create AWS Infrastructure

```bash
terraform apply
```

Terraform will show the changes and ask for confirmation.

Type:

```text
yes
```

You can also use:

```bash
terraform apply -auto-approve
```

⚠️ Use `-auto-approve` carefully because Terraform will not ask for confirmation.

---

# 🌎 Environment Variable

This project uses an `env` variable.

The default value is:

```text
dev
```

The variable is defined in `variable.tf`.

You can provide another environment during `terraform apply`.

For example:

```bash
terraform apply -var="env=dev"
```

or:

```bash
terraform apply -var="env=prd"
```

The project also uses the environment value when calculating EC2 root storage:

```text
dev
 ↓
Default storage size

prd
 ↓
20 GB
```

This is implemented using a Terraform conditional expression.

---

# 🔁 Creating Multiple EC2 Instances

The project uses Terraform `for_each`:

```hcl
for_each = tomap({
  this_this_t3micro = "t3.micro"
  this_is_for_t3small = "t3.small"
})
```

Terraform creates:

```text
EC2 Instance 1 → t3.micro
EC2 Instance 2 → t3.small
```

This is an example of using `for_each` to create multiple resources from a map.

---

# 🌐 Nginx Installation

The EC2 instances use:

```hcl
user_data = file("install_nginx.sh")
```

This runs the shell script when the EC2 instance starts.

The script is responsible for installing and configuring Nginx.

After the instance is running, you can access the web server using:

```text
http://<EC2_PUBLIC_IP>
```

---

# 📤 Terraform Outputs

After applying the configuration:

```bash
terraform output
```

To get a specific output:

```bash
terraform output <output_name>
```

Outputs are defined in:

```text
outputs.tf
```

---

# 🗑️ Destroy Infrastructure

When you finish practicing, destroy the AWS resources:

```bash
terraform destroy
```

Type:

```text
yes
```

You can preview the destruction first:

```bash
terraform plan -destroy
```

⚠️ Destroy unused resources to avoid unnecessary AWS charges.

---

# 🔄 Terraform Workflow

The normal workflow is:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

When finished:

```bash
terraform destroy
```

### Simple Explanation

```text
terraform init
       ↓
Initialize Terraform

terraform fmt
       ↓
Format code

terraform validate
       ↓
Check configuration

terraform plan
       ↓
Preview changes

terraform apply
       ↓
Create / Update infrastructure

terraform destroy
       ↓
Delete infrastructure
```

---

# 📌 Useful Terraform Commands

| Command                           | Purpose                      |
| --------------------------------- | ---------------------------- |
| `terraform init`                  | Initialize Terraform         |
| `terraform fmt`                   | Format Terraform code        |
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

# 🧠 Terraform Concepts Practiced

This project helps practice:

### Terraform Basics

* Terraform providers
* Resources
* Variables
* Outputs
* Terraform state
* Terraform CLI

### AWS

* EC2
* VPC
* Security Groups
* Key Pairs
* Nginx

### Terraform Features

* `for_each`
* `tomap()`
* Conditional expressions
* Resource dependencies
* `user_data`
* Variable-based configuration

---

# 🔒 Security Notes

This project is for **learning and practice**.

The current security group allows:

```text
Port 22   → SSH
Port 80   → HTTP
Port 8000 → Application
```

The configuration currently allows these inbound ports from:

```text
0.0.0.0/0
```

That means they are accessible from the internet.

For a production environment, restrict access to trusted IP addresses and only open ports that are required.

Never commit:

```text
AWS Access Keys
AWS Secret Keys
Private SSH Keys
terraform.tfstate
terraform.tfstate.backup
```

to GitHub.

---

# ⚠️ Important

Terraform creates **real AWS resources**.

Before running:

```bash
terraform apply
```

always check:

```bash
terraform plan
```

When you finish practicing:

```bash
terraform destroy
```

This helps prevent unexpected AWS charges.

---

# 📚 References

* [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
* [Terraform CLI Documentation](https://developer.hashicorp.com/terraform/cli)
* [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

# 👨‍💻 Author

**TheRayRock**

GitHub: https://github.com/TheRayRock
