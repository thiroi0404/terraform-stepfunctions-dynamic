resource "aws_sfn_state_machine" "sfsm" {
  name = var.sfsm_name
  type = "STANDARD"
  role_arn = var.sfsm_role_arn
  definition = templatefile(
    "${path.module}/sfsm_definition.json",
    {
        VAR_STORE_CODES = var.store_codes
        VAR_TIMEOUTSECONDS = var.timeoutseconds
        VAR_LAMBDA_ARN = var.lambda_arn
    }
  )
} 
