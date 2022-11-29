# Public Route Table
resource "aws_route_table" "eks_public_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_gw.id
  }


  tags = {
    Name = "EKS-Public-Route_Table"
  }
}

# Private Route Table
resource "aws_route_table" "eks_private_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_gw.id
  }


  tags = {
    Name = "EKS-Private-Route_Table"
  }
}

# Route Table Association
# Public Route Table Association
resource "aws_route_table_association" "Public_1" {
  subnet_id      = aws_subnet.Public_1.id
  route_table_id = aws_route_table.eks_public_rt.id
}

resource "aws_route_table_association" "Public_2" {
  subnet_id      = aws_subnet.Public_2.id
  route_table_id = aws_route_table.eks_public_rt.id
}

#Private Route Table Association
resource "aws_route_table_association" "Private_1" {
  subnet_id      = aws_subnet.Private_1.id
  route_table_id = aws_route_table.eks_private_rt.id
}

resource "aws_route_table_association" "Private_2" {
  subnet_id      = aws_subnet.Private_2.id
  route_table_id = aws_route_table.eks_private_rt.id
}