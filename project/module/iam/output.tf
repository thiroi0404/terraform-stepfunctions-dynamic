output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}
output "sfsm_role_arn" {
  value = aws_iam_role.sfsm_role.arn
}