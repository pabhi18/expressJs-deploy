variable "region" {
    description = "AWS Region"
    type = string
    default = "us-east-1"
}

variable "ami_id" {
    description = "AMI Value Ubuntu"
    type = string
    default = "ami-0866a3c8686eaeeba"
}

variable "key_pair" {
    description = "key pair"
    type = string
    default = "terraform-key"
}