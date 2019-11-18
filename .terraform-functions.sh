#!/usr/bin/env sh

function _tf_plan_file () {
  workspace=$(cat .terraform/environment 2>/dev/null || echo 'default')
  mktemp -t "tf-plan_${workspace}"
}

function tf-workspace () {
  workspace="${1}"
  if [ -z "${workspace}" ]; then
    terraform workspace show
  else
    terraform workspace select "${workspace}"
  fi
}

# aliases
alias tf-init="terraform init"
alias tf-plan='terraform plan -detailed-exitcode -out=$(eval _tf_plan_file)'
alias tf-apply="terraform apply"
alias tf-refresh="terraform refresh"
alias tf-fmt="terraform fmt"
alias tf-ls-workspace="terraform workspace list"
#alias tf-workspace="terraform workspace select"
