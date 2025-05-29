resource "aws_subnet" "public_subnet" {
  count                   = var.Public_Subnets_count
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.my_vpc.cidr_block, 8, count.index)
  availability_zone       = element([var.zone1, var.zone2], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name                                                  = "${var.prefix}-Public-Subnet-${count.index + 1}"
    "kubernetes.io/role/elb"                              = "1"
    "kubernetes.io/cluster/${var.prefix}-${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = var.Private_Subnets_count
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.my_vpc.cidr_block, 8, count.index + 2)
  availability_zone = element([var.zone1, var.zone2], count.index)
  tags = {
    Name                                                  = "${var.prefix}-Private-Subnet-${count.index + 1}"
    "kubernetes.io/role/internal-elb"                     = "1"
    "kubernetes.io/cluster/${var.prefix}-${var.eks_name}" = "owned"
  }
}
