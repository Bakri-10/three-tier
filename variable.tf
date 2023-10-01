variable "Public_cidr_block1" {
  type    = string
  default = "10.0.1.0/24"
}

variable "Public_cidr_block2" {
  type    = string
  default = "10.0.2.0/24"
}

variable "Private_cidr_block1" {
  type    = string
  default = "10.0.11.0/24"
}
variable "Private_cidr_block2" {
  type    = string
  default = "10.0.12.0/24"
}
variable "Private_cidr_block3" {
  type    = string
  default = "10.0.13.0/24"
}
variable "Private_cidr_block4" {
  type    = string
  default = "10.0.14.0/24"
}




variable "nat_gateway" {
  type    = string
  default = "Sigmatek_NAT"
}


# variable "all_ips" {
#   type = list
#   default = ["0.0.0.0/0"]
# }


variable "security_group_name" {
  type    = string
  default = "ALL-ACCESS"
}


variable "EC2_security_group_name" {
  type    = string
  default = "EC2_SG"
}
variable "DB_security_group_name" {
  type    = string
  default = "DB_SG"
}


variable "lauch_template" {
  type    = string
  default = "Sigmatek-template"
}

variable "image_id" {
  type    = string
  default = "ami-03a6eaae9938c858c"
}

variable "load_balancer" {
  type    = string
  default = "Sigmatek-lb"
}

