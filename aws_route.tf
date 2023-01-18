resource "aws_route_table" "tf-route" {
  vpc_id = aws_vpc.tz-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-ig.id
  }

  tags = {
    Name = "tf-route"
  }
}

resource "aws_route_table_association" "tf-subnet-as" {
  subnet_id      = aws_subnet.tf-subnet.id
  route_table_id = aws_route_table.tf-route.id
}