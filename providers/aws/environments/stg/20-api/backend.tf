terraform {
  backend "s3" {
    bucket  = "stg-kimono-app-tfstate"
    key     = "api/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket  = "stg-kimono-app-tfstate"
    key     = "network/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}

data "terraform_remote_state" "acm" {
  backend = "s3"

  config = {
    bucket  = "stg-kimono-app-tfstate"
    key     = "acm/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}

data "terraform_remote_state" "ecr" {
  backend = "s3"

  config = {
    bucket  = "stg-kimono-app-tfstate"
    key     = "ecr/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kimono-app-stg"
  }
}
