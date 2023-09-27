/*variable "instance_name" {
        description = "Name of the instance to be created"
        default = "awsbuilder-demo"
}*/

variable "instance_type" {
        default = "t2.micro"
}
variable "ami_id" {
        description = "The AMI to use"
        default = "ami-09d56f8956ab235b3"
}
variable "device_name" {
    type = string
    default = "/dev/xvdb"
}
variable "availability_zone" {
    type = string
    default = "ap-southeast-2a"
}
variable "sgname" {
    type = string
    default = "allow_tls"
}
variable "key_name" {
    type = string
    default = "newkeypair"
}
variable "size" {
    type = number
    default = 5
}