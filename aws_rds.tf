resource "aws_subnet" "private-subnet1" {
  vpc_id            = aws_vpc.tz-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "private-subnet2" {
  vpc_id            = aws_vpc.tz-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1b"
}

resource "aws_db_subnet_group" "db-subnet" {
  name       = "db-subnet-group"
  subnet_ids = ["${aws_subnet.private-subnet1.id}", "${aws_subnet.private-subnet2.id}"]
}


resource "aws_db_instance" "db" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "phpuser"
  password               = "php123456"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnet.name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
}