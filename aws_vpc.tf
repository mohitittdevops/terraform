resource "aws_vpc" "tz-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tz-vpc"
  }
}