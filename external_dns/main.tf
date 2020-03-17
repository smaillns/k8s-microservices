terraform {
  backend "s3" {
    bucket = "udacity-tf-bucket"
    key    = "externaldns/terraform.tfstate"
    region = "eu-west-3"
  }
}
