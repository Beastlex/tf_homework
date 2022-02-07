variable "location" {
  type    = string
  default = "northeurope"
}

variable "postfix" {
  type    = string
  default = "alzver-hw02"
}

variable "owner" {
  type    = string
  default = "Aleksandr_Zverev1@epam.com"
}

variable "pglogin" {
  type    = string
  default = "psqladmin"
}

variable "pgpasswd" {
  type    = string
  default = "!SoStr0ngPassword"
}

variable "dbname" {
  type    = string
  default = "demodb"
}
