# Terraform Practice 🚀

This project is a basic **Terraform practice project** for learning how to create and manage AWS infrastructure using Terraform.

## 📁 Project Structure

```text
TerraForm-Practice/
│
├── ec2.tf                # EC2 instance configuration
├── provider.tf           # AWS provider configuration# Terraform AWS EC2 Practice 🚀

This project is a hands-on **Terraform + AWS practice project**.

The project demonstrates how to use Terraform to create and manage AWS infrastructure, including:

* AWS EC2 instances
* AWS Default VPC
* Security Groups
* AWS Key Pair
* Terraform Variables
* Terraform Outputs
* `for_each`
* Conditional expressions
* EC2 `user_data`
* Nginx installation
* Environment-based configuration

The goal of this project is to understand the **basic-to-intermediate Terraform workflow** and how Terraform can be used to automate AWS infrastructure.

---

## 🏗️ Architecture

```text
                    AWS
                     │
                     ▼
              Default VPC
                     │
              ┌──────┴──────┐
              │             │
              ▼             ▼
       Security Group   Key Pair
              │
       ┌──────┴──────┐
       │             │
       ▼             ▼
   EC2 Instance   EC2 Instance
    t3.micro        t3.small
       │             │
       └──────┬──────┘
              │
              ▼
          Nginx Server
```

Terraform creates **two EC2 instances** using `for_each`:

```text
t3.micro
t3.small
```

The EC2 instances use the `install_nginx.sh` script through `user_data`.

---

# 📁 Project Structure

```text
TerraForm-Practice/
│
├── ec2.tf                # EC2, VPC, Security Group and Key Pair
├── provider.tf           # AWS provider configuration
├── terraform.tf          # Terraform and provider requirements
├── variable.tf           # Input variables
├── outputs.tf            # Terraform outputs
├── install_nginx.sh      # EC2 startup script for Nginx
├── .gitignore
└── README.md
```

---

# 🔧 What This Project Creates

## 1. AWS Key Pair

Terraform creates an AWS key pair using a local public key:

```hcl
resource "aws_key_pair" "my_key"
```

The project expects:

```text
terraform-key-ec2.pub
```

The private key should **never** be uploaded to GitHub.

---

## 2. Default VPC

The project uses the AWS default VPC:

```hcl
resource "aws_default_vpc" "default"
```

---

## 3. Security Group

A security group is created for the EC2 instances.

The current configuration allows:

| Port | Protocol | Purpose            |
| ---: | -------- | ------------------ |
|   22 | TCP      | SSH                |
|   80 | TCP      | HTTP               |
| 8000 | TCP      | Application access |
|  All | All      | Outbound traffic   |

> ⚠️ For production, avoid opening SSH (`22`) to `0.0.0.0/0`. Restrict it to your IP address or use a safer access method.

---

## 4. EC2 Instances

The project uses Terraform `for_each` to create two EC2 instances:

```hcl
for_each = tomap({
  this_this_t3micro = "t3.micro"
  this_is_for_t3small = "t3.small"
})
```

This creates:

```text
EC2 #1 → t3.micro
EC2 #2 → t3.small
```

This is useful for learning how Terraform can create multiple resources from a collection.

---

## 5. Nginx Installation

The EC2 instances use:

```hcl
user_data = file("install_nginx.sh")
```

The script installs Nginx automatically when the instance starts.

The script also creates a simple HTML page:

```text
Terraform In One short by Shahnawaz
```

---

# 🛠️ Prerequisites

Before running this project, install:

* Terraform
* AWS CLI
* AWS account
* AWS credentials
* SSH key pair/public key

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

Configure your AWS credentials:

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

Verify the credentials:

```bash
aws sts get-caller-identity
```

⚠️ **Never commit AWS access keys or secret keys to GitHub.**

---

# 🔑 SSH Public Key

Make sure this file exists in the Terraform project directory:

```text
terraform-key-ec2.pub
```

The Terraform configuration reads this file:

```hcl
public_key = file("terraform-key-ec2.pub")
```

Never upload your private SSH key to GitHub.

For example, do **not** commit:

```text
terraform-key-ec2
```

Only the public key should be used by Terraform.

---

# 🚀 How to Run the Project

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

```bash
terraform init
```

This downloads the required Terraform provider and prepares the working directory.

---

## 3. Format Terraform Code

```bash
terraform fmt
```

To check formatting without changing files:

```bash
terraform fmt -check
```

---

## 4. Validate Configuration

```bash
terraform validate
```

This checks whether the Terraform configuration is valid.

Expected result:

```text
Success! The configuration is valid.
```

---

## 5. Create a Terraform Plan

```bash
terraform plan
```

This shows what Terraform is going to create or change.

It does **not** create the infrastructure.

---

## 6. Apply the Configuration

```bash
terraform apply
```

Terraform will show the planned changes.

Type:

```text
yes
```

Terraform will then create the AWS infrastructure.

You can also use:

```bash
terraform apply -auto-approve
```

⚠️ Use `-auto-approve` carefully because Terraform will not ask for confirmation.

---

# 📤 View Outputs

After `terraform apply`, check the outputs:

```bash
terraform output
```

You can also check a specific output:

```bash
terraform output <output_name>
```

Outputs can be useful for getting information such as:

```text
EC2 instance ID
Public IP
Public DNS
```

depending on what is defined in `outputs.tf`.

---

# 🌍 Access Nginx

After the EC2 instances are created, get their public IP addresses from:

```bash
terraform output
```

Then open the IP address in your browser:

```text
http://<EC2_PUBLIC_IP>
```

You should see the Nginx page created by the startup script.

---

# 🔄 Terraform Workflow

The normal Terraform workflow is:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

In simple words:

```text
terraform init
       ↓
Prepare Terraform

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
Create / Update AWS infrastructure
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

This removes the infrastructure managed by Terraform.

You can preview the destruction first:

```bash
terraform plan -destroy
```

⚠️ **Always destroy unused AWS resources to avoid unexpected AWS charges.**

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
| `terraform show`                  | Show Terraform state/plan    |
| `terraform state list`            | List managed resources       |
| `terraform state show <resource>` | Show resource details        |
| `terraform destroy`               | Delete infrastructure        |
| `terraform plan -destroy`         | Preview destruction          |
| `terraform console`               | Test Terraform expressions   |
| `terraform version`               | Show Terraform version       |

---

# 🧠 Terraform Concepts Practiced

This project covers several important Terraform concepts:

### Variables

Input values are defined in:

```text
variable.tf
```

Examples include:

```text
Environment
EC2 AMI ID
EC2 instance storage
```

---

### `for_each`

Used to create multiple EC2 instances:

```hcl
for_each = tomap({
  this_this_t3micro = "t3.micro"
  this_is_for_t3small = "t3.small"
})
```

---

### Conditional Expression

The project uses a conditional expression for the EC2 root volume:

```hcl
var.env == "prd" ? 20 : var.ec2_root_default_storage_size
```

In simple words:

```text
If environment = prd
        ↓
Use 20 GB

Otherwise
        ↓
Use the default storage size
```

---

### Resource Dependencies

Terraform automatically understands relationships between resources.

For example:

```text
EC2
 ↓
Security Group
 ↓
Default VPC
```

Terraform creates resources in the required order.

---

### User Data

The EC2 instance uses:

```hcl
user_data = file("install_nginx.sh")
```

This automatically runs the Nginx installation script when the instance starts.

---

# ⚠️ Security Notes

This project is for **learning and practice**.

The security group currently allows SSH from:

```text
0.0.0.0/0
```

That means SSH is open to the internet.

For a real production environment, restrict SSH access:

```text
Your IP → Port 22
```

instead of:

```text
Internet → Port 22
```

Also never commit:

```text
AWS Access Keys
AWS Secret Keys
Private SSH Keys
terraform.tfstate
terraform.tfstate.backup
```

Make sure sensitive files are included in `.gitignore`.

---

# 📚 Terraform Learning Path

This project is a good starting point for learning:

```text
Terraform Basics
      ↓
Variables
      ↓
Outputs
      ↓
Resources
      ↓
Dependencies
      ↓
for_each
      ↓
Conditional Expressions
      ↓
User Data
      ↓
AWS EC2
      ↓
Security Groups
      ↓
Terraform State
      ↓
Modules
      ↓
Remote State
      ↓
Terraform CI/CD
```

---

# 📖 References

* [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
* [Terraform CLI Documentation](https://developer.hashicorp.com/terraform/cli)
* [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [Terraform AWS EC2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

---

# 👨‍💻 Author

**TheRayRock**

GitHub: https://github.com/TheRayRock

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
