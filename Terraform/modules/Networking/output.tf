output "vpc_info" {
  description = "A key-value map of VPC details."
  value = {
    vpc_id             = aws_vpc.vpc.id
    vpc_arn            = aws_vpc.vpc.arn
    vpc_name           = aws_vpc.vpc.tags["Name"]
    availability_zones = var.availability_zones

    public_subnets  = aws_subnet.public_subnet[*]
    private_subnets = aws_subnet.private_subnet[*]

    internet_gateway = aws_internet_gateway.ig

    # NAT Gateway information
    nat_gateways = {
      for idx, nat in aws_nat_gateway.nat : idx => nat
    }


    # Public Route Table information
    public_route_tables = {
      id           = aws_route_table.public.id
      arn          = aws_route_table.public.arn
      routes       = aws_route.public_internet_gateway.destination_cidr_block
      associations = aws_route_table_association.public[*]
    }

    # Private Route Tables information (using a for expression)
    private_route_tables = {
      for idx, rt in aws_route_table.private : idx => {
        id           = rt.id
        arn          = rt.arn
        routes       = aws_route.private_nat_gateway[idx].destination_cidr_block
        associations = aws_route_table_association.private[idx]
      }
    }
  }
}
