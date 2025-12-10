
variable "ami" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_security_group_ids"{
 }

variable "zone_id" {
  default =  "Z055196614WSVQYU4VYMA"

}

variable "component" {
  default = {
    frontend = ""
    mongodb = ""
    redis = ""
    catalogue = ""
    mysql = ""
    user = ""
    cart = ""
    shipping = ""
    rabbitmq = ""
    payment = ""
  }
}