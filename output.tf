output "vpc" {
  value = aws_vpc.tz-vpc.id
}

output "ig" {
  value = aws_internet_gateway.tf-ig.id
}
output "route" {
  value = aws_route_table.tf-route.id
}