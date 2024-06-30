terraform {
  backend "s3" {
    bucket = "terraform-state-f-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }

}
