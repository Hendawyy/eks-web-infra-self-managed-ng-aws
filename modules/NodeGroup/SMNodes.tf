resource "aws_autoscaling_group" "eks-asg" {
  name                = "${var.prefix}-png-asg"
  desired_capacity    = 2
  min_size            = 1
  max_size            = 3
  vpc_zone_identifier = var.Private_Subnets_ID
  launch_template {
    id      = aws_launch_template.eks-lt.id
    version = "$Latest"
  }
  health_check_type    = "EC2"
  force_delete         = true
  termination_policies = ["OldestInstance"]

  tag {
    key                 = "kubernetes.io/cluster/${var.Cluster_Name}"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/${var.Cluster_Name}"
    value               = "owned"
    propagate_at_launch = true
  }
  depends_on = [aws_launch_template.eks-lt]
}
