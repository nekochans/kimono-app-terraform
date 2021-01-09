terraform {
  backend "s3" {
    bucket  = "local-kimono-app-tfstate"
    key     = "cognito/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}

data "terraform_remote_state" "ses" {
  backend = "s3"

  config = {
    bucket  = "local-kimono-app-tfstate"
    key     = "ses/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}
