terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }
  backend "s3" {
    bucket  = "tf-poc-ax-demo"
    key     = "poc3_aws/terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
    # kms_key_id     = "THE_ID_OF_THE_KMS_KEY"
    dynamodb_table = "tfstatedynamo"
  }



}
#Configure aws provider
provider "aws" {
  region = "ap-southeast-2"
}