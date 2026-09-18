variable "ec2_intance_type" {
  default = "t3.micro"
  type    = string
}

variable "ec2_ami_id" {
  default = "ami-01a00762f46d584a1" #ubuntu
  type    = string
}

variable "ec2_root_default_storage_size" {
  default = 10
  type    = number
}

variable "env" {
  default = "dev"
  type = string
  
}
