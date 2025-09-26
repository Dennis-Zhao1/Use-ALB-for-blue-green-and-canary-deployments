resource "aws_instance" "green" {
  count = var.enable_green_env ? var.green_instance_count : 0

  ami                    = "ami-06a974f9b8a97ecf2"
  instance_type          = "t3.micro"
  subnet_id              = module.vpc.private_subnets[count.index % length(module.vpc.private_subnets)]
  vpc_security_group_ids = [module.app_security_group.security_group_id]
  user_data = templatefile("${path.module}/init-script.sh", {
    file_content = "version 1.1 - #${count.index}"
  })

  tags = {
    Name = "green-${count.index}"
  }
}