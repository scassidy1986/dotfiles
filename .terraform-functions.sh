#!/usr/bin/env sh

function _tf_plan_file () {
  workspace=$(cat .terraform/environment 2>/dev/null || echo 'default')
  mktemp -t "tf-plan_${workspace}"
}

# aliases
alias tf-init="terraform init"
alias tf-plan="terraform plan -out=$(_tf_plan_file)"
alias tf-apply="terraform apply"
alias tf-refresh="terraform refresh"
alias tf-fmt="terraform fmt"
alias tf-ls-workspace="terraform workspace list"
alias tf-workspace="terraform workspace select"
