terraform {
  backend "s3" {
    bucket  = "local-kimono-app-tfstate"
    key     = "ses/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}
