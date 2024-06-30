variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "ZONE2" {
  default = "ap-south-1b"
}

variable "ZONE3" {
  default = "ap-south-1c"
}

variable "AMI" {
  type = map(any)
  default = {
    "ap-south-1" = "ami-0e1d06225679bc1c5"
    "us-east-1"  = "ami-0e1d0622567sdfs5"
  }
}

