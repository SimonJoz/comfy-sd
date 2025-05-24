variable "aws_profile" {
  type        = string
  default     = "default"
  description = "The AWS CLI profile to use for authentication."
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region in which to deploy resources."
}

variable "project_prefix" {
  type        = string
  default     = "comfy-ui"
  description = "Prefix used to name AWS resources for this project."
}

variable "ec2_instance_type" {
  default     = "g4dn.xlarge"
  description = "The EC2 instance type to use (e.g., for GPU workloads)."
}

variable "ebs_volume_size" {
  default     = 100
  description = "The size of the EBS volume attached to the EC2 instance, in GiB."
}

variable "open_ports" {
  type        = list(string)
  default     = ["8188", "22"]
  description = "List of TCP ports to open to the public (restricted to your IP)."
}
