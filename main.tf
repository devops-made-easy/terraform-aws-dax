# Create DAX Subnet Group
resource "aws_dax_subnet_group" "subnet_group" {
  name       = var.name
  subnet_ids = var.subnet_ids
}
# Create DAX Subnet Group
resource "aws_dax_parameter_group" "parameter_group" {
  name = var.name

  parameters {
    name  = "query-ttl-millis"
    value = var.query_ttl
  }

  parameters {
    name  = "record-ttl-millis"
    value = var.record_ttl
  }
}

# Create DAX Cluster
resource "aws_dax_cluster" "cluster" {
  cluster_name       = var.name
  iam_role_arn       = var.iam_role_arn
  node_type          = var.node_type
  replication_factor = var.node_count
  server_side_encryption {
    enabled = var.server_side_encryption
  }
  parameter_group_name = aws_dax_parameter_group.parameter_group.name
  subnet_group_name    = aws_dax_subnet_group.subnet_group.name
  maintenance_window   = var.maintenance_window
  security_group_ids   = var.security_group_ids
}



