resource "aws_iam_role" "lambda_role" {
    name = var.lambda_role_name
    assume_role_policy = jsonencode({
        "Version" = "2012-10-17"
        "Statement" = [
        {
            "Action" = "sts:AssumeRole"
            "Effect" = "Allow"
            "Principal" = {
            "Service" = "lambda.amazonaws.com"
            }
        },
        ]
    })
}
resource "aws_iam_policy" "lambda_policy" {
    name = var.lambda_policy_name
    policy = jsonencode({
    "Version"= "2012-10-17"
    "Statement" = [
      {
        "Effect"   = "Allow",
        "Action"   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" = "*"
      },
    ]
  })
}

resource "aws_iam_role" "sfsm_role" {
    name = var.sfsm_role_name
    assume_role_policy = jsonencode({
        "Version" = "2012-10-17"
        "Statement" = [
        {
            "Action" = "sts:AssumeRole"
            "Effect" = "Allow"
            "Principal" = {
            "Service" = "states.amazonaws.com"
            }
        },
        ]
    })
}
resource "aws_iam_policy" "sfsm_policy" {
    name = var.sfsm_policy_name
    policy = jsonencode({
    "Version" = "2012-10-17"
    "Statement" = [
      {
        "Effect"   = "Allow",
        "Action"   = [
          "lambda:InvokeFunction"
        ],
        "Resource"= "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_role_attach" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "sfsm_role_attach" {
  role = aws_iam_role.sfsm_role.name
  policy_arn = aws_iam_policy.sfsm_policy.arn
}