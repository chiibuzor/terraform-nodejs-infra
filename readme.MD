Terraform Code to Deploy the following Infrastructure to AWS
1. Setup VPC and Networking (Simplified):
Create a Virtual Private Cloud (VPC) with one public subnet.
Attach an Internet Gateway to the VPC.
2. Set up a route table to allow internet access from the public subnet.
3. Launch an EC2 Instance:
4. Launch a single EC2 instance in the public subnet.
5. Configure the security group to allow HTTP (port 80) traffic from anywhere.
6. Ensure the application is accessible via the public IP address of the EC2 instance.
7. Set Up an Elastic Load Balancer (ELB):
8. Configure an Application Load Balancer (ALB) in front of the EC2 instance.
9. Ensure that the ALB routes traffic to the EC2 instance.
10. Configure basic health checks to monitor the EC2 instance.

Directory Structure

terraform-nodejs-infra/
│
├── main.tf                # Main entry point for Terraform configuration, calls all modules.
│
├── modules/               # Directory containing all reusable modules.
│   ├── vpc/               # VPC module.
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── subnet/            # Subnet module (for creating public subnets).
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── internet_gateway/  # Internet Gateway module.
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── route_table/       # Route Table module for public subnets.
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security_group/    # Security Group module for HTTP and SSH access.
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/               # EC2 module for the Node.js instance.
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── alb/               # Application Load Balancer (ALB) module.
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
      
