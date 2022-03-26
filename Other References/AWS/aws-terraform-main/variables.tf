variable "profile" {
  type    = string
  default = "default"
}

variable "region-master" {
  type    = string
  default = "us-east-1"
}
variable "region-worker" {
  type    = string
  default = "us-east-2"
}

variable "external_ip" {
  type    = string
  default = "142.119.90.214/32"
}

variable "instance-type" {
  type    = string
  default = "t3.micro"
}

variable "workers-count" {
  type    = number
  default = 1
}

variable "webserver-port" {
  type    = number
  default = 80
}