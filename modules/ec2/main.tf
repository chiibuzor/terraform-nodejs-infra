resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  # Attach the security group created
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = true

  tags = {
    Name = var.name
  }


  # Block device mappings (optional)
  root_block_device {
    volume_type = "gp2"
    volume_size = 20
  }
}
