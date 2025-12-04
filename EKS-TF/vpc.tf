# -------------------------
#  VPC (existing)
# -------------------------
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# -------------------------
#  Internet Gateway
# -------------------------
data "aws_internet_gateway" "igw" {
  filter {
    name   = "tag:Name"
    values = [var.igw_name]
  }
}

# -------------------------
#  Existing Subnet 1
# -------------------------
data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

# -------------------------
#  Create Subnet 2
# -------------------------
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = data.aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name2
  }
}

# -------------------------
#  Default Security Group
# -------------------------
data "aws_security_group" "sg_default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }

  vpc_id = data.aws_vpc.vpc.id
}

# -------------------------
#  Route Table
# -------------------------
resource "aws_route_table" "rt2" {
  vpc_id = data.aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt_name2
  }
}

# -------------------------
#  Route Table Association
# -------------------------
resource "aws_route_table_association" "rt_association2" {
  route_table_id = aws_route_table.rt2.id
  subnet_id      = aws_subnet.public_subnet2.id
}
