variable "rg_name" {
  type    = string
  default = "epm-rdsp"
}

variable "vnc_name" {
  type    = string
  default = "epm-rdsp-eastus-vnet"
}

variable "subnet_name" {
  type = string
  default = "epm-rdsp-eastus-subnet"
}

variable "sg_name" {
  type = string 
  default = "epm-rdsp-eastus-sg"
}
