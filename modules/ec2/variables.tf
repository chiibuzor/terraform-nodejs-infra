variable "ami" {
  type        = string
  description = "The AMI to be used for the EC2 instance."
}

variable "instance_type" {
  type        = string
  description = "The type of instance to launch."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to launch the instance in."
}

variable "key_name" {
  type        = string
  description = "The key pair name to use for SSH access."
}

variable "name" {
  type        = string
  description = "The name tag for the instance."
}

variable "security_group_id" {
  type        = string
  description = "The ID of the security group to associate with the instance."
}


