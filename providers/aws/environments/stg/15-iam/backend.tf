terraform {
  backend "s3" {
    bucket  = "stg-kimono-app-tfstate"
    key     = "iam/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}

data "terraform_remote_state" "cognito" {
  backend = "s3"

  config = {
    bucket  = "stg-kimono-app-tfstate"
    key     = "cognito/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}
