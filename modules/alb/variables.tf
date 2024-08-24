variable "name" {
  type        = string
  description = "The name of the ALB."
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where the ALB will be created."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to attach to the ALB."
}

variable "security_group_id" {
  type        = string
  description = "The security group ID to associate with the ALB."
}

variable "instance_id" {
  type        = string
  description = "The ID of the EC2 instance to be registered with the target group."
}
