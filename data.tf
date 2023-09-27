/*data "aws_ami" "poc4" {
  #executable_users = ["self"]
  most_recent      = true
 # name_regex       = "^myami-\\d{3}"
 # owners           = ["self"]

  filter {
    name   = "image-id"
    values = ["ami-06e2b86bab2edf4ee"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}*/