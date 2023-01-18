# Creating Instance
resource "aws_instance" "s1" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

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
    source      = "/modules/ec2/main.yml"
    destination = "/tmp/main.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install ansible2 -y",
      "sudo ansible-playbook /tmp/main.yml"
    ]

  }

}

