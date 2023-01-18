data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = [var.owner]

  filter {
    name   = "name"
    values = ["${var.ami_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

# output "ami_id" {
#   value = data.aws_ami.ubuntu.id
# }