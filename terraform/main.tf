provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}

data "aws_ami" "amazon_linux_cuda" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Deep Learning Base OSS Nvidia Driver GPU AMI (Ubuntu 22.04)*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

locals {
  prefix        = var.project_prefix
  instance_type = var.ec2_instance_type
  my_ip_cidr    = "${chomp(data.http.my_ip.response_body)}/32"
}

output "ami_name" {
  value = {
    id   = data.aws_ami.amazon_linux_cuda.id
    name = data.aws_ami.amazon_linux_cuda.name
  }
}

output "instance_ip" {
  value = {
    ip = aws_instance.this.public_ip
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "public" {
  key_name   = "devops-${local.prefix}-key"
  public_key = tls_private_key.this.public_key_openssh
}

resource "local_file" "private" {
  content         = tls_private_key.this.private_key_pem
  filename        = "${path.module}/rsa_private.pem"
  file_permission = "0400"
}

resource "aws_security_group" "this" {
  name        = "${local.prefix}-sg"
  description = "Security group for ${local.prefix}."
}

resource "aws_security_group_rule" "ingress" {
  for_each = toset(var.open_ports)

  description       = "Allow TCP port ${each.value}"
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = [local.my_ip_cidr]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "egress" {
  description       = "Allow all egress."
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_instance" "this" {
  ami             = data.aws_ami.amazon_linux_cuda.id
  instance_type   = local.instance_type
  key_name        = aws_key_pair.public.key_name
  user_data       = file("./user_data.sh")
  security_groups = [aws_security_group.this.name]

  # Enforcing IMDSv2
  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  root_block_device {
    volume_size = var.ebs_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "${local.prefix}-instance"
  }
}
