#!/usr/bin/env sh

echo "Setting up Powerline"

if [ -d "${HOME}/.customfonts" ]; then
  powerline_folder="${HOME}/.yadm/.oh-my-zsh/custom/themes/powerlevel9k"
  echo " - Powerline already installed @ ${powerline_folder}; updating..."
  ( cd ${powerline_folder} && git pull > /dev/null 2>&1 )
else
  echo " - Installing Powerline..."
  powerline_tmp=$(mktemp -d -t powerline)
  git clone https://github.com/bhilburn/powerlevel9k.git ${powerline_folder} > /dev/null 2>&1
fi


echo " - Installing Powerline fonts..."
fonts_tmp=$(mktemp -d -t powerline_fonts)
git clone https://github.com/powerline/fonts.git ${fonts_tmp} > /dev/null 2>&1
/bin/bash ${fonts_tmp}/install.sh
rm -rf ${fonts_tmp}

ln -nfs "${HOME}/.yadm/.powerline" "${HOME}/.powerline"

echo "Done!"
