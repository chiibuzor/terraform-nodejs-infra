variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the route table will be created."
}

variable "internet_gateway_id" {
  type        = string
  description = "The ID of the Internet Gateway to attach to the route table."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to associate with the route table."
}

variable "name" {
  type        = string
  description = "The name of the route table."
}
