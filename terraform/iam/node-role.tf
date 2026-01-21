resource "aws_iam_role" "eks_node_role" {
    name = "eks-node-role-dev"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Effect = "Allow"
            Principal = {
                Service = "ec2.amazon.com"
            }
            Action = "sts.AssumeRole"
        }]
    })
}

resource "aws_iam_role_policy_attachment" "worker_policies" {
    for_each = toset([
        "AmazonEKSWorkerNodePolicy",
        "AmazonEc2ContainerRegistryReadOnly",
        "AmazonEKS_CNI_Policy"
    ])
    role = aws_iam_role.eks_node_role.name
    policy_arn = "arn:aws:iam::aws:policy/${each.value}"

}