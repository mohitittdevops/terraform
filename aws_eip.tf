#Create an Elastic IP
resource "aws_eip" "lb" {
  vpc = true
}

#Associate EIP with EC2 Instance
resource "aws_eip_association" "eip-association" {
  instance_id   = aws_instance.s1.id
  allocation_id = aws_eip.lb.id
}