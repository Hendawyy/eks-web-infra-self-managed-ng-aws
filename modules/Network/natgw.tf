resource "aws_eip" "nat" {
  domain = "vpc"
  tags = {
    Name = "${var.prefix}-nat"
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = {
    Name = "${var.prefix}-natgw"
  }
  depends_on = [aws_internet_gateway.igw]
}
