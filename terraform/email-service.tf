resource "aws_ses_domain_identity" "ecom_identity" {
  domain = "ecom.com"
}

data "aws_iam_policy_document" "ses_doc" {
  statement {
    actions   = ["SES:*"]
    resources = [aws_ses_domain_identity.ecom_identity.arn]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}

resource "aws_ses_identity_policy" "ecom_id_policy" {
  identity = aws_ses_domain_identity.ecom_identity.arn
  name     = "ecom_identity_policy"
  policy   = data.aws_iam_policy_document.ses_doc.json
}