resource "aws_eks_node_group" "dev" {
    cluster_name = aws_eks_cluster.this.name
    node_group_name = "dev-nodes"
    node_role_arn = aws_eks_cluster.this.arn
    subnet_ids = var.private_subnets

    scaling_config {
      desired_size = 2
      max_size = 3
      min_size = 1
    }
    instance_types = ["t3.medium"]
    capacity_type = "ON_DEMAND"

    depends_on = [ 
        aws_iam_role_policy_attachment.worker_policies
     ]

}
