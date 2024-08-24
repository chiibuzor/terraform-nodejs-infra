provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = "10.0.0.0/16"
  name        = "my-vpc"
}

# First public subnet in AZ1
module "subnet1" {
  source             = "./modules/subnet"
  vpc_id             = module.vpc.vpc_id
  cidr_block         = "10.0.1.0/24"
  availability_zone  = "us-east-1a"
  name               = "my-public-subnet-1"
}

# Second public subnet in AZ2
module "subnet2" {
  source             = "./modules/subnet"
  vpc_id             = module.vpc.vpc_id
  cidr_block         = "10.0.2.0/24"
  availability_zone  = "us-east-1b"
  name               = "my-public-subnet-2"
}

module "internet_gateway" {
  source  = "./modules/internet_gateway"
  vpc_id  = module.vpc.vpc_id
  name    = "my-internet-gateway"
}

module "route_table" {
  source             = "./modules/route_table"
  vpc_id             = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  subnet_id          = module.subnet1.subnet_id
  name               = "my-public-route-table"
}

module "security_group" {
  source      = "./modules/security_group"
  name        = "my-security-group"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = module.vpc.vpc_id
}

module "ec2" {
  source             = "./modules/ec2"
  ami                = "ami-0a0e5d9c7acc336f1" 
  instance_type      = "t2.micro"  
  subnet_id          = module.subnet1.subnet_id
  key_name           = "expatswap"  
  name               = "my-ec2-instance"
  security_group_id  = module.security_group.security_group_id
}

module "alb" {
  source            = "./modules/alb"
  name              = "my-application-load-balancer"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = [module.subnet1.subnet_id, module.subnet2.subnet_id]  
  security_group_id = module.security_group.security_group_id
  instance_id       = module.ec2.instance_id
}