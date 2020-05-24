terraform {
  backend "s3" {
    bucket  = "stg-kimono-app-tfstate"
    key     = "acm/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}

