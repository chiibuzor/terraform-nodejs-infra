variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the Internet Gateway will be attached."
}

variable "name" {
  type        = string
  description = "The name of the Internet Gateway."
}
