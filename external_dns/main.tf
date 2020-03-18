terraform {
  backend "s3" {
    bucket = "udacity-tf-bucket2"
    key    = "externaldns/terraform.tfstate"
    region = "eu-west-1"
  }
}
