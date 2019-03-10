#!/bin/bash

source ${HOME}/.logging
source .helpers

log_info "Setting up Powerline"

powerlevel_folder="${HOME}/.oh-my-zsh/custom/themes/powerlevel9k"

if [ -d "${powerlevel_folder}" ]; then
  log_info " - Powerline already installed @ ${powerline_folder}; updating..."
  ( cd ${powerline_folder} && git pull > /dev/null 2>&1 )
else
  log_info " - Installing Powerlevel9k..."
  git clone https://github.com/bhilburn/powerlevel9k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel9k
fi

log_info " - Installing Powerline fonts..."
tmp_template=$(temp_folder "powerline_fonts")
fonts_tmp=$(mktemp -d -t ${tmp_template})
git clone https://github.com/powerline/fonts.git ${fonts_tmp} > /dev/null 2>&1
/bin/bash ${fonts_tmp}/install.sh
rm -rf ${fonts_tmp}

if [ -e "${HOME}/.yadm/.powerlevel" ]; then
  ln -nfs "${HOME}/.yadm/.powerlevel" "${HOME}/.powerlevel"
fi

log_info "Done!"
