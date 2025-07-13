module "lambda" {
  source = "../module/lambda"
  lambda_name = local.lambda_name
  lambda_role_arn = module.iam.lambda_role_arn
}

module "iam" {
  source = "../module/iam"
  lambda_role_name = local.lambda_role_name
  lambda_policy_name = local.lambda_policy_name
  sfsm_role_name = local.sfsm_role_name
  sfsm_policy_name = local.sfsm_policy_name
}

module "sfsm" {
  source = "../module/sfsm"
  sfsm_name = local.sfsm_name
  sfsm_role_arn = module.iam.sfsm_role_arn
  timeoutseconds = local.sfsm_timeoutseconds
  store_codes = local.store_codes
  lambda_arn = module.lambda.lambda_arn
}


