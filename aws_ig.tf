resource "aws_internet_gateway" "tf-ig" {
  vpc_id = aws_vpc.tz-vpc.id

  tags = {
    Name = "tf-ig"
  }
}