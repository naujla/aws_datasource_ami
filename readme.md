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

---

