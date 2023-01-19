variable "instance_type" {
  type = string
}
variable "ports" {
  type = list(number)
}

variable "region" {
  type = string
}
variable "owner" {
  type = number
}
variable "user" {
  type = string
}
variable "ami_name" {
  type = string
}