resource "aws_sns_topic" "ecom-sns" {
  name = "${var.env}_ecom-user-updates-topic"
}

resource "aws_sns_topic_policy" "default" {
  arn = aws_sns_topic.ecom-sns.arn

  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "211125373436",
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.ecom-sns.arn,
    ]

    sid = "__default_statement_ID"
  }
}

resource "aws_sns_topic_subscription" "user_updates_email_target" {
  # topic_arn = "arn:aws:sns:us-east-1:211125373436:ecom-user-updates-topic"
  topic_arn = aws_sns_topic.ecom-sns.arn
  protocol  = "email"
  endpoint = "sharayu.potuwar@gmail.com"
  
}