# module "ec2" {
#   source        = "./modules/ec2"
#   image_id      = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   user = var.users
# }

# Creating Instance
resource "aws_instance" "s1" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key-tf.key_name
  vpc_security_group_ids      = ["${aws_security_group.allow_tls.id}"]
  subnet_id                   = aws_subnet.tf-subnet.id
  tags = {
    Name = "server1"
  }
  //user_data = file("${path.module}/server.sh")
  connection {
    type        = "ssh"
    user        = var.user
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "main.yml"
    destination = "/tmp/main.yml"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo amazon-linux-extras install ansible2 -y",
  #     "sudo echo '${self.public_ip}' > custom.ini",
  #     #"sudo ansible-playbook -i custom.ini /tmp/main.yml"
  #     "sudo ansible-playbook /tmp/main.yml"
  #   ]

  # }
  provisioner "remote-exec" {
    script = "./script.sh"
  }


}

