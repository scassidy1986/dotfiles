#!/usr/bin/env sh

function is_linux () {
  [[ $('uname') == 'Linux' ]];
}

function is_osx () {
  [[ $('uname') == 'Darwin' ]]
}

function cd() {
    builtin cd "$@" && ll 
}

function clean_path () {
  if [ -n "${PATH}" ]; then
    old_PATH=${PATH}:; PATH=
    while [ -n "${old_PATH}" ]; do
      x=${old_PATH%%:*}       # the first remaining entry
      case ${PATH}: in
        *:"${x}":*) ;;          # already there
        *) PATH=${PATH}:${x};;    # not there yet
      esac
      old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
  fi
}

function _export_kubeconfig () {
  PS3="Select a kube config: "
  files=($(ls -1 ${HOME}/.kube/*.kubeconfig | xargs -n 1 basename))
  select konfig in "${files[@]}" "Quit";
  do
    if [ "${konfig}" = "Quit" ]; then
      return 0
    fi
    konfig_file="${HOME}/.kube/${konfig}"
    if [ ! -e "${konfig_file}" ]; then
      echo "Kube config for ${konfig} not found (${konfig_file})"
      return 1
    fi
    echo "Setting Kubectl config to '${konfig}'"
    export KUBECONFIG=${konfig_file}
    echo " > KUBECONFIG ${KUBECONFIG}"
    return 0
  done
}

