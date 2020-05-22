resource "aws_s3_bucket" "api_alb_logs" {
  bucket        = "${var.sg_alb_name}-logs"
  force_destroy = true
}

data "aws_iam_policy_document" "put_api_alb_logs_policy" {
  statement {
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.api_alb_logs.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.aws_elb_service_account.id]
    }
  }
}

resource "aws_s3_bucket_policy" "api" {
  bucket = aws_s3_bucket.api_alb_logs.id
  policy = data.aws_iam_policy_document.put_api_alb_logs_policy.json
}
