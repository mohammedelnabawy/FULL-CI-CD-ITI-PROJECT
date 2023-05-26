terraform {
  backend "s3" {
    bucket = "ci-cd-iti-project"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}