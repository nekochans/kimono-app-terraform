provider "aws" {
  region  = "ap-northeast-1"
  profile = "kimono-app-stg"
}

provider "aws" {
  region  = "us-east-1"
  profile = "kimono-app-stg"
  alias   = "us-east-1"
}
