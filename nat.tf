resource "aws_eip" "eks_eip" {
  vpc = true

  tags = {
    Name = "EKS_EIP"
  }
}

resource "aws_nat_gateway" "eks_nat" {
  allocation_id = aws_eip.eks_eip.id
  subnet_id     = aws_subnet.Public_1.id

  tags = {
    Name = "EKS-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_gw]
}