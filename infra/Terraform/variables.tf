variable "app_name" {
  type        = string
  description = "Application Name"
}

variable "app_environment" {
  type        = string
  description = "Application Environment"
  default = "develop"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "public_subnets" {
  description = "Terraform subnet_1"
}

variable "private_subnets" {
  description = "Terraform subnet_2"
}

variable "aws_cluster_name" {
  type        = string
  description = "Terraform cluster"
  default     = "cluster"
}

variable "availability_zones" {
  description = "List of availability zones"
}

variable "aws_network_interface" {
  type        = string
  description = "Terraform network interface"
  default     = "network_interface"
}

variable "ssh_key_pair" {
  type        = string
  description = "SSH key-pair"
}

variable "instance_availability_zone" {
  description = "Instance zonne"
}

variable "instance_ami" {
  description = "Instance ami"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
}