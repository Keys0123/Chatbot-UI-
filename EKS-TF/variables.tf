variable "vpc_name" {
  type    = string
  default = "my-vpc"
}

variable "igw_name" {
  type    = string
  default = "my-igw"
}

variable "rt_name2" {
  type    = string
  default = "my-public-rt-2"
}

variable "subnet_name" {
  type    = string
  default = "public-subnet-1"
}

variable "subnet_name2" {
  type    = string
  default = "public-subnet-2"
}

variable "security_group_name" {
  type    = string
  default = "default-sg"
}

variable "iam_role_eks" {
  type    = string
  default = "eks-cluster-role"
}

variable "iam_role_node" {
  type    = string
  default = "eks-nodegroup-role"
}

variable "iam_policy_eks" {
  type    = string
  default = "eks-cluster-policy"
}

variable "iam_policy_node" {
  type    = string
  default = "eks-nodegroup-policy"
}

variable "cluster_name" {
  type    = string
  default = "my-eks-cluster"
}

variable "eksnode_group_name" {
  type    = string
  default = "my-eks-nodegroup"
}
