resource "aws_iam_user" "api_deploy" {
  name = var.api_deploy_user
}

resource "aws_iam_user_policy_attachment" "ecs" {
  user       = aws_iam_user.api_deploy.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerServiceFullAccess"
}

resource "aws_iam_user_policy_attachment" "ecr" {
  user       = aws_iam_user.api_deploy.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_user_policy_attachment" "cognito" {
  user       = aws_iam_user.api_deploy.id
  policy_arn = aws_iam_policy.cognito.arn
}

resource "aws_iam_policy" "cognito" {
  name   = "cognito_crate_test_user"
  path   = "/"
  policy = data.aws_iam_policy_document.cognito.json
}

data "aws_iam_policy_document" "cognito" {
  statement {
    effect = "Allow"
    actions = [
      "cognito-idp:AdminConfirmSignUp"
    ]
    resources = [var.cognito_arn]
  }
}
