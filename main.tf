# Search for latest Amazon AMI and Filter based on requirement
data "aws_ami" "name" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

    filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

output "aws-ami" {
  value = data.aws_ami.name.id
}

#Create resource using the ami image search based on filter
resource "aws_instance" "name" {
  ami = data.aws_ami.name.id
  instance_type = "t3.nano"
}

