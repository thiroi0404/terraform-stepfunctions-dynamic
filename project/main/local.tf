locals {
    store_codes = [
        "01",
        "02",
        "03",
        "04",
        "05"
    ]

    lambda_name = "test-lambda"
    lambda_role_name = "test-lambda-role"
    lambda_policy_name = "test-lambda-policy"
    sfsm_name = "test-sfsm"
    sfsm_role_name = "sfsm-role"
    sfsm_policy_name = "sfsm-policy"
    sfsm_timeoutseconds = 3600
}