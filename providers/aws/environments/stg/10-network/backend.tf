terraform {
  backend "s3" {
    bucket  = "stg-kimono-app-tfstate"
    key     = "network/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}
