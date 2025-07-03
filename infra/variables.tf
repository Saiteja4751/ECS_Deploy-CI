variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ecr_repo_name" {
  description = "ECR repository name"
  default     = "flask-ecr"
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  default     = "flask-cluster"
}
