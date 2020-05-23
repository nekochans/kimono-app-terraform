terraform {
  backend "s3" {
    bucket  = "stg-kimono-app-tfstate"
    key     = "ecr/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}
