resource "aws_eks_node_group" "dev" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "dev-ng"
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = var.private_subnets

  instance_types = ["t3.medium"]
  capacity_type  = "ON_DEMAND"

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_policies
  ]
}
