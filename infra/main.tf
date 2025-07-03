provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "flask_repo" {
  name = var.ecr_repo_name
}

resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_cluster_name
}

resource "aws_iam_role" "ecs_task_execution" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}


lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
    ignore_changes        = [name]
}







resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
