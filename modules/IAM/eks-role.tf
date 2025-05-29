resource "aws_iam_role" "eks" {
  name               = "${var.prefix}-${var.eks_name}-Cluster"
  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement":[
      {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "eks.amazonaws.com"
        }
      }
    ]
  }
POLICY
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}
