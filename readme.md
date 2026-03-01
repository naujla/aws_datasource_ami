Below is a clean, professional **README.md** specifically for a Terraform project that uses **data sources to fetch the latest Amazon Linux 2 or other AMIs for EC2 instances**. It follows the same style you use in your portfolio: simple, direct, and focused on what the user must change in `variables.tf`.

---

# 📘 Terraform — EC2 Latest AMI Data Source

This project demonstrates how to use Terraform **data sources** to dynamically fetch the **latest Amazon Machine Image (AMI)** for an EC2 instance. It ensures that your infrastructure always launches with the most up‑to‑date and secure image without manually updating AMI IDs.

---

## 🚀 Overview

The configuration uses the `aws_ami` data source to:

- Automatically find the latest AMI based on filters  
- Support Amazon Linux 2, Ubuntu, or any OS you choose  
- Avoid hardcoding AMI IDs  
- Keep EC2 deployments consistent and secure  

All user‑specific changes are made only in the **variables file**.

---

## 📂 Project Structure

```
ec2-latest-ami/
│
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

## ⚙️ How It Works

### 🔍 AMI Lookup Using Data Source

Terraform queries AWS for the latest AMI that matches your filters:

```hcl
data "aws_ami" "latest" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
```

You can modify the filter values in `variables.tf` to switch OS types.

---

## 💻 EC2 Instance Creation

```hcl
resource "aws_instance" "example" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}
```

---

## 🔧 Variables You Must Update

All user‑specific changes are made in **variables.tf**:

- `instance_type` — EC2 size  
- `subnet_id` — subnet where EC2 will launch  
- `instance_name` — tag for the instance  
- `ami_name_filter` — pattern for AMI lookup  
- `ami_owner` — AMI owner (e.g., amazon, canonical)

Example:

```hcl
variable "ami_name_filter" {
  description = "Filter to search for latest AMI"
  default     = "amzn2-ami-hvm-*-x86_64-gp2"
}

variable "ami_owner" {
  description = "AMI owner"
  default     = "amazon"
}
```

---

## 📤 Outputs

```hcl
output "ami_id" {
  value = data.aws_ami.latest.id
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
```

---

## ▶️ Usage

Initialize Terraform:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Apply:

```bash
terraform apply
```

---

## 📝 Notes

- Using data sources avoids hardcoding AMI IDs.  
- Always verify filters match the OS you want.  
- Amazon Linux 2, Ubuntu, and Windows AMIs can all be fetched using this pattern.  

---

If you want, I can generate the **full Terraform code (main.tf, variables.tf, outputs.tf)** to match this README.
