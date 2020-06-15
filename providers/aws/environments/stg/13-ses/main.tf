module "ses" {
  source = "../../../../../modules/aws/ses"

  email_address = var.email_address

  providers = {
    aws = aws.us-east-1
  }
}
