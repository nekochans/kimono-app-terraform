locals {
  name = "kimono-app"
  env  = "stg"

  azs = [
    "ap-northeast-1a",
    "ap-northeast-1c",
    "ap-northeast-1d"
  ]

  cidr = "10.1.0.0/16"

  public_subnets = [
    "10.1.0.0/24",
    "10.1.1.0/24",
    "10.1.2.0/24"
  ]

  private_subnets = [
    "10.1.10.0/24",
    "10.1.11.0/24",
    "10.1.12.0/24"
  ]

  nat_instance_ami         = "ami-016892bae608cf892"
  nat_instance_type        = "t2.micro"
  nat_instance_volume_type = "gp2"
  nat_instance_volume_size = "30"
}
