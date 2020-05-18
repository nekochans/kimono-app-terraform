module "ecr_api" {
  source = "../../../../../modules/aws/ecr"

  ecr_name = local.ecr_api_name
}
