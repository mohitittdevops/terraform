resource "aws_subnet" "tf-subnet" {
  vpc_id            = aws_vpc.tz-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf-subnet"
  }
  depends_on = [
    aws_vpc.tz-vpc
  ]
}