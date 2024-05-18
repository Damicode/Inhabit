# variable "S3" {
#     type = "String"
#   default = "eks-cluster-bucket-damier2_modules"
# }



variable "instance_type"{
    description = "Size of the respective server environement"
  type = string
  
}

variable "key_name_tag"{
    description = "Define a key.pem to ssh of the build Server"
  type = string
  

}

variable "key_name_tag_pub"{
    description = "Define a key.pem to ssh of the build Server"
  type = string
  
}

variable "aws_instance_tag"{
    description = "dynamicaly name of the instance any change need to go to rekated ENV"
  type = string
  
  
}

variable "current_region" {
    description = "Inhabit Custom Region"
  
}

variable "private_sub"{
  description = "Cidr for private subnets"
  default = "10.0.128.0/20"
  
  
}

variable "pub_sub"{
  description = "Cidr for public subnets"
  default = "10.0.0.0/24"

  
  
}

variable "vpc_cidr"{
  description = "Cidr for VPC"
  default = "10.0.0.0/16"

  
  
}

variable "images" {
    description = "Get a custom image"
  
}

