#!/usr/bin/env sh

function _tf_plan_file () {
  workspace=$(terraform workspace show)
  mktemp -t "tf-plan_${workspace}"
}

# aliases
alias tf-plan-file="_tf_plan_file"
